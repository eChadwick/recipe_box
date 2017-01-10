require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe '#index' do
    let(:recipes_list) {
      [
        Recipe.new(name: 'test1', directions: 'do stuff.'),
        Recipe.new(name: 'test2', directions: 'thing 1.  thing2')
      ]
    }

    before do
      allow(Recipe).to receive(:all).and_return(recipes_list)
    end

    it 'renders the index view' do
      get :index
      expect(response).to render_template('index')
    end

    it 'returns a 200' do
      expect(response.code).to eq('200')
    end

    it 'assigns recipes to the view' do
      get :index
      expect(assigns(:recipes)).to eq(recipes_list)
    end
  end
end
