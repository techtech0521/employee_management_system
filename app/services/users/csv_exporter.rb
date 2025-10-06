require "csv"

module Users
  class CsvExporter
    def self.call(users)
      bom = "\uFEFF" # Excel 文字化け防止

      CSV.generate(bom, headers: true) do |csv|
        csv << ["社員番号", "名前", "ふりがな", "部署", "電話番号", "メールアドレス", "管理者", "登録日"]

        users.each do |user|
          csv << [
            user.employee_number,
            user.name,
            user.furigana,
            user.department,
            user.phone_number,
            user.email,
            user.administrator_flag ? "はい" : "いいえ",
            user.created_at.strftime("%Y-%m-%d")
          ]
        end
      end
    end
  end
end
