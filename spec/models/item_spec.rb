require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規で商品の出品登録できるとき' do
      it 'name、description、price、image、item_category_id、item_status_id、delivery_burden_id、delivery_area_id、delivery_day_idがあれば新規登録できる' do
        expect(@item).to be_valid
      end

      it 'priceが¥300なら登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it 'priceが¥9,999,999なら登録できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end

      it 'priceが半角数値なら登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '新規で商品の出品登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'item_category_idがないと登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it 'item_status_idがないと登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it 'delivery_burden_idがないと登録できない' do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end

      it 'delivery_area_idがないと登録できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end

      it 'delivery_day_idがないと登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥300以下なら登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999で入力して下さい')
      end

      it 'priceが¥10,000,000以上なら登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999で入力して下さい')
      end

      it 'priceに半角数字でないと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999で入力して下さい')
      end

      it 'priceに半角英字混合では登録できない' do
        @item.price = 'a300'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999で入力して下さい')
      end

      it 'priceに半角英字では登録できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999で入力して下さい')
      end

      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
