
・概要

　カスタマイズ要素多めの気軽に使えるCRUD
 
 
・機能等

記事画像にマウスホバー時、最新5コメントが自動でスクロール表示されます

表示する記事数を切り替えることができます

ユーザー登録をしなくてもコメントを投稿する事ができます

コメントには好きな色を付ける事ができます

ユーザー登録することで記事を投稿できるようになります

画像が無い場合、デフォルト画像が自動で投稿されます

画像スタイル(色調反転、セピア)を設定できます

記事詳細画面の背景を設定できます

エラーメッセージは全て日本語化されています

記事を削除すると付いたコメントも同時にDBから削除されます

ユーザーを削除すると、投稿した記事、コメントも全て削除されます

その他

ユーザー登録、ログイン機能

登録情報編集機能

記事編集機能

コメント表示数制限機能

・使用技術等

ruby on rails javascript jquery css bootstrap

sqlite3 vagrant aws nginx 

ロゴ背景にcanvasを使用

・デプロイ方法


vagrant上で開発、githubへプッシュ

コマンドプロンプトからec2にアクセス、プルリクエスト

本番環境用の設定をvimで編集


ポートフォリオとして見て頂く事を意識したので、煩雑なメール認証機能はオミットしましたが、念のためテストユーザーのログイン情報を記載しておきます

名前:test_user

メールアドレス:test@ttt.com

パスワード:tttttt
