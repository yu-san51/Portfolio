class Contract < ApplicationRecord

	belongs_to :contractor, class_name: 'User'
	belongs_to :contractee, class_name: 'User'
	belongs_to :item
	has_many :reviews
	accepts_nested_attributes_for :reviews

	# 案件を作成したほうが契約を断る可能性を考えて、契約する側請け負う側どちらにもステータスを持たせる
	# AASM
	enum contractor_status: { spplying: 0, fulfillment: 1, contract_finish: 2, contract_end: 3, contract_cancel: 4 }, _prefix: :contractor
	enum contractee_status: { standing: 0, fulfillment: 1, contract_finish: 2, contract_end: 3, contract_cancel: 4 }, _prefix: :contractee

	CONTRACTOR_PROGRESS_STATUSES = %i[spplying fulfillment contract_finish]
	CONTRACTEE_PROGRESS_STATUSES = %i[standing fulfillment contract_finish]
	scope :contractor_in_progress, -> { where(contractor_status: CONTRACTOR_PROGRESS_STATUSES) }
	scope :contractee_in_progress, -> { where(contractee_status: CONTRACTEE_PROGRESS_STATUSES) }

	# userに宛てられたreviewをとってくる
	def self.contract_reviews(id)
    	where(contractor_id: id).or(where(contractee_id: id)).flat_map(&:reviews)
    end

	def self.contract_average_rate(id)
    	rates = contract_reviews(id).map(&:rate)
    	if rates.present?
    		(rates.sum / rates.count).round(1)
    	end
    end
end