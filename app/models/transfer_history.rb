class TransferHistory < ApplicationRecord

  belongs_to :user

  validates :user_id, presence: true
  validates :target_user_id, presence: true
  validates :amount, presence: true
  validates :status, presence: true
end

