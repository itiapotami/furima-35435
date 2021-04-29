FactoryBot.define do
  factory :user do
    nickname              {'katusintarou'}
    email                 {Faker::Internet.free_email}
    password              {'chorrpy3033'}
    password_confirmation {password}
    last_name             {'勝'}
    first_name            {'慎太郎'}
    last_kana             {'カツ'}
    first_kana            {'シンタロウ'}
    birthday              {'1998-09-24'}

  end
end