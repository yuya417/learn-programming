require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }

  context 'コメントが入力されている場合' do
    let!(:comment) { create(:comment, user: user, article: article) }
    it 'コメントを保存できる' do 
      expect(comment).to be_valid
    end
  end

  context 'コメントが1文字の場合' do
    let!(:comment) { create(:comment, content: Faker::Lorem.characters(number: 1), user: user, article: article) }
    it 'コメントを保存できる' do 
      expect(comment).to be_valid
    end
  end

  context 'コメントが100文字の場合' do
    let!(:comment) { create(:comment, content: Faker::Lorem.characters(number: 100), user: user, article: article) }
    it 'コメントを保存できる' do 
      expect(comment).to be_valid
    end
  end

  context 'コメントが101文字の場合' do
    let!(:comment) { build(:comment, content: Faker::Lorem.characters(number: 101), user: user, article: article) }
    before do
      comment.save
    end
    it 'コメントを保存できない' do 
      expect(comment.errors.messages[:content][0]).to eq('は100文字以内で入力してください')
    end
  end

  context 'コメントが入力されていない場合' do
    let!(:comment) { build(:comment, content: "", user: user, article: article) }
    before do
      comment.save
    end
    it 'コメントを保存できない' do 
      expect(comment.errors.messages[:content][0]).to eq('を入力してください')
    end
  end
end
