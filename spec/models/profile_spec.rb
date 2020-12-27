require 'rails_helper'

RSpec.describe Profile, type: :model do
  let!(:user) { create(:user) }

  context '自己紹介が入力されている場合' do
    let!(:profile) { create(:profile, user: user) }
    it 'プロフィールを保存できる' do
      expect(profile).to be_valid
    end
  end

  context '自己紹介が入力されていない場合でも' do
    let!(:profile) { create(:profile, introduction: "", user: user) }
    it 'プロフィールを保存できる' do
      expect(profile).to be_valid
    end
  end

  context '自己紹介が100文字の場合' do
    let!(:profile) { create(:profile, introduction: Faker::Lorem.characters(number: 100), user: user) }
    it 'プロフィールを保存できる' do
      expect(profile).to be_valid
    end
  end

  context '自己紹介が101文字の場合' do
    let!(:profile) { build(:profile, introduction: Faker::Lorem.characters(number: 101), user: user) }
    before do
      profile.save
    end
    it 'プロフィールを保存できない' do
      expect(profile.errors.messages[:introduction][0]).to eq('は100文字以内で入力してください')
    end
  end

end
