# Feature Creep

Every merge ships a release. In the same PR:
1. Add a new entry on top of `RELEASES` in `index.html` with a bumped version (1.1.1, 1.1.2, ... one step per merge; bump the minor for big releases) and short "What's new" notes for that merge only.
2. If the change affects scoring or balance, say so in the notes; scores are stamped with the version and the leaderboard's "Current Version" tab filters on it.
