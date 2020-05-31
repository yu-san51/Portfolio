class Contract < ApplicationRecord

	belongs_to :contractor, class_name: "User"
	belongs_to :contractee, class_name: "User"
	belongs_to :item

	enum is_status: { 履行中: 0, 契約終了: 1}
end
