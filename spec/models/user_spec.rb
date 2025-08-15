# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    let(:user) { FactoryBot.build(:user) }

    it '有効なユーザーは保存される' do
      expect(user).to be_valid
    end

    # --- 社員番号のバリデーション ---
    context 'employee_number' do
      it 'なければ無効' do
        user.employee_number = nil
        expect(user).to be_invalid
        expect(user.errors[:employee_number]).to include("can't be blank")
        # # `FactoryBot.build`でメモリ上のオブジェクトを生成
        # user = FactoryBot.build(:user, employee_number: nil)
        # # `valid?`を実行してバリデーションをトリガー
        # user.valid?
        # expect(user.errors[:employee_number]).to include("can't be blank")
      end

      it '重複していれば無効' do
        FactoryBot.create(:user, employee_number: user.employee_number)
        expect(user).to be_invalid
        expect(user.errors[:employee_number]).to include("has already been taken")
      end

      it '3桁の数字でなければ無効' do
        user.employee_number = '10'
        expect(user).to be_invalid
        expect(user.errors[:employee_number]).to include("は3桁の数字で入力してください")
      end
    end

    # --- 名前とフリガナのバリデーション ---
    context 'name' do
      it 'なければ無効' do
        user.name = nil
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("can't be blank")
      end
    end

    context 'furigana' do
      it 'なければ無効' do
        user.furigana = nil
        expect(user).to be_invalid
        expect(user.errors[:furigana]).to include("can't be blank")
      end

      it '全角カタカナでなければ無効' do
        user.furigana = 'やまだたろう'
        expect(user).to be_invalid
        expect(user.errors[:furigana]).to include("は全角カタカナで入力してください")
      end
    end

    # --- 部署と電話番号のバリデーション ---
    context 'department' do
      it 'なければ無効' do
        user.department = nil
        expect(user).to be_invalid
        expect(user.errors[:department]).to include("can't be blank")
      end

      it '正しい部署名のみ有効' do
        user.department = '総務部'
        expect(user).to be_valid
        user.department = '営業部'
        expect(user).to be_valid
        user.department = '不正な部署'
        expect(user).to be_invalid
        expect(user.errors[:department]).to include("is not included in the list")
      end
    end

    context 'phone_number' do
      it 'なければ無効' do
        user.phone_number = nil
        expect(user).to be_invalid
        expect(user.errors[:phone_number]).to include("can't be blank")
      end

      it '10桁または11桁の数字でなければ無効' do
        user.phone_number = '12345'
        expect(user).to be_invalid
        expect(user.errors[:phone_number]).to include("は10桁または11桁の数字で入力してください")
      end
    end
  end
end