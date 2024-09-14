ALTER TABLE ONLY "public"."group_match_results"
    ADD CONSTRAINT "group_match_results_group_match_id_and_user_id_and_match_order_key" UNIQUE ("group_match_id", "user_id", "match_order");
