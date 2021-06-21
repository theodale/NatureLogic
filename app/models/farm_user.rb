class FarmUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :estate_user, optional: true
  has_one :farm_timeline
end
