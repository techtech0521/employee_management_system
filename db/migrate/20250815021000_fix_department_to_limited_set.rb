# 既存レコードに4部署以外が入っていれば、一括でどれかに変換（例：一時的に全て「総務部」に変更）するマイグレーションを作成。
class FixDepartmentToLimitedSet < ActiveRecord::Migration[8.0]
  def change
    allowed = ['総務部', '人事部', '営業部', '技術部']
    User.where.not(department: allowed).update_all(department: '総務部') # デフォルトは適宜変更
  end
end
