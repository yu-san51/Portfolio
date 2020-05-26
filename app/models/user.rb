class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :contracts, dependent: :destroy

  # has_many :teachers, dependent: :destroy
  # has_many :students, dependent: :destroy
  attachment :image  #refile
  acts_as_paranoid   #paranoia

  enum sex: {男性: true, 女性: false}

  def controcters
    contracts.where(controctee: id).map(&user)
  end
end
