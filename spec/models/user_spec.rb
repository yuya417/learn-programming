require 'rails_helper'

RSpec.describe User, type: :model do

  context 'すべて入力されている場合' do
    let!(:user) { create(:user) }
    it 'ユーザーを保存できる' do
      expect(user).to be_valid
    end
  end

  context 'ユーザーネームが2文字の場合' do
    let!(:user) { create(:user, username: Faker::Lorem.characters(number: 2)) }
    it 'ユーザーを保存できる' do
      expect(user).to be_valid
    end
  end

  context 'ユーザーネームが20文字の場合' do
    let!(:user) { create(:user, username: Faker::Lorem.characters(number: 20)) }
    it 'ユーザーを保存できる' do
      expect(user).to be_valid
    end
  end

  context 'ユーザーネームが入力されていない場合' do
    let!(:user) { build(:user, username: "") }
    before do
      user.save
    end
    it 'ユーザーを保存できない' do
      expect(user.errors.messages[:username][0]).to eq('を入力してください')
    end
  end

  context 'ユーザーネームが1文字の場合' do
    let!(:user) { build(:user, username: Faker::Lorem.characters(number: 1)) }
    before do
      user.save
    end
    it 'ユーザーを保存できない' do
      expect(user.errors.messages[:username][0]).to eq('は2文字以上で入力してください')
    end
  end

  context 'ユーザーネームが21文字の場合' do
    let!(:user) { build(:user, username: Faker::Lorem.characters(number: 21)) }
    before do
      user.save
    end
    it 'ユーザーを保存できない' do
      expect(user.errors.messages[:username][0]).to eq('は20文字以内で入力してください')
    end
  end

  context 'Eメールが入力されていない場合' do
    let!(:user) { build(:user, email: "") }
    before do
      user.save
    end
    it 'ユーザーを保存できない' do
      expect(user.errors.messages[:email][0]).to eq('を入力してください')
    end
  end

  context 'パスワードが入力されていない場合' do
    let!(:user) { build(:user, password: "") }
    before do
      user.save
    end
    it 'ユーザーを保存できない' do
      expect(user.errors.messages[:password][0]).to eq('を入力してください')
    end
  end

  context 'パスワードが5文字の場合' do
    let!(:user) { build(:user, password: Faker::Lorem.characters(number: 5)) }
    before do
      user.save
    end
    it 'ユーザーを保存できない' do
      expect(user.errors.messages[:password][0]).to eq('は6文字以上で入力してください')
    end
  end

  context 'パスワードが6文字の場合' do
    let!(:user) { build(:user, password: Faker::Lorem.characters(number: 6)) }
    before do
      user.save
    end
    it 'ユーザーを保存できる' do
      expect(user).to be_valid
    end
  end



end
