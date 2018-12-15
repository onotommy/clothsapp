class History < ApplicationRecord
  has_many :history_details
  has_many :cloths, through: :history_details
  accepts_nested_attributes_for :history_details
    
end
