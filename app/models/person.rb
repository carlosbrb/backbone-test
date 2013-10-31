class Person < ActiveRecord::Base
  validates :name,    :presence => true
  validates :address, :presence => true
  validates :age,     :presence => true
end
