# coding: utf-8
require "spec_helper"

module Mongoid
  module Pinyin
    describe Pinyin do
      let(:dummy) {Dummy.new(:name => "name名字")}

      subject {dummy}

      it {should respond_to :name_pinyin_sentence}
      it {should respond_to :name_pinyin_abbr}
      it {should respond_to :update_name_pinyin!}
      it {expect(dummy.name).to eq "name名字"}
      it {expect(dummy.name_pinyin_sentence).to eq "name ming zi"}
      it {expect(dummy.name_pinyin_abbr).to eq "namemz"}

      context "when updating name" do
        before {dummy.name = "haha哈哈"}
        it {expect(dummy.name).to eq "haha哈哈"}
        it {expect(dummy.name_pinyin_sentence).to eq "haha ha ha"}
        it {expect(dummy.name_pinyin_abbr).to eq "hahahh"}
      end

      context "when field is not a `String'" do
        subject {Dummy.send :field, :bla, :type => Boolean, :pinyin => true}

        it {expect{subject}.to raise_error(InvalidTypeError, "bla")}
      end
    end
  end
end
