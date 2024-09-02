create policy "Users can delete groups that they have joined"
  on public.groups for delete using (is_joinned_group(id));

create policy "Group joinner can create other joinner"
  on public.user_joinned_groups for insert with check (is_joinned_group(group_id));

create policy "Group joinner can delete other joinner"
  on public.user_joinned_groups for delete using (is_joinned_group(group_id));

CREATE OR REPLACE FUNCTION "public"."edit_group"(id bigint, join_user_ids uuid[], group_name text, group_description text, image_url text) RETURNS void
  LANGUAGE "plpgsql" SECURITY INVOKER
  AS $$
begin
  if array_length(edit_group.join_user_ids, 1) = 0 then
    raise exception 'join_user_ids should not be Empty';
  end if;

  update public.groups 
  set
    name = edit_group.group_name,
    description = edit_group.group_description,
    image_url = edit_group.image_url
  where
    groups.id = edit_group.id;

  -- 対象に入っていないユーザーはグループから削除
  delete from user_joinned_groups
  where user_joinned_groups.group_id = edit_group.id and user_joinned_groups.user_id > ALL(edit_group.join_user_ids);

  -- 対象ユーザーをupsert
  insert into public.user_joinned_groups (user_id, group_id)
  select unnest(edit_group.join_user_ids), edit_group.id
  on conflict (user_id, group_id)
  do nothing;
end
$$;

CREATE OR REPLACE FUNCTION "public"."exit_from_group"(group_id bigint) RETURNS void
  LANGUAGE "plpgsql" SECURITY INVOKER
  AS $$
DECLARE	
  left_user_count bigint;
begin
  -- 対象に入っていないユーザーはグループから削除
  delete from user_joinned_groups
  where group_id = exit_from_group.id and user_id = auth.uid();

  select
    count(user_id) into left_user_count
  from
    user_joinned_groups
  where
    group_id = exit_from_group.group_id
  group by group_id;

  -- グループに誰も居なくなった場合グループごと削除
  if left_user_count = 0 then
    delete from groups
    where id = exit_from_group.group_id;
  end if;

end
$$;

