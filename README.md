# README

アプリの概要
【アプリのターゲット】
・プログラミングを学習しているが、周りにプログラミング仲間がいない人

【他のアプリでは実現できないのか？】
・私自身、文系の大学生のため周りにプログラミングを学習している人がいないので、ツイッターなどで発信したり、積み上げを報告したりしているが、コミュニティ感が無く、切磋琢磨し合える環境が無い。
・スタディプラスでも学習の積み上げを発信しているが、そもそも受験生の割合が高く、プログラミングを学習している人の割合が少ない。

【使用技術】
・言語：HAML、SCSS、JavaScript、jQuery、Ruby、Ruby on Rails
・データベース：PostgreSQL
・gem：devise、faker、font-awesome-sass、hamlit、sidekiq、active_model_serializers、　ransack、aws-sdk-s3、annotate、better_errors、binding_of_caller、byebug、pry-byebug、rubocop-rails、rspec-rails、letter_opener、factory_bot_rails、dotenv-rails、erb2haml
・ActiveStorageService：Amazon S3
・環境：heroku
・管理：SourceTree、Github
・テスト：RSpec

【機能説明】
・ログイン機能：deviseを使用しており、新規登録を行うと、登録完了メールが飛ぶ。sendgridとMailerを使用
・記事投稿機能：タイトル、画像、内容が投稿できる。編集と削除機能もある。
・コメント機能：Ajaxでコメントを送信、非同期で送信できる。Serializerも使用
・記事検索機能：ransackを使用し、タイトルと内容から検索したキーワードを含むものを取り出して表示。空白で検索するとすべての記事が表示される
・フォロー機能：Ajaxを使い、非同期でフォローできる。フォロー中とフォロワーがあり、誰をフォローしているのか、誰にフォローされているのかを一覧表示。フォローされるとフォローしたユーザーの情報をメールで受け取れる。

