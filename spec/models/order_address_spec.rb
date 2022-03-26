require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @item.image = fixture_file_upload('public/images/test.jpeg')
    @item.save
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    # インスタンスの生成処理に0.1s待機させて、読み込みタイムアウトを回避
    sleep 0.1
  end

  describe '商品購入機能' do
    context '出品商品が購入できるとき' do
      it '入力された全ての内容に問題がなければ商品を購入できる' do
        expect(@order_address).to be_valid
      end

      it 'address_buildingが存在しなくて商品を購入できる' do
        @order_address.address_building = ''
        expect(@order_address).to be_valid
      end
    end

    context '出品商品が購入できないとき' do
      it 'tokenが空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空では購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが「3桁数字ー4桁数字」でなければ購入できない' do
        @order_address.post_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code は入力が無効です（例：123-3456)')
      end

      it 'delivery_area_idが空では購入できない' do
        @order_address.delivery_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Delivery area can't be blank")
      end

      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'address_lineが空では購入できない' do
        @order_address.address_line = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁数字でなければ購入できない' do
        @order_address.phone_number = '090-1234-4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は11桁数字をハイフンなしで登録して下さい')
      end

      it 'userが紐付いていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
