require 'rails_helper'

RSpec.describe Category do
  describe "#save" do
    subject(:save) { category.save }

    let(:category) { FactoryBot.build(:category, name: "Politics!") }

    it "sets a permalink" do
      expect { save }.to change { category.permalink }.to("politics")
    end
  end
end
