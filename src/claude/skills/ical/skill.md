---
name: ical
version: 2.0.0
description: |
  Extract flight or train information from text, screenshots, PDFs, or other data sources
  and generate an iCalendar (.ics) file with properly formatted events. Supports flights
  (with IATA codes) and trains (e.g. ÖBB SCOTTY format).
allowed-tools:
  - Read
  - Write
  - WebSearch
  - WebFetch
  - mcp__chrome-devtools__take_screenshot
  - AskUserQuestion
---

# iCal Event Importer (Flights & Trains)

You extract travel information from text, screenshots, PDFs, or booking confirmations and
generate a valid iCalendar (.ics) file. You support two event kinds:

- **Flights** — title format `[ORIGIN_IATA] ✈️ [DESTINATION_IATA]`
- **Trains** — title format `[OriginCity] 🚄 [DestinationCity]`

If the input is ambiguous about which kind of event it is, ask the user.

---

## Common Rules

### iCalendar Skeleton

Generate a valid RFC 5545 iCalendar file:

```
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//ical skill//EN
CALSCALE:GREGORIAN
METHOD:PUBLISH
BEGIN:VEVENT
UID:[unique-id]@ical-skill
DTSTAMP:[current-timestamp-utc]
DTSTART:[departure-time]
DTEND:[arrival-time]
SUMMARY:[title]
LOCATION:[location]
DESCRIPTION:[details]
STATUS:CONFIRMED
SEQUENCE:0
END:VEVENT
END:VCALENDAR
```

### DateTime Format

- UTC times: `YYYYMMDDTHHmmssZ` (e.g. `20260518T092800Z`)
- Local times with timezone: `DTSTART;TZID=Europe/Vienna:20260518T112800`

Prefer the form the source uses; UTC is safest. Multi-line `DESCRIPTION` fields must escape
newlines as `\n`.

### Output

- Filename: short and descriptive (e.g. `VIE_JFK_2026-02-15.ics`, `Linz_Wien_2026-05-18.ics`).
- Save to the current directory unless the user specifies another path.
- After writing, show extracted details, file path, and a one-line import hint.

### Multiple Segments

If the input contains multiple legs (round trip, connections), emit one `VEVENT` per leg
inside a single `VCALENDAR`.

---

## Flights

### Title
`[ORIGIN_IATA] ✈️ [DESTINATION_IATA]` — e.g. `VIE ✈️ JFK`

### Location
Full postal address of the **departure airport** (look up with WebSearch if needed).
Example: `Vienna International Airport, Wien-Flughafen, 1300 Schwechat, Austria`

### Times
Departure → DTSTART, arrival → DTEND. Always include timezone info — pay attention to
timezone changes across the flight.

### Description
Flight number, airline, aircraft type, booking reference — whatever is available.

### Process
1. Extract IATA codes, times, flight number, airline.
2. If IATA codes are missing but city names are present, search for the correct code.
3. WebSearch the departure airport address.
4. Verify ambiguous times or timezones via WebSearch if needed.
5. Write the .ics file.

---

## Trains

Common source: ÖBB SCOTTY confirmation emails or .ics files. Other rail operators
(DB, SBB, SNCF, Trenitalia) follow the same pattern.

### Title
`[OriginCity] 🚄 [DestinationCity]` — **city names only**, no station suffix, no
"Verbindung:", no platform info.

Examples:
- `Linz 🚄 Wien` (not `Linz/Donau Hbf 🚄 Wien Hbf`)
- `München 🚄 Berlin`
- `Zürich 🚄 Mailand`

### Location
Departure station including platform if known.
Example: `Linz/Donau Hbf Bstg. 10A-E`

### Times
Departure → DTSTART, arrival → DTEND. Use the user's source timezone; convert to UTC
(`Z` suffix) when emitting, mirroring the SCOTTY-generated .ics convention.

### Description
Put all verbose detail here, mirroring SCOTTY layout when applicable:

```
Von: [full origin station]
Nach: [full destination station]
ab: HH:MM (UTC±N); DD.MM.YYYY
an: HH:MM (UTC±N); DD.MM.YYYY
Dauer: X Std. Y Min.
Umstiege: N
Verkehrsmittel: [train number, e.g. ICE 21]

Fahrtverlauf:

HH:MM - Abfahrt [station], Bstg. [platform]
      mit [train] Richtung [direction]
HH:MM - Ankunft [station], Bstg. [platform]

Verbindung in SCOTTY ansehen: [URL]
```

Use whichever fields are present in the input; do not invent platforms or train numbers.

### Process
1. Identify origin/destination city (strip station suffixes like "Hbf", "/Donau", "Bahnhof").
2. Extract departure/arrival times with timezone.
3. Capture full station names, platforms, train number, SCOTTY URL.
4. Write the .ics file.

---

## Examples

### Flight (text input)

> Flight from Vienna to New York on Feb 15, 2026, departing 9:30 AM, arriving 1:45 PM local time, OS 87

→ Title `VIE ✈️ JFK`, location Vienna airport address, two timezones, OS 87 in description.

### Train (ÖBB SCOTTY input)

> Von: Linz/Donau Hbf → Wien Hbf, ab 11:28 (UTC+2) 18.05.2026, an 12:47, ICE 21, Bstg. 10A-E

→ Title `Linz 🚄 Wien`, location `Linz/Donau Hbf Bstg. 10A-E`, full SCOTTY-style block in DESCRIPTION.

---

## Edge Cases

- **Mixed multi-modal trip** (flight + train): one VEVENT per leg, each with the correct emoji.
- **Ambiguous IATA** (NYC → JFK/LGA/EWR?): infer from flight number/airline, else ask.
- **Missing data**: try to infer, then WebSearch, then ask via AskUserQuestion.
- **Daylight saving boundary**: be explicit about timezone; prefer UTC output.

---

## Verification Resources

- `[Flight number] schedule` (e.g. `OS 87 schedule`)
- `[IATA] airport full address`
- `[Train number] [route]` (e.g. `ICE 21 Linz Wien`)
- SCOTTY: https://fahrplan.oebb.at/
