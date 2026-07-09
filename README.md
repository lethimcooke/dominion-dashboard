# Mission Control

Personal dashboard: daily goals, habits, long-term goals, finance, gym tracker, and the Dominion project. One shared Supabase database, so every device sees the same data.

## One-time setup

1. **Create the database table.** Open the Supabase dashboard > SQL Editor > New query. Paste the entire contents of `supabase-schema.sql` and click Run. You should see "Success. No rows returned."

2. **Deploy to Netlify.** Go to https://app.netlify.com/drop and drag this whole folder onto the page. Netlify gives you a live URL immediately. (To rename it: Site settings > Change site name.)

3. **Create your account.** Open the live URL, enter your email and a password, and hit "Create account." If Supabase asks you to confirm your email, click the link it sends, then sign in.
   - Optional: to skip email confirmation entirely, go to Supabase dashboard > Authentication > Sign In / Providers > Email and turn off "Confirm email."

4. **On your phone:** open the URL in Safari, sign in, then Share > Add to Home Screen. It now launches like an app.

## Updating the app later

The site auto-deploys from GitHub (`lethimcooke/dominion-dashboard`, branch `main`). Any pushed commit is live at prismatic-trifle-1a96e1.netlify.app about 30 seconds later. No manual steps.

## Notes

- `serve.py` is only for local testing (`python3 serve.py`, then http://127.0.0.1:4173). Netlify ignores it.
- Export backup (sidebar) downloads all your data as JSON. Import restores it.
- Data is protected by Supabase row-level security: each account can only read and write its own rows.
