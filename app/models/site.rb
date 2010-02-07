class Site < ActiveRecord::Base
  has_many :samples

  validates_presence_of :name, :lat, :lng

  def to_s
    name
  end
end
