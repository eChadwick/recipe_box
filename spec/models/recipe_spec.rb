require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:name) { 'name' }
  let(:directions) { '1. do something.  2. do something else.' }

  context 'when required attributes are present' do
    let(:model) { Recipe.new name: name, directions: directions }

    it 'is valid' do
      expect(model.valid?).to be true
    end
  end

  context 'when name is missing' do
    let(:model) { Recipe.new directions: directions }

    it 'is invalid' do
      expect(model.valid?).to be false
    end

    it 'adds an error to the model' do
      model.save
      expect(model.errors[:name]).to include('Recipe name is required')
    end
  end

  context 'when directions are missing' do
    let(:model) { Recipe.new name: name }

    it 'is invalid' do
      expect(model.valid?).to be false
    end

    it 'adds an error to the model' do
      model.save
      expect(model.errors[:directions]).to include('Recipe directions are required')
    end
  end

  context 'when name in already in use' do
    let(:model1) { Recipe.new name: name, directions: directions }
    let(:model2) { Recipe.new name: name, directions: directions }

    before do
      model1.save
    end

    it 'is invalid' do
      expect(model2.valid?).to eq false
    end

    it 'adds an error to the model' do
      model2.save
      expect(model2.errors[:name]).to include('Recipe name is already in use')
    end
  end
end
