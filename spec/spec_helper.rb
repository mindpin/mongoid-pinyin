require "rspec"
require "mongoid/pinyin"
require "pry"

ENV["MONGOID_ENV"] = "test"
Mongoid.load!("./spec/mongoid.yml")

class Dummy
  include Mongoid::Document

  field :name, :type => String, :pinyin => true
end

RSpec.configure do |config|
  config.after(:each) do
    Mongoid.purge!
  end
end
