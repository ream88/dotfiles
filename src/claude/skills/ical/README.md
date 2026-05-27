# iCal Event Importer

Extracts flight or train information from various sources and generates iCalendar (.ics) files.

## Usage

```
/ical
```

Then drop in your travel information in any format:

- Plain text description
- Screenshot of a booking confirmation
- An existing .ics file you want re-formatted
- Email/booking confirmation text
- ÖBB SCOTTY train details

## Supported event kinds

| Kind   | Title format                              | Emoji |
|--------|-------------------------------------------|-------|
| Flight | `[ORIGIN_IATA] ✈️ [DESTINATION_IATA]`     | ✈️    |
| Train  | `[OriginCity] 🚄 [DestinationCity]`       | 🚄    |

## Examples

### Flight

```
/ical

Flight from Vienna to New York on February 15, 2026.
Departure: 9:30 AM
Arrival: 1:45 PM (local time)
Flight OS 87
```

Produces an event titled `VIE ✈️ JFK`.

### Train (ÖBB SCOTTY)

```
/ical

Linz 🚄 Wien
ab: 11:28 (UTC+2); 18.05.2026
an: 12:47 (UTC+2); 18.05.2026
Verkehrsmittel: ICE 21
Von: Linz/Donau Hbf
Nach: Wien Hbf (Bahnsteige 3-12)
Bstg. 10A-E
```

Produces an event titled `Linz 🚄 Wien` with full SCOTTY-style details in the description.

### Round trip / multiple legs

Provide multiple flights or trains and the skill emits one `VEVENT` per leg inside a single `.ics` file.

## What it does

1. **Extracts** travel data from your input
2. **Verifies** information via web search when needed (airport addresses, IATA codes, train schedules)
3. **Generates** an .ics file with proper timezones, summary, location, and description
4. **Saves** the file to the current directory (or a path you specify)

## Importing

- Double-click the `.ics` file to add it to your default calendar
- Or import manually in Apple Calendar / Google Calendar / Outlook / any RFC 5545 client

## Version

2.0.0 — adds train event support; renamed from `flight-to-ical` to `ical`.
