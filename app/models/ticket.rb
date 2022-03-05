class Ticket < ApplicationRecord
  belongs_to :user, optional: true # 退会機能を作るため、user_idがnilでも許可する
  belongs_to :event

  validates :comment, length: { maximum: 30 }, allow_blank: true
end
