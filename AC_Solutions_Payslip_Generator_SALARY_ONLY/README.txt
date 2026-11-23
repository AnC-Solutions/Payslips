AC Solutions Payslip Generator — Supabase configuration in code

1. Create a Supabase project and run supabase_setup.sql in the SQL Editor.
2. In Supabase Authentication, create an email/password user (or enable email signup and create one using Supabase).
3. Open index.html in a text editor. Set SUPABASE_URL and SUPABASE_PUBLISHABLE_KEY near the beginning of the script.
4. Open index.html in a browser. Connection runs automatically. If there is no saved session, a browser prompt requests email and password. The session persists in that browser, so later launches generally require no sign-in.
5. Upload Excel employees once and generate payroll. Records are saved in Supabase.

The cloud configuration and login panel have been removed from the page. Credentials are NOT hardcoded: putting a password in frontend source is unsafe, and a publishable key does not bypass Supabase Row Level Security.

Use a trusted HTTPS-hosted site for production rather than opening via file://. Do not put a Supabase service_role or secret key in HTML/JavaScript. Browser prompts are a minimal login mechanism; use a dedicated authenticated login page for production.

No live Supabase project was supplied, so live connection tests were not possible.
