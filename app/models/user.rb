class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :favorites, dependent: :destroy
  has_many :item_favorites, through: :favorites, source: :item

  has_many :messages, dependent: :destroy, foreign_key: "sender_id"

  has_many :contracts
  has_many :contractor_relationships, class_name: "Contract", foreign_key: "contractor_id"
  has_many :contractors, through: :contractor_relationships
  has_many :contractee_relationships, class_name: "Contract" ,foreign_key: "contractee_id"
  has_many :contractees, through: :contractee_relationships


  attachment :image  #refile
  acts_as_paranoid   #paranoia

  validates :name, presence: true, length: {maximum: 50}
  validates :sex, presence: true
  validates :user_type, presence: true


  enum sex: {man: 1, woman: 2}
  enum user_type: {teacher: 1, student: 2}



end
