# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    sequence(:employee_number) { |n| format('%03d', n) }
    name { 'テストユーザー' }
    furigana { 'てすとゆーざー' }
    sequence(:email) { |n| "test#{n}@example.com" }
    department { '技術部' }
    phone_number { '09012345678' }
    password { 'password' }
    password_confirmation { 'password' }
    administrator_flag { false }
  end

  factory :administrator, class: 'User' do
    sequence(:employee_number) { |n| format('%03d', n + 100) }
    name { '管理者' }
    furigana { 'かんりしゃ' }
    sequence(:email) { |n| "admin#{n}@example.com" }
    department { '管理部' }
    phone_number { '09098765432' }
    password { 'password' }
    password_confirmation { 'password' }
    administrator_flag { true }
  end
end