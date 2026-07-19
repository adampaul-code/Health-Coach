-- Run this once in Supabase: Dashboard -> SQL Editor -> New Query -> paste -> Run

create table if not exists clear_track_data (
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  key text not null,
  value text not null,
  updated_at timestamptz default now(),
  primary key (user_id, key)
);

alter table clear_track_data enable row level security;

create policy "select own rows" on clear_track_data
  for select using (auth.uid() = user_id);

create policy "insert own rows" on clear_track_data
  for insert with check (auth.uid() = user_id);

create policy "update own rows" on clear_track_data
  for update using (auth.uid() = user_id);

create policy "delete own rows" on clear_track_data
  for delete using (auth.uid() = user_id);
