class Message < ApplicationRecord

	belongs_to :sender, class_name: "User"
	belongs_to :receiver, class_name: "User"
	# belongs_to :sender_id, class_name: "User"
	# belongs_to :receiver_id, class_name: "User"
end
