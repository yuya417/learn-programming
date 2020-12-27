require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }


  context 'タイトルと内容が入力されている場合' do
    let!(:article) { create(:article, user: user) }
    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  context 'タイトルが1文字の場合' do
    let!(:article) { create(:article, title: Faker::Lorem.characters(number: 1), user: user) }
    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  context '内容が1文字の場合' do
    let!(:article) { create(:article, content: Faker::Lorem.characters(number: 1), user: user) }
    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  context 'タイトルが入力されていない場合' do
    let!(:article) { build(:article, title: "", user: user) }
    before do
      article.save
    end
    it '記事を保存できない' do
      expect(article.errors.messages[:title][0]).to eq('を入力してください')
    end
  end

  context '内容が入力されていない場合' do
    let!(:article) { build(:article, content: "", user: user) }
    before do
      article.save
    end
    it '記事を保存できない' do
      expect(article.errors.messages[:content][0]).to eq('を入力してください')
    end
  end


end
