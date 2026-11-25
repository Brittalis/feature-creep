-- Feature Creep leaderboard. Paste into Supabase: SQL Editor -> New query -> Run.
create table public.scores (
  id         bigint generated always as identity primary key,
  name       text not null check (char_length(name) between 1 and 16 and name !~ '[<>]'),
  score      integer not null check (score between 0 and 5000000),
  sprints    integer not null check (sprints between 1 and 500),
  picks      integer not null default 0 check (picks between 0 and 1000),
  mode       text not null default 'normal' check (mode in ('normal','daily')),
  code       text not null default '' check (char_length(code) <= 400),
  created_at timestamptz not null default now()
);
create index scores_score_idx on public.scores (score desc);

-- Anyone may read and add scores. Nobody but you (in the dashboard) may edit or delete them.
alter table public.scores enable row level security;
create policy "public read"   on public.scores for select to anon using (true);
create policy "public insert" on public.scores for insert to anon with check (true);

-- Newer Supabase projects don't give the public role access to new tables automatically.
grant select, insert on public.scores to anon;
grant usage on sequence public.scores_id_seq to anon;
