class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :senders, through: :messages, source: :receiver
  has_many :reverse_of_messages, class_name: "Message", foreign_key: "receiver"
  has_many :receivers, through: :reverse_of_messages, source: :user

  has_many :contracts, dependent: :destroy
  has_many :contractor_relationships, foreign_key: "contractor", class_name: "Contract", dependent: :destroy
  has_many :contractors, through: :contractor_relationships
  has_many :contractee_relationships, foreign_key: "contractee", class_name: "Contract", dependent: :destroy
  has_many :contractees, through: :contractee_relationships


  # has_many :teachers, dependent: :destroy
  # has_many :students, dependent: :destroy
  attachment :image  #refile
  acts_as_paranoid   #paranoia

  enum sex: {男性: true, 女性: false}



end
