RSpec.describe "/recipes", type: :request do
  describe "GET /index" do
    let!(:recipes) { FactoryBot.create_list(:recipe, 15)}

    it "renders a successful response" do
      get recipes_url
      expect(response).to be_successful
    end

    it "renders index" do
      get recipes_url
      expect(response).to render_template(:index)
    end

    it "paginates with only 10 recipes" do
      get recipes_url
      expect(assigns(:recipes).length).to eq(10)
    end

    it "paginates to next page with only 5 recipes" do
      get recipes_url, params: { page: 2 }
      expect(assigns(:recipes).length).to eq(5)
    end
  end

  describe "GET /show" do
    let!(:recipe) { FactoryBot.create(:recipe)}

    it "renders a successful response" do
      get recipe_url(recipe)
      expect(response).to be_successful
    end
  end
end
