class Hedgerow < ApplicationRecord
  belongs_to :farm
  belongs_to :hedgerow_type

  def type
    hedgerow_type.category
  end

  def sequestration
    (length * hedgerow_type.sequestration_per_km)
  end
end
