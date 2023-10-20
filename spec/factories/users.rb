FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "user#{n}@example.com" } # Генерация уникального email'а
      password { 'password' }
      created_at { '2023-10-17 11:31:17.614931' }
      updated_at { '2023-10-17 11:31:17.614931' }
    end
  end