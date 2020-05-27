class Item < ApplicationRecord

    belongs_to :user
	# belongs_to :teacher, class_name: 'User'
	# belongs_to :student, class_name: 'User'
	has_many :favorites, dependent: :destroy
	has_many :contracts, dependent: :destroy
	has_many :rooms, dependent: :destroy
	has_many :item_style, dependent: :destroy
	has_many :style, through: :item_style, dependent: :destroy

	enum prefer_sex: {どちらでも可: 0, 男性: 1, 女性: 2}
	enum is_continue: {継続案件: true, 単発案件: false}
	enum is_active: {受付中: true, 受付停止中: false}


	#気になるしているかどうか
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end



end
