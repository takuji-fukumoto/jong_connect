DROP FUNCTION public.create_group_match_with_results(bigint, "match_type",  group_match_results[]); 

create or replace function public.create_group_match_with_results(
  group_id bigint, 
  created_user_id uuid,
  match_type "match_type", 
  results group_match_results[]
) 
returns void 
language plpgsql
security invoker
as $$
DECLARE
  match_id bigint;
  i int;
  input_user_id uuid[] := '{}';
  input_user_name text[] := '{}';
  input_score integer[] := '{}';
  input_rank smallint[] := '{}';
  input_total_points integer[] := '{}';
  input_match_order smallint[] := '{}';
BEGIN
  insert into public.group_matches (group_id, user_id, match_type)
  values (group_id, created_user_id, match_type)
  returning id into match_id;

  -- results配列をループ処理してデータを抽出
  for i in array_lower(results, 1)..array_upper(results, 1) loop
    input_user_id := array_append(input_user_id, results[i].user_id);
    input_user_name := array_append(input_user_name, results[i].user_name);
    input_score := array_append(input_score, results[i].score);
    input_rank := array_append(input_rank, results[i].rank);
    input_total_points := array_append(input_total_points, results[i].total_points);
    input_match_order := array_append(input_match_order, results[i].match_order);
  end loop;

  insert into public.group_match_results (
    group_match_id, user_id, user_name, score, rank, total_points, match_order
  )
  select 
    match_id, 
    unnest(input_user_id), 
    unnest(input_user_name),
    unnest(input_score), 
    unnest(input_rank), 
    unnest(input_total_points), 
    unnest(input_match_order);
END
$$;
