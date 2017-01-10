require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  context 'when required attributes are set' do
    let(:model) { Ingredient.new(name: 'carrot') }

    it 'is valid' do
      expect(model.valid?).to be true
    end
  end

  context 'when name is missing' do
    let(:model) { Ingredient.new(name: nil) }

    it 'is invalid' do
      expect(model.valid?).to be false
    end

    it 'adds an error to the model' do
      model.valid?
      expect(model.errors[:name]). to include('Ingredient name is required')
    end
  end

  context 'when name is already in use' do
    let(:model1) { Ingredient.new(name: 'carrot') }
    let(:model2) { Ingredient.new(name: 'carrot') }

    before do
      model1.save
    end

    it 'is invalid' do
      expect(model2.valid?).to be false
    end

    it 'adds an error to the model' do
      model2.valid?
      expect(model2.errors[:name]).to include('Ingredient with that name already exists')
    end
  end
end
