class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :receivers, through: :messages, source: :sender
  has_many :reverse_of_messages, class_name: "Message", foreign_key: "sender"
  has_many :senders, through: :reverse_of_messages, source: :user
  has_many :contracts, dependent: :destroy

  # has_many :teachers, dependent: :destroy
  # has_many :students, dependent: :destroy
  attachment :image  #refile
  acts_as_paranoid   #paranoia

  enum sex: {男性: true, 女性: false}



  #契約のcontractor contracteeの定義
  # def controcters
  #   contracts.where(controctee: id).map(&user)
  # end
end
