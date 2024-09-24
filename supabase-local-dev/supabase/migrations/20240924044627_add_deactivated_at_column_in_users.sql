ALTER TABLE "public"."users"
ADD COLUMN "deactivated_at" timestamp with time zone;

CREATE OR REPLACE FUNCTION "public"."deactivate_user"() RETURNS void
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
begin
    -- 対局結果は残しておきたいので論理削除
    UPDATE public.users
    SET
    "name" = '退会済みユーザー',
    "deactivated_at" = now()
    where
    id = auth.uid();

  DELETE FROM auth.users WHERE id = auth.uid();
end
$$;
