require 'rails_helper'

RSpec.describe Recipe, type: :model do
  # let(:model) {Recipe.new name: name, directions: directions}
  let(:name) { 'name' }
  let(:directions) {'1. do something.  2. do something else.'}

  context 'when required attributes are present' do
    let(:model) {Recipe.new name: name, directions: directions}

    it 'is valid' do
      expect(model.valid?).to be true
    end
  end

  context 'when name is missing' do
    let(:model) {Recipe.new directions: directions}

    it 'is invalid' do
      expect(model.valid?).to be false
    end
  end

  context 'when directions are missing' do
    let(:model) {Recipe.new name: name}

    it 'is invalid' do
      expect(model.valid?).to be false
    end
  end
end
