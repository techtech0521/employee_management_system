class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :employee_number, uniqueness: true, on: :create # uniquenessは新規作成時のみ適用
  validates :employee_number, format: { with: /\A[0-9]{3}\z/, message: "は3桁の数字で入力してください" }, allow_blank: true # 3桁の数字形式をチェック

  validates :name, presence: true
  validates :furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :department, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }

  before_validation :set_employee_number, on: :create

  private

  def set_employee_number
    last_employee_number = User.maximum(:employee_number).to_i
    self.employee_number = last_employee_number.zero? ? 100 : last_employee_number + 1
  end
end
