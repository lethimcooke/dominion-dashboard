-- Mission Control schema. Paste this whole file into
-- Supabase Dashboard > SQL Editor > New query, then click Run.

create table if not exists public.app_state (
  user_id    uuid not null references auth.users (id) on delete cascade,
  module     text not null,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, module)
);

alter table public.app_state enable row level security;

drop policy if exists "own rows select" on public.app_state;
drop policy if exists "own rows insert" on public.app_state;
drop policy if exists "own rows update" on public.app_state;
drop policy if exists "own rows delete" on public.app_state;

create policy "own rows select" on public.app_state
  for select using (auth.uid() = user_id);
create policy "own rows insert" on public.app_state
  for insert with check (auth.uid() = user_id);
create policy "own rows update" on public.app_state
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own rows delete" on public.app_state
  for delete using (auth.uid() = user_id);
