You have permission to operate on my local folder of PDF invoices and rename files.

Goal
Rename every PDF invoice in the current folder to:
  YYYY-MM-DD Company.pdf
If it’s a refund/credit, append “ Refund” before .pdf:
  YYYY-MM-DD Company Refund.pdf

Scope
• Work only in the current folder (non-recursive).
• Target files with .pdf or .PDF extension.

How to extract fields (from PDF contents)
1) Date:
   • Prefer the official invoice date. Search common labels in order:
     "Invoice Date", "Date of invoice", "Issue Date", "Billing Date", "Datum", "Rechnungsdatum", "Date".
   • Accept formats: YYYY-MM-DD, YYYY/MM/DD, DD.MM.YYYY, DD/MM/YYYY, Month D, YYYY.
   • Normalize to YYYY-MM-DD.
   • If multiple dates exist, prefer the one near “Invoice”, “Invoice #”, or in the header; otherwise the earliest date on the first page.

2) Company name:
   • Prefer the seller/issuer (not the customer/bill-to).
   • Heuristics, in order:
     - The largest header/name at the top-left/top-center of page 1.
     - Entity preceding words like “Invoice”, “Tax Invoice”, “Receipt”, “Credit Note”.
     - The name tied to “From”, “Vendor”, “Seller”, “Supplier”.
   • Clean up suffixes/legal forms only if present: remove ", Inc.", "Inc", "LLC", "Ltd", "GmbH", "AG", "S.A.", "Sàrl", "KG", "e.U.", "Corp." etc.
   • Preserve brand styling/casing (e.g., “Fly.io”, “ngrok”, “Fluxon UI”, “Anthropic”, “Austrian Airlines”).
   • If the document is clearly a refund/credit, capture the word “Refund” later (see below).

3) Refund detection:
   • If the PDF mentions “Refund”, “Credit”, “Gutschrift”, “Credit Note”, “Erstattung”, “Erstattungsbeleg”, or negative total, treat as refund → append “ Refund” to the filename.

Filename rules
• Format exactly: YYYY-MM-DD␠Company[␠Refund].pdf
• Replace forward slashes or illegal characters in company names with hyphens; trim extra spaces.
• Collapse multiple spaces to one.
• Avoid duplicates: if the target name already exists, append a counter: " (2)", " (3)", etc.

Process
1) Dry-run:
   • For each PDF, open, extract text, compute DATE and COMPANY, detect REFUND, and propose NEW_NAME.
   • Show a table of Old Name → New Name → Confidence (High/Medium/Low) with short reasoning.
   • Flag any file where DATE or COMPANY is ambiguous; do not rename those yet.

2) Execute:
   • After displaying the dry-run table, proceed to rename all rows with confidence High or Medium.
   • Leave Low-confidence items untouched and list the questions you need from me to resolve them.

3) Summary:
   • Report:
     - Count renamed
     - Count skipped (with reasons)
     - Any duplicates handled
