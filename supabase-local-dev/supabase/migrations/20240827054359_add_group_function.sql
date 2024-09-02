create or replace trigger on_auth_user_created
    after insert on auth.users
    for each row
    execute function "public"."handle_new_user"();

ALTER TABLE "public"."groups" ADD COLUMN image_url text DEFAULT '' NOT NULL;

ALTER TABLE ONLY "public"."user_joinned_groups"
  ADD CONSTRAINT "user_joinned_groups_user_id_and_group_id_key" UNIQUE ("user_id", "group_id");

CREATE OR REPLACE FUNCTION "public"."create_group"(join_user_ids uuid[], group_name text, group_description text, image_url text) RETURNS bigint
  LANGUAGE "plpgsql" SECURITY DEFINER
  AS $$
DECLARE	
  out_group_id bigint;
begin
  if array_length(join_user_ids, 1) = 0 then
    raise exception 'join_user_ids should not be Empty';
  end if;

  insert into public.groups("name", "description", "image_url")
  values 
    (create_group.group_name, create_group.group_description, create_group.image_url)
  returning id into out_group_id;

  insert into public.user_joinned_groups (user_id, group_id)
  select unnest(create_group.join_user_ids), out_group_id;

  return out_group_id;
end
$$;

create or replace function is_joinned_group(group_id bigint) returns boolean 
  language sql security definer
as $$
  select exists(
    select id
    from public.user_joinned_groups
    where group_id = is_joinned_group.group_id and user_id = auth.uid()
  );
$$;

create policy "Users can view groups that they have joined"
  on public.groups for select to authenticated using (is_joinned_group(id));

create policy "Users can update groups that they have joined"
  on public.groups for update to authenticated using (is_joinned_group(id));

create policy "Group joinner can view other joinner"
  on public.user_joinned_groups for select using (is_joinned_group(group_id));
