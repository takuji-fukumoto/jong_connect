ALTER TABLE "public"."users" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "public"."avatars" ENABLE ROW LEVEL SECURITY;

create policy "Authenticated users can view all avatars"
  on public.avatars for select to authenticated using ( true );

create policy "Authenticated users can view all group_matches"
  on public.group_matches for select to authenticated using ( true );

create policy "Authenticated users can view all group_match_results"
  on public.group_match_results for select to authenticated using ( true );