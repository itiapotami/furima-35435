FactoryBot.define do
  factory :purchase_address do
    postal_code          {"192-0274"}
    prefecture_id        {2}
    city                 {"京都市"}
    house_number         {"左京区4-30-7"}
    phone_number         {"09088015851"}
    building_number      {"マンション"}
    token                {"tok_abcdefghijk00000000000000000"}
    
  end
end
