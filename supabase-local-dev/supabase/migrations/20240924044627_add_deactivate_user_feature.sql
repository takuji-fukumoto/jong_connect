alter table "public"."friends" drop constraint "friends_user_id_fkey";
alter table "public"."friends" add constraint "friends_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

alter table "public"."friends" drop constraint "friends_friend_id_fkey";
alter table "public"."friends" add constraint "friends_friend_id_fkey" FOREIGN KEY (friend_id) REFERENCES users(friend_id) ON DELETE CASCADE;

alter table "public"."user_joinned_groups" drop constraint "user_joinned_groups_user_id_fkey";
alter table "public"."user_joinned_groups" add constraint "user_joinned_groups_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

CREATE OR REPLACE FUNCTION "public"."deactivate_user"() RETURNS void
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
begin
  DELETE FROM auth.users WHERE id = auth.uid();
end
$$;
