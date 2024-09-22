create policy "users can view friends themselves"
  on public.friends for select using ( user_id = auth.uid() );

CREATE OR REPLACE FUNCTION "public"."remove_friend"(remove_friend_user_id uuid) RETURNS void
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE	
  my_friend_id int;
  target_friend_id int;
begin
  select 
    friend_id into my_friend_id
  from public.users
  where public.users.id = auth.uid()
  limit 1;

select 
    friend_id into target_friend_id
  from public.users
  where public.users.id = remove_friend_user_id
  limit 1;

  delete from friends
  where 
    (user_id = remove_friend_user_id and friend_id = my_friend_id) 
    or 
    (user_id = auth.uid() and friend_id = target_friend_id);

end
$$;
