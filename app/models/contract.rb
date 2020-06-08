class Contract < ApplicationRecord

	belongs_to :contractor, class_name: 'User'
	belongs_to :contractee, class_name: 'User'
	belongs_to :item


	# 案件を作成したほうが契約を断る可能性を考えて、契約する側請け負う側どちらにもステータスを持たせる
	enum contractor_status: { spplying: 0, fulfillment: 1, contract_finish: 2, contract_end: 3, contract_cancel: 4 }, _prefix: :contractor
	enum contractee_status: { standing: 0, fulfillment: 1, contract_finish: 2, contract_end: 3, contract_cancel: 4 }, _prefix: :contractee
end
