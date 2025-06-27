CREATE TYPE public.group_ranking_result AS (
  user_id uuid,
  total_score int,
  average_rank numeric,
  total_games int
);

-- グループ全体のランキング
CREATE OR REPLACE FUNCTION public.get_group_ranking(group_id int, group_match_type public.match_type)
RETURNS SETOF group_ranking_result
LANGUAGE sql
AS $$
  SELECT 
    group_match_results.user_id,
    SUM(group_match_results.score) AS total_score,
    AVG(group_match_results.rank) AS average_rank,
    COUNT(group_match_results.id) AS total_games
  FROM group_matches
  JOIN group_match_results ON group_matches.id = group_match_results.group_match_id
  WHERE group_matches.group_id = group_id
    AND group_matches.match_type = group_match_type
  GROUP BY group_match_results.user_id
$$;

-- シーズンごとのランキング
CREATE OR REPLACE FUNCTION public.get_group_season_ranking(group_id int, season_id int, group_match_type public.match_type)
RETURNS SETOF group_ranking_result
LANGUAGE sql
AS $$
  SELECT 
    group_match_results.user_id,
    SUM(group_match_results.score) AS total_score,
    AVG(group_match_results.rank) AS average_rank,
    COUNT(group_match_results.id) AS total_games
  FROM group_matches
  JOIN group_match_results ON group_matches.id = group_match_results.group_match_id
  WHERE group_matches.group_id = group_id 
    AND group_matches.season_id = season_id 
    AND group_matches.match_type = group_match_type
  GROUP BY group_match_results.user_id
$$;
