require "mongoid"
require "ruby-pinyin"
require "active_support/concern"

require "mongoid/pinyin/version"
require "mongoid/pinyin/errors"
require "mongoid/pinyin/field_option"

module Mongoid
  module Pinyin
    extend ActiveSupport::Concern

    included do
      Mongoid::Fields.option :pinyin do |model, field, value|
        FieldOption.new(model, field, value).apply!
      end
    end
  end

  Document.send(:include, Pinyin)
end
