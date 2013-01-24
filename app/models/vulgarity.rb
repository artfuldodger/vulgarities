class Vulgarity < ActiveRecord::Base
  validates :text, presence: true, uniqueness: true

  attr_accessible :text

  def self.random
    order('random()').first
  end
end
