FactoryBot.define do
    factory :post do
      description { 'This is my first post.' }
      user { association :user } # Создание ассоциации с моделью User
      created_at { '2023-10-17 11:31:17.614931' }
      updated_at { '2023-10-17 11:31:17.614931' }
    end
  end