ALTER TABLE "public"."group_icons" ENABLE ROW LEVEL SECURITY;

create policy "Authenticated users can view all group_icons"
  on public.group_icons for select to authenticated using ( true );

DROP TABLE "public"."group_session_results", "public"."group_round_results", "public"."user_group_round_results";
