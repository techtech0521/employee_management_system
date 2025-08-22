class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :employee_number, presence: true, uniqueness: true, on: :create # uniquenessは新規作成時のみ適用
  validates :employee_number, presence: true, uniqueness: true
  validates :employee_number, format: { with: /\A[0-9]{3}\z/, message: "は3桁の数字で入力してください" }, allow_blank: true # 3桁の数字形式をチェック

  validates :name, presence: true
  validates :furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }

  DEPARTMENTS = %w[総務部 人事部 営業部 技術部].freeze
  validates :department, presence: true, inclusion: { in: DEPARTMENTS }
  
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }

  validates :password, presence: true, on: :create

  before_validation :assign_employee_number, on: :create

  private

  # 3桁の連番で自動採番
  def assign_employee_number
    if self.employee_number.blank?
      last_number = User.maximum("CAST(employee_number AS integer)") || 0
      self.employee_number = format('%03d', last_number.to_i + 1)
    end
  end
end
