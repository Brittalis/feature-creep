# Feature Creep

A 3D arena game you design while you play: pick 1 of 3 cards every sprint until the game you built beats you.

Play it at https://brittalis.github.io/feature-creep/ once GitHub Pages is on (Settings → Pages → Deploy from branch `main`, folder `/`).

## How it plays
One continuous run. Every 20 s a card appears on the plate; roll into it to pause and pick 1 of 3. Picks cycle Rule → Prompt → Modifier, every 10th pick offers a cut, and a boss arrives every 200 s.

- **Rules** change how the game works, including arena shape, floor, tilt, edge, sky and scale. Cards that share a slot replace each other.
- **Prompts** are events that pay a bounty when you come through them.
- **Modifiers** multiply a card you own, or rewire when a prompt fires.
- **Structural cards** change how cards arrive (Draft Rules), how you choose (Draft Styles) and how you score (Economies).
- **Synergies** are rare cards offered once you own both of their parents.

## Leaderboard
The leaderboard stays hidden until `LB = {url, key}` near the top of the script in `index.html` is filled in. `leaderboard.sql` sets up the scores table for a Supabase project. The `sprints` column holds minutes survived. Scores are stamped with `GAME_VERSION` (in `index.html`); bump it when a release changes balance, and the "Current Version" tab starts fresh. Existing projects need the migration at the bottom of `leaderboard.sql`.
