class Item < ApplicationRecord

    belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :contracts
	has_many :rooms, dependent: :destroy
	has_many :item_styles, dependent: :destroy
	has_many :styles, through: :item_styles, dependent: :destroy

	enum prefer_sex: {fine: 0, male: 1, female: 2}
	enum is_continue: {continue: true, single: false}
	enum active_status: {open: 1, close: 2, contracted: 3}

	validates :price, presence:true, numericality: { only_integer: true }
	validates :duration, presence:true, length: {maximum: 100}
	validates :title, presence:true, length: {maximum: 100}
	validates :body, presence:true


	#気になるしているかどうか
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end



end
