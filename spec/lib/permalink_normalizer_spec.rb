# coding: utf-8
require 'rails_helper'

RSpec.describe PermalinkNormalizer do
  describe "#normalize" do
    subject { PermalinkNormalizer.new(text, max_length: 50).normalize }

    let(:text) { "Hello world!" }

    it { is_expected.to eql("hello-world") }

    context "with a very long title" do
      let(:text) { "x" * 200 }

      it { is_expected.to eql("x" * 50) }
    end

    context "with bad characters at start and end" do
      let(:text) { "~ hello world ~" }

      it { is_expected.to eql("hello-world") }
    end

    context "with numbers" do
      let(:text) { "3 days ago" }

      it { is_expected.to eql("3-days-ago") }
    end

    context "with diacritics" do
      let(:text) { "naïve café" }

      it { is_expected.to eql("naïve-café") }
    end

    context "with kanji and kana" do
      let(:text) { "初めまして、ダニエルです。" }

      it { is_expected.to eql("初めまして-ダニエルです") }
    end

    context "with emoji" do
      let(:text) { "💎 is a gemstone 😃" }

      it { is_expected.to eql("💎-is-a-gemstone-😃") }
    end
  end
end
