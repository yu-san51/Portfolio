class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :item_favorites, through: :favorites, source: :item

  has_many :messages, dependent: :destroy, foreign_key: "sender_id"

  has_many :contracts, dependent: :destroy
  has_many :contractor_relationships, foreign_key: "contractor_id", class_name: "Contract", dependent: :destroy
  has_many :contractor_id, through: :contractor_relationships
  has_many :contractee_relationships, foreign_key: "contractee_id", class_name: "Contract", dependent: :destroy
  has_many :contractee_id, through: :contractee_relationships


  attachment :image  #refile
  acts_as_paranoid   #paranoia

  enum sex: {男性: true, 女性: false}
  enum user_type: {teacher: 1, student: 2}



end
