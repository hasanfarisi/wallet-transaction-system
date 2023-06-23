class TopupHistory < ApplicationRecord

  belongs_to :user

  validates :user_id, presence: true
  validates :amount, presence: true
  validates :status, presence: true
end
