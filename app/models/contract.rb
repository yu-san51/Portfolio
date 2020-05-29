class Contract < ApplicationRecord

	belongs_to :contractor, class_name: "User"
	belongs_to :contractee, class_name: "User"
	belongs_to :item
end
