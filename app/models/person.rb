class Person < ActiveRecord::Base

  has_many :events

  validates :name,    :presence => true
  validates :address, :presence => true
  validates :age,     :presence => true
end
