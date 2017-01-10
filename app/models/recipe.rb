class Recipe < ActiveRecord::Base
  validates :name, presence: {message: 'Recipe name is required'}
  validates :name, uniqueness: {message: 'Recipe name is already in use'}
  validates :directions, presence: {message: 'Recipe directions are required'}
end
