FactoryBot.define do
  factory :item do
    item_name              { '桶屋が儲かる桶' }
    description            { 'この桶を持っていれば風が吹くと儲かる' }
    category_id            { 2 }
    status_id              { 2 }
    fee_id                 { 2 }
    prefecture_id          { 2 }
    day_id                 { 2 }
    price                  { 99999 }
    association            :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
