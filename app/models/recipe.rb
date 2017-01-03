class Recipe < ActiveRecord::Base
  validates :name, uniqueness: true, presence: {message: 'Recipe name is required'}
  validates :directions, presence: {message: 'Recipe directions are required'}
end
