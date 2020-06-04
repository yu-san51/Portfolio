class Contract < ApplicationRecord

	belongs_to :contractor, class_name: "User"
	belongs_to :contractee, class_name: "User"
	belongs_to :item

	enum contractor_status: { 申請中: 0, 履行中: 1, 契約終了: 2, 契約完了: 3 }, _prefix: :contractor
	enum contractee_status: { 待受中: 0, 履行中: 1, 契約終了: 2, 契約完了: 3 }, _prefix: :contractee
end
