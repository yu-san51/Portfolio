class Item < ApplicationRecord

	enum prefer_sex: {どちらでも可: 0, 男性: 1, 女性: 2}
	enum is_continue: {継続案件: true, 単発案件: false}
	enum is_active: {受付中: true, 受付停止中: false}
end
