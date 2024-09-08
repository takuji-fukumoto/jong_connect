create or replace function is_joinned_group_from_session(group_session_id bigint) returns boolean 
  language sql security definer
as $$
  select exists(
    select groups.id
    from public.groups
    inner join public.user_joinned_groups 
        on (groups.id = user_joinned_groups.group_id and user_joinned_groups.user_id = auth.uid())
    inner join public.group_session_results 
        on (groups.id = group_session_results.group_id and group_session_results.id = is_joinned_group_from_session.group_session_id)
  );
$$;

create or replace function is_joinned_group_from_round(group_round_id bigint) returns boolean 
  language sql security definer
as $$
  select exists(
    select groups.id
    from public.groups
    inner join public.user_joinned_groups 
        on groups.id = user_joinned_groups.group_id and user_joinned_groups.user_id = auth.uid()
    inner join public.group_session_results as session
        on groups.id = session.group_id
    inner join public.group_round_results as round
        on round.id = is_joinned_group_from_round.group_round_id and session.id = round.group_session_result_id
  );
$$;

create policy "Users can view group_session_results that they have joined"
  on public.group_session_results for select using (is_joinned_group(group_id));

create policy "Users can create group_session_results that they have joined"
  on public.group_session_results for insert with check (is_joinned_group(group_id));

create policy "Users can view group_round_results that they have joined"
  on public.group_round_results for select using (is_joinned_group_from_session(group_session_result_id));

create policy "Users can create group_round_results that they have joined"
  on public.group_round_results for insert with check (is_joinned_group_from_session(group_session_result_id));

create policy "Users can view user_group_round_results that they have joined"
  on public.user_group_round_results for select using (is_joinned_group_from_round(group_round_result_id));

create policy "Users can create user_group_round_results that they have joined"
  on public.user_group_round_results for insert with check (is_joinned_group_from_round(group_round_result_id));

-- create or replace function public.create_round_results(group_session_result_id bigint, results user_group_round_results[]) returns void 
--   language plpgsql security invoker
-- as $$
--   DECLARE	
--     i	int;
--     round_id bigint;
--     input_result  public.user_group_round_results%rowtype;
--     input_user_id text[];
--     input_score integer[];
--     input_rank smallint[];
--     input_total_points integer[];

--   insert into public.group_round_results (group_session_result_id)
--   select create_round_results.group_session_result_id
--   returning id into round_id;

--   for i in array_lower(create_round_results.user_group_round_results,1)..array_upper(create_round_results.user_group_round_results,1) loop
--     input_user_id[i] = create_round_results.user_group_round_results[i].user_id;
--     input_score[i] = create_round_results.user_group_round_results[i].score;
--     input_rank[i] = create_round_results.user_group_round_results[i].rank;
--     input_total_points[i] = create_round_results.user_group_round_results[i].total_points;
--   end loop;

--   insert into public.user_group_round_results (group_round_result_id, user_id, score, rank, total_points)
--   select round_id, unnest(input_user_id), unnest(input_score), unnest(input_rank), unnest(input_total_points);
-- $$;
