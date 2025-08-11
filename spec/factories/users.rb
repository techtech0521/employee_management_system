# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    sequence(:employee_number) { |n| "1#{'%02d' % n}" }
    name { 'テストユーザー' }
    furigana { 'テストユーザー' }
    sequence(:email) { |n| "test#{n}@example.com" }
    department { '開発部' }
    phone_number { '09012345678' }
    password { 'password' }
    password_confirmation { 'password' }
    administrator_flag { false }
  end

  factory :administrator, class: 'User' do
    sequence(:employee_number) { |n| "2#{'%02d' % n}" }
    name { '管理者' }
    furigana { 'カンリシャ' }
    sequence(:email) { |n| "admin#{n}@example.com" }
    department { '管理部' }
    phone_number { '09098765432' }
    password { 'password' }
    password_confirmation { 'password' }
    administrator_flag { true }
  end
end