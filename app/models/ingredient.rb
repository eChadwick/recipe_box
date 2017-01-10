class Ingredient < ActiveRecord::Base
  validates :name, uniqueness: true, presence: { message: 'Ingredient name is required' }
  validates :name, uniqueness: { message: 'Ingredient with that name already exists' }
end
