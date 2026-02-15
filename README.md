 # Runation
  
Conquer territory by running. Runation is a gamified running app that turns your Strava activities into a real-world territory conquest game. Compete with friends to claim the most ground across major French cities — every run you complete captures the area it covers on the map.
  
  # How It Works

1. Connect your Strava account** — Authenticate via OAuth to link your running data.
2. Create or join a game — Pick a city (Paris, Lyon, Marseille, Lille, Toulouse, or Rilly-sur-Loire), set the number of players and game duration in days.
3. Run and conquer Go for runs in the selected city. Each run's GPS trace forms a polygon on the map, representing captured territory.
4. Import your runs — After each activity, import your latest Strava runs into the game. The system validates that runs fall within the game boundaries and calculates the territory you've claimed.
5. Climb the leaderboard — Your score is the total unique surface area you've covered. Overlapping territory between your own runs is deduplicated — only new ground counts.

# Features
- Interactive territory map — Real-time visualization of all players' conquered zones with color-coded polygons, click-to-inspect popups, and game boundary display.
- Live leaderboard — Rankings based on unique surface area captured (km²), with percentage of total game area covered.
- In-game chat — Comment system for players to communicate during an ongoing game.
- Notifications — Alerts when games start, players join, or games end.
- Player profiles — Customizable nickname, title, and profile photo.
 
# Tech Stack

| Layer | Technology |
|-------|-----------|
| **Backend** | Ruby on Rails 7.1.5 (Ruby 3.3.5) |
| **Database** | PostgreSQL |
| **Frontend** | Stimulus.js controllers, Turbo (Hotwire), ERB templates |
| **CSS** | Bootstrap 5.2, Font Awesome |
| **Maps** | Mapbox GL JS 3.1.2 |
| **Geospatial** | RGeo (with GEOS backend), rgeo-geojson, fast-polylines |
| **Auth** | Devise (local) + Strava OAuth 2.0 |
| **Strava API** | strava-ruby-client gem |
| **Image Hosting** | Cloudinary (via Active Storage) |
| **Asset Pipeline** | Import Maps + Sprockets |
| **Web Server** | Puma |
| **Deployment** | Docker (multi-stage build) |

# Technical Complexities

1. Strava OAuth Integration
 The app implements a full OAuth 2.0 flow with Strava. Users are redirected to Strava's authorization page with `activity:read_all` scope. Upon callback, the authorization code is exchanged for access and refresh tokens, which are stored on the Player model. The `strava-ruby-client` gem handles API communication. Activities are fetched on demand (manual "Import Runs" button) rather than via webhooks — keeping the architecture simpler at the cost of real-time sync. Only activities with sport type "Run" are imported, and duplicate prevention relies on checking `strava_activity_id` uniqueness.

2. Polygon Computation & Territory Scoring

This is the core algorithmic challenge. Each Strava activity includes an encoded polyline (Google Polyline format) representing the GPS trace. The pipeline works as follows:
1. Decode — `FastPolylines.decode()` converts the encoded string into an array of `[lat, lon]` coordinate pairs.
2. Downsample — Large polylines are downsampled to reduce computational load (every 10th point for 200+ coordinates, every 5th for 100-200, etc.). The first and last points are forced equal to ensure polygon closure.
3. Build polygon — RGeo's GEOS factory creates Point objects from coordinates, assembles them into a LinearRing, then wraps it in a Polygon. Invalid polygons (self-intersecting traces) are repaired via `make_valid`.
4. Spatial validation — Each run polygon is checked against the game boundary polygon using `within?` to ensure it falls inside the playable area.
5. Score computation — Runs are processed chronologically. The first run gets its full polygon area as score. For each subsequent run, the intersection with all previously scored runs is calculated and subtracted — only newly conquered territory counts. This uses RGeo's `intersection()` and `difference()` operations.
6. Surface conversion** — Polygon areas are returned in degrees² by RGeo and converted to km² using an approximation factor (`area * 8547`).

3. Map Rendering

The app uses two distinct Stimulus controllers for map display:
- `mappending_controller` — Renders the game boundary as a simple black outline polygon. Used on game creation and lobby screens. Non-interactive on list views for performance.
- `mapongoing_controller` — Renders the full game state: boundary polygon + all player run polygons as filled, color-coded GeoJSON layers.
- Coordinate inversion**: Strava polylines decode to `[lat, lon]` order, but GeoJSON/Mapbox expects `[lon, lat]`. The backend explicitly inverts coordinates before passing data to the frontend via Stimulus values.
- Data flow: The Rails controller calls `Games::ComputeRunsLayers` to generate layer data (coordinates, color, player info), serializes it to JSON, and passes it as Stimulus controller values. The JavaScript then converts this into GeoJSON features and adds them as Mapbox vector layers.
