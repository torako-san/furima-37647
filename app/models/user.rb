class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: "に全角文字を使用してください" } do
    validates :family_name, presence: true
    validates :given_name, presence: true
  end

  validates :family_name_katakana, presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: "はカタカナで入力して下さい。"}
  validates :given_name_katakana, presence: true,format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: "はカタカナで入力して下さい。"}
  validates :birthday, presence: true
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英字と数字の両方を含めてください" }

end