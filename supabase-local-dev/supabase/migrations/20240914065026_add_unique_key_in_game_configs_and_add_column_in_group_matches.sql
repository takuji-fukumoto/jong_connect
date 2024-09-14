ALTER TABLE ONLY "public"."game_configs"
    ADD CONSTRAINT "game_configs_user_id_key" UNIQUE ("user_id");

ALTER TABLE "public"."group_matches"
ADD COLUMN "end_at" timestamp with time zone;