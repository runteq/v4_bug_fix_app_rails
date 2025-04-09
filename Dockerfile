# Ruby の公式イメージを利用（必要な Ruby バージョンに合わせて変更）
FROM ruby:3.2

# Node.js, build-essential, SQLite3 の開発ライブラリをインストール
RUN apt-get update -qq && \
    apt-get install -y nodejs build-essential libsqlite3-dev

# アプリケーションの作業ディレクトリを設定
WORKDIR /app

# Gemfile と Gemfile.lock だけ先にコピー（依存関係のキャッシュ利用）
COPY Gemfile Gemfile.lock ./

# bundle install を実行
RUN bundle install

# 残りのアプリケーションのファイルを全てコピー
COPY . .

# Rails の標準ポート 3000 を解放
EXPOSE 3000

# コンテナ起動時に Rails サーバーを起動する
CMD ["rails", "server", "-b", "0.0.0.0"]
