# Know-How Now

A web app that helps users identify devices (e.g. appliances, gadgets), view step-by-step instructions and manuals, and watch video guides. Users can search by uploading a photo or typing a device name, then browse related models, save favorites, and contribute video guides.

---

## Key features

- **Scanner (home)** — Identify a device by uploading a photo or entering its name. The app uses AI to match the device and show its instructions and related models.
- **Device search & instructions** — Each device has a detail page with text instructions, optional video guide, and a link to the manual. Users can select alternative models from the same product line.
- **Video guides** — Authenticated users can upload video instructions for devices. Videos are shown on the device page and listed under Explore and contributor profiles.
- **Explore** — Browse recently added devices and popular guides. Open device or video pages from the Explore feed.
- **Profile & saved manuals** — Sign in to manage your profile, upload videos, view “My Uploads,” and save devices to your bookmarks (Saved Manuals).

---

## Tech stack

- **Ruby on Rails 8** — Server-side app, views, and API
- **PostgreSQL** — Database
- **Devise** — User authentication
- **Hotwire (Turbo, Stimulus)** — Fast, minimal-JS front end
- **Bootstrap 5** — Layout and UI
- **Cloudinary** — Image and video uploads and storage
- **Redcarpet** — Markdown rendering for instructions
- **LLM integration** — Device identification and instruction generation (e.g. `ruby_llm`)
- **ngrok** — Optional: expose local server for mobile testing

---

## Setup

1. **Clone the repo and enter the project**
   ```bash
   git clone <repo-url>
   cd know-how-now
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Database**
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Environment**
   - Copy `.env.example` to `.env` (if present) and set any required keys (e.g. Cloudinary, LLM API).
   - Ensure PostgreSQL is running and `config/database.yml` matches your local DB settings.

5. **Run the app**
   ```bash
   rails server
   ```
   Open [http://localhost:3000](http://localhost:3000).

---

## Running the app and using ngrok for mobile testing

- **Local only**
  - Start the server: `rails server` (or `rails s`).
  - Use the app in the browser at `http://localhost:3000` (or the port Puma reports).

- **Mobile testing with ngrok**
  1. Start Rails: `rails server`.
  2. In another terminal, start ngrok and point it at your Rails port (default 3000):
     ```bash
     ngrok http 3000
     ```
  3. ngrok will show a public URL (e.g. `https://abc123.ngrok.io`). Open that URL on your phone to use the app over the internet.
  4. If your app uses redirects or links that assume `localhost`, you may need to set `config.hosts` in `config/environments/development.rb` to allow the ngrok host, e.g.:
     ```ruby
     config.hosts << /.*\.ngrok(-free)?\.app/
     config.hosts << "your-subdomain.ngrok.io"  # or use a regex for your ngrok domain
     ```
  5. For file uploads (camera/gallery) and Web Share to work on mobile, use the **https** ngrok URL.

---

## License

Proprietary. All rights reserved.
