require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }
  let!(:comments) { create_list(:comment, 10, article: article, user: user) }

  describe 'GET /comments' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '200ステータス' do
        get article_comments_path(article_id: article.id)
        expect(response).to have_http_status(200)

        body = JSON.parse(response.body)
        expect(body.length).to eq 10
        expect(body[9]['content']).to eq comments.first.content
        expect(body[8]['content']).to eq comments.second.content
        expect(body[7]['content']).to eq comments.third.content
      end
    end
    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get article_comments_path(article_id: article.id)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
