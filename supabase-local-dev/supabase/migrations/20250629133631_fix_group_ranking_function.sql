DROP FUNCTION IF EXISTS public.get_group_ranking(int, public.match_type);
DROP FUNCTION IF EXISTS public.get_group_season_ranking(int, int, public.match_type);

-- グループ全体のランキング
CREATE OR REPLACE FUNCTION public.get_group_ranking(target_group_id int, group_match_type public.match_type)
RETURNS SETOF group_ranking_result
LANGUAGE sql
AS $$
  SELECT 
    group_match_results.user_id,
    SUM(group_match_results.total_points) AS total_points,
    AVG(group_match_results.rank) AS average_rank,
    COUNT(group_match_results.id) AS total_games
  FROM group_matches
  JOIN group_match_results
    ON group_matches.id = group_match_results.group_match_id
    AND group_matches.group_id = target_group_id
    AND group_matches.match_type = group_match_type
  GROUP BY group_match_results.user_id
$$;

-- シーズンごとのランキング
CREATE OR REPLACE FUNCTION public.get_group_season_ranking(target_group_id int, target_season_id int, group_match_type public.match_type)
RETURNS SETOF group_ranking_result
LANGUAGE sql
AS $$
  SELECT 
    group_match_results.user_id,
    SUM(group_match_results.total_points) AS total_points,
    AVG(group_match_results.rank) AS average_rank,
    COUNT(group_match_results.id) AS total_games
  FROM group_matches
  JOIN group_match_results 
    ON group_matches.id = group_match_results.group_match_id
    AND group_matches.group_id = target_group_id
    AND group_matches.season_id = target_season_id 
    AND group_matches.match_type = group_match_type
  GROUP BY group_match_results.user_id
$$;
