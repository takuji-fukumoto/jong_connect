create trigger on_auth_user_created
    after insert on auth.users
    for each row
    execute function handle_new_user();

ALTER TABLE ONLY "public"."user_joinned_groups"
  ADD CONSTRAINT "user_joinned_groups_user_id_and_group_id_key" UNIQUE ("user_id", "group_id");

-- CREATE OR REPLACE FUNCTION "public"."fetch_joined_groups"() RETURNS public.groups[]
--   LANGUAGE "plpgsql" SECURITY invoker
--   AS $$
-- DECLARE	
--   target_group  public.groups%rowtype;
--   out_groups public.groups[];
--   i  int;
-- begin
--   i := 0;
--   for target_group in 
--   select
--    * 
--   from public.groups
--   inner join public.user_joinned_groups on id = user_joinned_groups.group_id
--   where user_joinned_groups.user_id = auth.uid()
--   loop
--     i := i + 1;
--     out_groups[i] = target_group;
--   end loop;

--   return out_groups;
-- end
-- $$;


CREATE OR REPLACE FUNCTION "public"."create_group"(join_user_ids uuid[], group_name text, group_description text) RETURNS bigint
  LANGUAGE "plpgsql" SECURITY invoker
  AS $$
DECLARE	
  out_group_id bigint;
begin
  if array_length(join_user_ids, 1) = 0 then
    raise exception 'join_user_ids should not be Empty';
  end if;

  insert into public.groups("name", "description")
  values 
    (create_group.group_name, create_group.group_description)
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

-- create or replace function is_friend(user_id uuid) returns boolean 
--   language sql security definer
-- as $$
-- DECLARE	
--   my_friend_id bigint;
-- begin
--   select
--     friend_id
--   from public.users
--   where id = auth.uid()
--   limit 1
--   returning friend_id into my_friend_id;

--   select exists(
--     select id
--     from friends
--     where user_id = is_friend.user_id and friend_id = my_friend_id
--   );
-- end
-- $$;


-- TODO: ポリシーがおかしいので要修正
create policy "Users can all access on authenticated"
  on public.groups for all to authenticated using (true);
create policy "Users can all access on authenticated"
  on public.user_joinned_groups for all to authenticated using (true);

-- create policy "Users can view groups that they have joined"
--   on public.groups for select using (is_joinned_group(id));

-- create policy "Users can update groups that they have joined"
--   on public.groups for update using (is_joinned_group(id));

-- create policy "Group joinner can view other joinner"
--   on public.user_joinned_groups for select using (is_joinned_group(group_id));

-- create policy "Users can insert groups on authenticated"
--   on public.groups for insert
--   to authenticated
--   with check( true );