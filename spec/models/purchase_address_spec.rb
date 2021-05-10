require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, item_id: item.id, user_id: user.id)
    sleep 0.5
  end
  
  describe "商品購入" do
    context "商品購入できるとき" do
      it "postal_code、prefecture_id、city、house_number、phone_number、building_number、token、user_id、item_idが存在すれば登録できる" do
        expect(@purchase_address).to be_valid
      end
      it "building_numberがなくても購入できる" do
        @purchase_address.building_number = ""
        expect(@purchase_address).to be_valid
      end
    end
    context " 商品購入できないとき" do
      it 'postal_codeが空では購入できない' do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeにはハイフンが含まれていなければ購入できない" do
        @purchase_address.postal_code = "1920364"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが空では購入できない" do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "cityが空では購入できない" do
        @purchase_address.city = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空では購入できない" do
        @purchase_address.house_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空では購入できない" do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberは数字で11桁でないと購入できない" do
        @purchase_address.phone_number = "090274420854"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number 電話番号は11桁以内の数値のみ保存可能なこと")
      end

      it "phone_numberは英数字混合では購入できない" do
        @purchase_address.phone_number = "090ninana87"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number 電話番号は11桁以内の数値のみ保存可能なこと")
        
      end

      it "tokenが空では購入できない" do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では購入できない" do
        @purchase_address.user_id = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では購入できない" do
        @purchase_address.item_id = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
