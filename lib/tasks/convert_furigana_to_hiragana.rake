namespace :furigana do
  desc 'Convert all User#furigana to hiragana only (カタカナ・アルファベット・その他不正文字をひらがなに変換)'
  task convert_to_hiragana: :environment do
    require 'nkf'

    User.find_each do |user|
      orig = user.furigana
      next if orig.blank?

      # カタカナ→ひらがな変換
      hira = NKF.nkf('-w --hiragana', orig)

      # アルファベットや記号などひらがな範囲外の文字は「ん」にまとめて置換
      hira = hira.gsub(/[^ぁ-んー　]/, 'ん')

      # 「ん」が連続する場合は1つにまとめる
      hira = hira.gsub(/ん+/, 'ん')

      # 前後の空白を除去
      hira = hira.strip

      if user.furigana != hira
        puts "変換: #{user.id} #{orig} => #{hira}"
        user.update_column(:furigana, hira)
      end
    end
    puts "全ユーザーのふりがな変換が完了しました。"
  end
end
