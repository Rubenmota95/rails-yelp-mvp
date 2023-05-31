class Restaurant < ApplicationRecord
  before_validation :lower_category

  validates :category, inclusion: { in: ['chinese', 'italian', 'japanese', 'french', 'belgian']}
  validates :name, presence: true
  validates :address, presence: true
  has_many :reviews, dependent: :destroy

  private

  def lower_category
    self.category = category.downcase unless category.nil?
  end
end
