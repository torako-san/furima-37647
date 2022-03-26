require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    #インスタンスの生成処理に0.1s待機させて、読み込みタイムアウトを回避
    sleep 0.1
  end

  describe '商品購入機能' do
    context '出品商品が購入できるとき' do
      it '入力された全ての内容に問題がなければ商品を購入できる' do
        expect(@order_address).to be_valid
      end

      it 'address_buildingが存在なくても商品を購入できる' do
        @order_address.address_building = ""
        expect(@order_address).to be_valid
      end
    end

    context '出品商品が購入できないとき' do
      it 'tokenが空では購入できない' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空では購入できない' do
        @order_address.post_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが「3桁数字ー4桁数字」でなければ購入できない' do
        @order_address.post_code = "1234-567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code は入力が無効です（例：123-3456)")
      end

      it 'delivery_area_idが空では購入できない' do
        binding.pry
      end

      it 'cityが空では購入できない' do
      end

      it 'address_lineが空では購入できない' do
      end

      it 'phone_numberが空では購入できない' do
      end

      it 'phone_numberが11桁数字でなければ購入できない' do
      end

      it 'userが紐付いていないと購入できない' do
      end
      
      it 'itemが紐付いていないと購入できない' do
      end

      it 'orderが紐付いていないと購入できない' do
      end
    end
  end
end