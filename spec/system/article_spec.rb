require 'rails_helper'

RSpec.describe 'Article', type: :system do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 3, user: user) }

  before do
    sign_in user
  end

  it '記事一覧ページが表示される' do
    visit articles_path
    articles.each do |article|
      expect(page).to have_css('.articles')
    end
  end

  it '記事一覧ページが表示される' do
    visit articles_path
    find('.nav-bar-home').click
    expect(page).to have_css('.articles')
  end

  it '検索ページが表示される' do
    visit articles_path
    find('.nav-bar-search').click
    expect(page).to have_css('.search-article')
  end

  it '投稿ページが表示される' do
    visit articles_path
    find('.nav-bar-new').click
    expect(page).to have_css('.article-new')
  end

  it 'プロフィールページが表示される' do
    visit articles_path
    find('.nav-bar-user').click
    expect(page).to have_css('.profile')
  end
end