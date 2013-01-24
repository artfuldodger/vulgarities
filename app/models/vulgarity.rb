class Vulgarity < ActiveRecord::Base
  validates :text, presence: true, uniqueness: true

  attr_accessible :text

  def self.random(options = {})
    scope = order('random()')
    scope = scope.where('lower(text) ilike ?', "#{options[:letter]}%") if options[:letter].present?
    scope.first || order('random()').first
  end
end
