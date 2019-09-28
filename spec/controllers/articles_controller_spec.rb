require 'rails_helper'

RSpec.describe ArticlesController do
  describe "#show" do
    let(:category) { FactoryBot.create(:category) }

    before do
      FactoryBot.create(:article, permalink: "my-permalink", category: category)
    end

    it "renders successfully" do
      get :show, params: { id: "my-permalink", category_id: category }

      expect(response.status).to eql(200)
    end

    context "without correct permalink" do
      subject(:perform_request) {
        get :show, params: { id: "wrong-permalink", category_id: category }
      }

      it "raises error" do
        expect { perform_request }
          .to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
