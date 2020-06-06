class Contract < ApplicationRecord

	belongs_to :contractor, class_name: "User"
	belongs_to :contractee, class_name: "User"
	belongs_to :item


	# 案件を作成したほうが契約を断る可能性を考えて、契約する側請け負う側どちらにもステータスを持たせる
	enum contractor_status: { 申請中: 0, 履行中: 1, 契約終了: 2, 契約満了: 3, 契約キャンセル: 4 }, _prefix: :contractor
	enum contractee_status: { 待受中: 0, 履行中: 1, 契約終了: 2, 契約満了: 3, 契約キャンセル: 4 }, _prefix: :contractee
end
