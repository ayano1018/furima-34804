require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    
    context  '内容に問題ない場合' do
      it '写真や名前他全ての項目が存在すれば登録できること' do
        expect(@product).to be_valid
      end
    end

    context '内容に問題がある場合' do

      it 'imageが空だと登録できないこと' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include ("Image can't be blank")
      end

      it 'nameが空だと登録できないこと' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Name can't be blank")
       end

       it 'descriptionが空だと登録できないこと' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Description can't be blank")
       end

       it 'category_idが空だと登録できないこと' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Category can't be blank")
       end
       
       it 'condition_idが空だと登録できないこと' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Condition can't be blank")
       end
       
       it 'shipping_cost_idが空だと登録できないこと' do
        @product.shipping_cost_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Shipping cost can't be blank")
       end
      
       it 'region_idが空だと登録できないこと' do
        @product.region_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Region can't be blank")
       end
       
       it 'shipping_day_idが空だと登録できないこと' do
        @product.shipping_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Shipping day can't be blank")
       end

       it 'priceが空だと登録できないこと' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Price can't be blank")
       end


       it 'priceが300以下であれば登録できないこと' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include ("Price must be greater than 300")
       end

       it 'price全角文字は登録できないこと' do
        @product.price = '１１１'
        @product.valid?
        expect(@product.errors.full_messages).to include ("Price is not a number")
       end

       it 'priceが半角英数混合では登録できない' do
        @product.price = '1a1a'
        @product.valid?
        expect(@product.errors.full_messages).to include ("Price is not a number")
       end

       it 'priceが半角英語だけでは登録できない' do
        @product.price = 'aaa'
        @product.valid?
        expect(@product.errors.full_messages).to include ("Price is not a number")
       end
       
       it 'priceが10,000,000以上では登録できないこと' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include ("Price must be less than 10000000")
       end

   end
 end
end
