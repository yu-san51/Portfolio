class Style < ApplicationRecord

	has_many :item_style, dependent: :destroy
	has_many :items, through: :item_style, dependent: :destroy
end
