# nodoc
class Hotel < ApplicationRecord
  validates_presence_of :name, :address, :description
end
