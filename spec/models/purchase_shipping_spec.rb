require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
    end

    context '購入情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_shipping).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @purchase_shipping.building_name = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '購入情報が保存できない場合' do
      it 'tokenが空では登録できない' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できない' do
        @purchase_shipping.postal_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_shipping.postal_code = 1_234_567
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefectureを選択していないと保存できない' do
        @purchase_shipping.prefecture = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @purchase_shipping.address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できない' do
        @purchase_shipping.phone_number = '０８０００００００００'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが10桁未満では保存できない' do
        @purchase_shipping.phone_number = '080000000'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number is too short')
      end
      it 'userが紐付いていないと保存できない' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
