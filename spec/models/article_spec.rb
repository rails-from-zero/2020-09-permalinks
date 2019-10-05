require 'rails_helper'

RSpec.describe Article do
  describe "#generate_permalink" do
    subject { article.generate_permalink }

    let(:category) { FactoryBot.create(:category) }
    let(:article) {
      FactoryBot.build(:article, title: "Hello world!", category: category)
    }

    it { is_expected.to eql("hello-world") }

    context "with a very long title" do
      let(:article) {
        FactoryBot.build_stubbed(:article, title: "x" * 200)
      }

      it { is_expected.to eql("x" * 50) }
    end

    context "with existing article having the same title" do
      before do
        FactoryBot.create(:article, title: "Hello world!", category: category)
      end

      it { is_expected.to eql("hello-world-1") }
    end

    context "with existing article having the same title and different category" do
      before do
        FactoryBot.create(:article, title: "Hello world!")
      end

      it { is_expected.to eql("hello-world") }
    end

    context "with multiple existing articles having the same title" do
      before do
        FactoryBot.create_list(:article, 3, title: "Hello world!", category: category)
      end

      it { is_expected.to eql("hello-world-3") }
    end
  end

  describe "#save" do
    subject(:save) { article.save }

    let(:article) { FactoryBot.build(:article) }

    before do
      allow(article)
        .to receive(:generate_permalink).and_return("my-permalink")
    end

    it "sets permalink" do
      expect { save }
        .to change { article.permalink }.to("my-permalink")
    end
  end
end
