class Style < ApplicationRecord

	has_many :item_styles, dependent: :destroy
	has_many :items, through: :item_styles, dependent: :destroy
end
