ALTER TABLE ONLY "public"."friends"
    ADD CONSTRAINT "friends_user_id_and_friend_id_key" UNIQUE ("user_id", "friend_id");

ALTER TABLE ONLY "public"."user_friend_requests"
    ADD CONSTRAINT "user_friend_requests_user_id_and_friend_id_key" UNIQUE ("user_id", "friend_id");

CREATE OR REPLACE FUNCTION "public"."fetch_friends"() RETURNS public.users[]
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE	
  target_friend  public.users%rowtype;
  user_friends public.users[];
  i  int;
begin
  i := 0;
  for target_friend in 
  select
   * 
  from public.users
  inner join public.friends on public.users.friend_id = friends.friend_id
  where friends.user_id = auth.uid()
  loop
    i := i + 1;
    user_friends[i] = target_friend;
  end loop;

  return user_friends;
end
$$;

CREATE OR REPLACE FUNCTION "public"."make_friend"(requested_user_id uuid, requested_user_friend_id int) RETURNS void
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE	
  my_friend_id int;
  target_friend  public.friends%rowtype;
begin
  select 
    friend_id into my_friend_id
  from public.users
  where public.users.id = auth.uid()
  limit 1;

  insert into public.friends(user_id, friend_id)
  values 
    (auth.uid(), make_friend.requested_user_friend_id),
    (make_friend.requested_user_id, my_friend_id);
end
$$;
