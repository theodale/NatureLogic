class Hedgerow < ApplicationRecord
    belongs_to :farm
    belongs_to :hedgerow_type
end
