class Contract < ApplicationRecord

	belongs_to :contractor, class_name: "User"
	belongs_to :contractee, class_name: "User"
	belongs_to :item

	enum is_status: {申請中: 0, 履行中: 1, 契約終了: 2}
end
