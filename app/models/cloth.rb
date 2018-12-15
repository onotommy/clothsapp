class Cloth < ApplicationRecord
  has_many :history_details
  has_many :histories, through: :history_details
  accepts_nested_attributes_for :history_details
    
end
