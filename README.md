# 🛫 Joel Flight Operations Center

A (lovingly sarcastic) live mission-control dashboard for tracking your boss's
heroic, delayed journey to Oslo. One file. No build step. Host it anywhere.

## What it does

- **Live "time not-in-Norway" counter** ticking up since scheduled departure
- **Countdown to ETA** in Oslo
- **Auto-depleting "patience reserves"** gauge
- **Animated map** of the AMS → OSL route with a moving ✈️
- **Real live Oslo weather** (via Open-Meteo — no API key needed)
- **Rolling sarcastic status feed** ("€6.50 airport coffee acquired. Morale restored.")
- **Rotating Norway facts** ("Norway once knighted a penguin.")
- **Departure-lounge bingo** (tap squares when spotted — saves your progress)

## Run it locally

Just open `index.html` in any browser. That's it.

## Setup (optional)

Click **⚙ Setup** in the top-right to set:

- The traveller's name (defaults to *Joel*)
- The real flight number (e.g. `KL1143`)
- Scheduled departure + delayed arrival times
- An optional **AeroDataBox API key** for *real* live flight tracking

Everything is stored in the browser's localStorage — nothing is sent anywhere
except the (keyless) weather call and, if you add a key, the flight API.

### Want REAL flight tracking?

1. Make a free account at
   [rapidapi.com → AeroDataBox](https://rapidapi.com/aedbx-aedbx/api/aerodatabox).
2. Copy your RapidAPI key.
3. Paste it (plus the flight number) into ⚙ Setup.

Without a key, the dashboard runs a flattering comedy **simulation** (scheduled
~90 min ago, "new estimate" ~105 min out) so it looks great out of the box.

> Note: the route map is preset to Amsterdam → Oslo. To change the airports,
> edit the `AIRPORTS` object near the top of the `<script>` in `index.html`.

## Hosting it (so Joel can open a link)

Pick whichever is easiest for you:

### GitHub Pages (free)
```bash
cd joel-oslo-tracker
git init && git add . && git commit -m "Joel Oslo tracker"
gh repo create joel-oslo-tracker --public --source=. --push
gh api -X POST repos/:owner/joel-oslo-tracker/pages -f "source[branch]=main" -f "source[path]=/"
```
Then visit `https://<your-username>.github.io/joel-oslo-tracker/`.

### Netlify Drop (no account needed)
Drag the `joel-oslo-tracker` folder onto <https://app.netlify.com/drop>. Done.

### Vercel
```bash
npx vercel --prod
```

## Files
- `index.html` — the entire app (HTML + CSS + JS, self-contained)
- `README.md` — this file
