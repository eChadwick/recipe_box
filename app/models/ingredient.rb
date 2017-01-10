class Ingredient < ActiveRecord::Base
  validates :name, uniqueness: true, presence: {message: 'Ingredient name is required'}
end
