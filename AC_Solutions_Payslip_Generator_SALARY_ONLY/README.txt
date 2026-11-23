AC Solutions Payslip Generator — Supabase edition

1. Create a project at https://supabase.com/dashboard.
2. In SQL Editor run supabase_setup.sql once on a new project.
3. In Authentication > Providers, enable Email authentication. Confirm-email settings determine whether a verification email is required.
4. Open index.html (preferably serve it using a local web server, e.g. python -m http.server 8000, then http://localhost:8000).
5. Copy Project URL and publishable/anon key from Supabase project settings/API keys into the app. NEVER paste the service_role or secret key.
6. Click Connect Supabase. Create account, confirm email if needed, and Sign in.
7. Upload employee Excel once. The imported employees are upserted into the cloud. Generate payslips; each employee/month record is saved to Supabase.
8. On another device open the same app, enter the same Supabase URL/key, and sign in with the same account. Data loads from the cloud.

Important:
- This version stores employee data and payroll as JSONB rows, and preserves the existing payslip calculations and layout.
- It does not migrate prior browser-only records automatically. Export old records first and re-import employees; historic payroll would require a separate migration.
- Re-import updates matching employee IDs but does not delete employees absent from the new file.
- All users have separate records by default. Team-wide sharing requires explicit role-based access design.
- Export payroll periodically and configure backups. Handle employee data according to your privacy and security requirements.
- A live internet connection is required for cloud saves and loads; XLSX library is also CDN-loaded.
- Use a dedicated trusted deployment with HTTPS for production. Do not store service_role credentials in browser code.
- Confirm that your organization's PF/PT calculation rules are lawful before using generated payslips for payroll.
