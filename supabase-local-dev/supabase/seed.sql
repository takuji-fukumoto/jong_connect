WITH credentials(id, mail, pass) AS (
  SELECT * FROM (VALUES 
    ('123e4567-e89b-12d3-a456-426614174000', 'user1@example.com', 'password1'), 
    ('123e4567-e89b-12d3-a456-426614174001', 'user2@example.com', 'password2'), 
    ('123e4567-e89b-12d3-a456-426614174002', 'user3@example.com', 'password3'), 
    ('123e4567-e89b-12d3-a456-426614174003', 'user4@example.com', 'password4')
  ) AS users(id, mail, pass)
),
create_user AS (
  INSERT INTO auth.users (id, instance_id, ROLE, aud, email, raw_app_meta_data, raw_user_meta_data, is_super_admin, encrypted_password, created_at, updated_at, last_sign_in_at, email_confirmed_at, confirmation_sent_at, confirmation_token, recovery_token, email_change_token_new, email_change)
    SELECT id::uuid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', mail, '{"provider":"email","providers":["email"]}', '{}', FALSE, crypt(pass, gen_salt('bf')), NOW(), NOW(), NOW(), NOW(), NOW(), '', '', '', '' FROM credentials
  RETURNING id
)
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
  SELECT gen_random_uuid(), id, id, json_build_object('sub', id), 'email', NOW(), NOW(), NOW() FROM create_user;

INSERT INTO "public"."avatars" ("created_at", "url")
VALUES
    ('2024-08-20 07:02:20.378184+00', 'https://nauixhzrluaiydfkhlch.supabase.co/storage/v1/object/public/avatars/01.png'), 
    ('2024-08-20 07:02:46.171755+00', 'https://nauixhzrluaiydfkhlch.supabase.co/storage/v1/object/public/avatars/02.png'), 
    ('2024-08-20 07:03:07.78514+00', 'https://nauixhzrluaiydfkhlch.supabase.co/storage/v1/object/public/avatars/03.png');

UPDATE "public"."users"
SET
  "name" = 'user001',
  "profile" = 'hello',
  "friend_id" = 101,
  "avatar_url" = 'https://nauixhzrluaiydfkhlch.supabase.co/storage/v1/object/public/avatars/01.png'
where
  id = '123e4567-e89b-12d3-a456-426614174000';

UPDATE "public"."users"
SET
  "name" = 'user002',
  "profile" = 'onakasuita',
  "friend_id" = 102,
  "avatar_url" = 'https://nauixhzrluaiydfkhlch.supabase.co/storage/v1/object/public/avatars/02.png'
where
  id = '123e4567-e89b-12d3-a456-426614174001';

UPDATE "public"."users"
SET
  "name" = 'user003',
  "profile" = 'osushi',
  "friend_id" = 103,
  "avatar_url" = 'https://nauixhzrluaiydfkhlch.supabase.co/storage/v1/object/public/avatars/03.png'
where
  id = '123e4567-e89b-12d3-a456-426614174002';

UPDATE "public"."users"
SET
  "name" = 'user004',
  "profile" = 'aaaaa',
  "friend_id" = 104,
  "avatar_url" = 'aaaaa'
where
  id = '123e4567-e89b-12d3-a456-426614174003';


-- INSERT INTO "public"."users" ("id", "name", "profile", "friend_id", "avatar_url") 
-- VALUES 
--   ('123e4567-e89b-12d3-a456-426614174000', 'test user001', 'hello', 101, 'https://nauixhzrluaiydfkhlch.supabase.co/storage/v1/object/public/avatars/01.png'),
--   ('123e4567-e89b-12d3-a456-426614174001', 'test user002', 'onaka suita', 102, 'https://nauixhzrluaiydfkhlch.supabase.co/storage/v1/object/public/avatars/02.png'),
--   ('123e4567-e89b-12d3-a456-426614174002', 'test user003', 'osushi', 103, 'https://nauixhzrluaiydfkhlch.supabase.co/storage/v1/object/public/avatars/03.png'),
--   ('123e4567-e89b-12d3-a456-426614174003', 'test user004', 'aaaaaaaaaaaaaa', 104, 'aaaaa');

INSERT INTO "public"."friends" ("user_id", "friend_id") 
VALUES 
  ('123e4567-e89b-12d3-a456-426614174000', 102),
  ('123e4567-e89b-12d3-a456-426614174000', 103),
  ('123e4567-e89b-12d3-a456-426614174000', 104),
  ('123e4567-e89b-12d3-a456-426614174001', 101),
  ('123e4567-e89b-12d3-a456-426614174002', 101),
  ('123e4567-e89b-12d3-a456-426614174003', 101);

INSERT INTO "public"."groups" ("id", "name", "description") 
VALUES 
  (101, '雀魂サー', 'いつものやつです');

INSERT INTO "public"."user_joinned_groups" ("user_id", "group_id") 
VALUES 
  ('123e4567-e89b-12d3-a456-426614174000', 101),
  ('123e4567-e89b-12d3-a456-426614174001', 101),
  ('123e4567-e89b-12d3-a456-426614174002', 101),
  ('123e4567-e89b-12d3-a456-426614174003', 101);

