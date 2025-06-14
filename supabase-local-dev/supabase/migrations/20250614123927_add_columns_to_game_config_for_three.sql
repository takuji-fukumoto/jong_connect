ALTER TABLE "public"."game_configs"
ADD COLUMN "initial_starting_point_for_three" integer DEFAULT 35000 NOT NULL,
ADD COLUMN "settlement_score_for_three" integer DEFAULT 35000 NOT NULL,
ADD COLUMN "position_points_for_three" smallint[3] DEFAULT '{0, 0, 0}' NOT NULL;

