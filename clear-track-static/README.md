# Clear Track (static, Supabase-backed)

No build step, no Node, no Vercel — this is a single HTML file.

## Setup (one-time)

1. In Supabase: Project Settings -> API. Copy the "Project URL" and the
   "anon public" key.
2. Open index.html and paste them in near the top:
     window.SUPABASE_URL = "..."
     window.SUPABASE_ANON_KEY = "..."
3. In Supabase: SQL Editor -> paste the contents of setup.sql -> Run.
   This creates the table and locks it down so only you can read/write
   your own rows.
4. Check Authentication -> Providers -> Email is enabled (it is by
   default). Magic-link sign-in is what the app uses — no password.

## Hosting

Any static host works. Simplest: GitHub Pages.
1. Push this folder to a GitHub repo.
2. Repo Settings -> Pages -> Deploy from branch -> main -> / (root).
3. GitHub gives you a URL like https://yourname.github.io/repo-name/
4. Open that on your phone, sign in once with the email link, then
   Add to Home Screen.

## Notes
- First time you open it, enter your email, then click the link it
  emails you — that logs you in and the app remembers you after that.
- Data now lives in Supabase, so it's the same on your phone and any
  other device you sign into with the same email.
