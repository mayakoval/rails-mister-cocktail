class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  # belongs_to makes the link with ingredient_id and cocktail_id
  validates :cocktail, uniqueness: { scope: :ingredient }
end
