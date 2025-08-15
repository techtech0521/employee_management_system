class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :employee_number, presence: true, uniqueness: true, on: :create # uniquenessは新規作成時のみ適用
  validates :employee_number, format: { with: /\A[0-9]{3}\z/, message: "は3桁の数字で入力してください" }, allow_blank: true # 3桁の数字形式をチェック

  validates :name, presence: true
  validates :furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }

  DEPARTMENTS = %w[総務部 人事部 営業部 技術部].freeze
  validates :department, presence: true, inclusion: { in: DEPARTMENTS }
  
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }

  # before_validation -> { generate_unique_employee_number if new_record? && employee_number.nil? }

  private

  def generate_unique_employee_number
    # 重複しない番号が見つかるまで探し続ける
    last_number = User.maximum(:employee_number).to_i
    new_number = last_number.zero? ? 100 : last_number + 1

    while User.exists?(employee_number: new_number)
      new_number += 1
    end

    self.employee_number = new_number
  end
end
