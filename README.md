# 雀コネ

雀コネは麻雀の成績集計ツールです。
LINEのような感覚で成績の集計・共有ができます。
- フレンド管理
- ルームを作って、ルームごとに成績管理
- 3麻、4麻対応
- 5人以上の複数人打ち対応

## 技術スタック
- フロントエンド：Flutter Web
- バックエンド / データベース：Supabase（PostgreSQL）
- ホスティング / CDN：Vercel

## 開発手順
1. リポジトリclone
2. cd supabase-local-dev
3. supabase CLIをインストールし、ローカル開発環境セットアップ  
   参考：https://supabase.com/docs/guides/local-development/cli/getting-started?platform=macos

## よく使うコマンド
```bash
# ローカル環境起動
supabase start

# remote -> ローカル環境にDB反映
supabase db pull

# migrationファイル生成
supabase migration new [migrationファイル名]

# DB更新(migration & seed)
supabase db reset

# ローカル -> remote環境にDB反映
supabase db push

# ローカル環境停止・削除
supabase stop

※コンテナ再起動時にエラーが発生する場合はsupabaseフォルダの「.temp」フォルダごと削除する
```
