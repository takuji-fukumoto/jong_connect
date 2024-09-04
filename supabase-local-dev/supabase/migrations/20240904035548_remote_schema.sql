alter table "public"."user_joinned_groups" drop constraint "user_joinned_groups_group_id_fkey";

alter table "public"."user_joinned_groups" alter column "group_id" set not null;

alter table "public"."user_joinned_groups" add constraint "user_joinned_groups_group_id_fkey" FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE not valid;

alter table "public"."user_joinned_groups" validate constraint "user_joinned_groups_group_id_fkey";


