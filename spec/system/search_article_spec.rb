require 'rails_helper'

RSpec.describe 'Search_article', type: :system do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 3, user: user) }

  before do
    sign_in user
  end

  it '記事一覧が表示されている' do
    visit searches_path
    articles.each do |article|
      expect(page).to have_css('.card-text-title > h1', text: article.title)
    end
  end

  it '記事詳細ページが表示されている' do
    visit searches_path
    first('.article-link').click
    expect(page).to have_css('.article')
  end


end