class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :favorites, dependent: :destroy
  has_many :item_favorites, through: :favorites, source: :item

  has_many :messages, dependent: :destroy, foreign_key: "sender_id"

  has_many :contracts, dependent: :destroy
  # has_many :contractor_relationships, foreign_key: "contractor_id", class_name: "Contract", dependent: :destroy
  # has_many :contractors, through: :contractor_relationships
  # has_many :contractee_relationships, foreign_key: "contractee_id", class_name: "Contract", dependent: :destroy
  # has_many :contractees, through: :contractee_relationships
  has_many :contractors, through: :contracts, source: :contractor
  has_many :contractor_relationships, class_name: 'Contract', foreign_key: 'contractee_id'
  has_many :contractees, through: :contractor_relationships, source: :users


  attachment :image  #refile
  acts_as_paranoid   #paranoia

  validates :name, presence: true, length: {maximum: 50}
  validates :sex, presence: true
  validates :user_type, presence: true


  enum sex: {男性: 1, 女性: 2}
  enum user_type: {teacher: 1, student: 2}



end
