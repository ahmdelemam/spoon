RSpec.describe RecipesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/recipes").to route_to("recipes#index")
    end

    it "has no route to #new" do
      expect(get: "/recipes/new").not_to route_to("recipes#new")
    end

    it "routes to #show" do
      expect(get: "/recipes/1").to route_to("recipes#show", id: "1")
    end

    it "has no route to #edit" do
      expect(get: "/recipes/1/edit").not_to route_to("recipes#edit", id: "1")
    end


    it "has no route to #create" do
      expect(post: "/recipes").not_to route_to("recipes#create")
    end

    it "has no route to #update via PUT" do
      expect(put: "/recipes/1").not_to route_to("recipes#update", id: "1")
    end

    it "has no route to #update via PATCH" do
      expect(patch: "/recipes/1").not_to route_to("recipes#update", id: "1")
    end

    it "has no route to #destroy" do
      expect(delete: "/recipes/1").not_to route_to("recipes#destroy", id: "1")
    end
  end
end
