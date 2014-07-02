module Mongoid
  module Pinyin
    class FieldOption
      attr :model, :name, :type, :enabled

      def initialize(model, field, enabled)
        @model   = model
        @name    = field.name
        @type    = field.type
        @enabled = !!enabled

        validate!
      end

      def apply!
        return if !enabled

        sentence = "#{name}_pinyin_sentence"
        abbr     = "#{name}_pinyin_abbr"
        osetter  = "_set_#{name}"
        nsetter  = "#{name}="

        model.class_eval do
          field sentence, :type => String
          field abbr,     :type => String

          alias :"#{osetter}" :"#{nsetter}"

          define_method nsetter do |value|
            self.send "#{sentence}=", PinYin.sentence(value)
            self.send "#{abbr}=",     PinYin.abbr(value)
            self.send osetter,        value
          end
        end
      end

      private

      def validate!
        return if !enabled
        InvalidTypeError.raise!(name) {type != String}
      end
    end
  end
end
