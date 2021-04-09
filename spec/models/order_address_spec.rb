require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
   pending "add some examples to (or delete) #{__FILE__}"
   before do
     user = FactoryBot.create(:user)
     product = FactoryBot.create(:product) 
     @order_address = FactoryBot.build(:order_address,user_id:user.id,product_id:product.id)
     sleep 0.1
   end

 describe '商品購入' do

   context  '内容に問題ない場合' do
     it '住所などtoken全ての項目が存在すれば登録できること' do
         expect(@order_address).to be_valid
      end
      it '建物名が空欄でも登録できること' do
        @order_address.building_name = ''
        @order_address.valid?
        expect(@order_address).to be_valid
     end
    end



   context '内容に問題がある場合' do
     it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
     end


     it 'post_codeが空だと登録できないこと' do
         @order_address.post_code = ''
         @order_address.valid?
         expect(@order_address.errors.full_messages).to include ("Post code can't be blank")
     end

     it 'post_codeがハイフンがないと登録できないこと' do
      @order_address.post_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include ("Post code is invalid. Include hyphen(-)")
  end
    
     it 'region_idが空だと登録できないこと' do
      @order_address.region_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include ("Region can't be blank")
     end
     
     it 'cityが空だと登録できないこと' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include ("City can't be blank")
     end

     it 'caddress_numberが空だと登録できないこと' do
      @order_address.address_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include ("Address number can't be blank")
     end


     it 'phone_numberが空だと登録できないこと' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include ("Phone number can't be blank")
     end

     it 'phone_numberが11桁よりも多いと登録できないこと' do
      @order_address.phone_number = '111111111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include ("Phone number 11桁以下で入力してください")
     end
     
     it 'phone_numberが数値のみ出ないと登録できないこと' do
      @order_address.phone_number = 'aaaaaaaaaaa'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include ("Phone number 11桁以下で入力してください") 
     end
      
     it 'user_idが空だと登録できないこと' do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include ("User can't be blank")
     end

     it 'product_idが空だと登録できないこと' do
      @order_address.product_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include ("Product can't be blank")
     end
    end
 end
end
