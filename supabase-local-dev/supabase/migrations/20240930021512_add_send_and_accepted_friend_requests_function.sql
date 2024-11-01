create policy "users can view user_friend_requests themselves"
  on public.user_friend_requests for select using ( user_id = auth.uid() );

create policy "users can view user_friend_requests that other users requested"
  on public.user_friend_requests for select using ( friend_id = (select friend_id from public.users where id = auth.uid() limit 1) );

create policy "users can insert user_friend_requests themselves"
  on public.user_friend_requests for insert with check ( user_id = auth.uid() );

create policy "users can update user_friend_requests themselves"
  on public.user_friend_requests for update using ( user_id = auth.uid() );

create policy "users can update user_friend_requests that other users requested"
  on public.user_friend_requests for update using ( friend_id = (select friend_id from public.users where id = auth.uid() limit 1) );

create policy "users can delete user_friend_requests themselves"
  on public.user_friend_requests for delete using ( user_id = auth.uid() );

CREATE OR REPLACE FUNCTION "public"."accept_friend_request"(friend_request_id int) RETURNS void
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE	
  requested_user_id uuid; -- 申請元のユーザーID
  my_friend_id int;       -- 自身のフレンドID
  target_friend_id int;   -- 申請元ユーザーのフレンドID
begin
  update public.user_friend_requests 
  set
    status = 'accepted'::"public"."status"
  where id = friend_request_id
  returning user_id into requested_user_id;

  select 
    friend_id into my_friend_id
  from public.users
  where id = auth.uid()
  limit 1;

  select 
    friend_id into target_friend_id
  from public.users
  where id = requested_user_id
  limit 1;

  -- こちらからもフレンド申請していた場合はそちらもacceptedにする
  update public.user_friend_requests 
  set
    status = 'accepted'::"public"."status"
  where 
    user_id = auth.uid() and friend_id = target_friend_id;

  -- MEMO: 本当はmake_friend関数を呼びたかったが何故か呼び出せないため個別でフレンド追加処理実装
  insert into public.friends(user_id, friend_id)
  values 
    (auth.uid(), target_friend_id),
    (requested_user_id, my_friend_id);

end
$$;

CREATE OR REPLACE FUNCTION "public"."reject_friend_request"(friend_request_id int) RETURNS void
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
begin
  update public.user_friend_requests
  set
    status = 'rejected'::"public"."status"
  where
    id = friend_request_id;
end
$$;

