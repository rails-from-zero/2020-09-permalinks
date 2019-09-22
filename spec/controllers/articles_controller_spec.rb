require 'rails_helper'

RSpec.describe ArticlesController do
  describe "#show" do
    before do
      FactoryBot.create(:article, permalink: "my-permalink")
    end

    it "renders successfully" do
      get :show, params: { id: "my-permalink" }

      expect(response.status).to eql(200)
    end

    context "without correct permalink" do
      subject(:perform_request) {
        get :show, params: { id: "wrong-permalink" }
      }

      it "raises error" do
        expect { perform_request }
          .to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
