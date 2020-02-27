class Dose < ApplicationRecord
  validates :description, :cocktail_id, :ingredient_id, presence: true
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }

  belongs_to :cocktail
  belongs_to :ingredient
end
