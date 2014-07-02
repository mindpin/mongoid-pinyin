# Mongoid::Pinyin

Extra pinyin fields for Mongoid.

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid-pinyin', :github => "mindpin/mongoid-pinyin"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-pinyin

## Usage

```ruby
require "mongoid/pinyin"

class Dummy
  include Mongoid::Document

  field :name, :type => String, :pinyin => true
end

dummy = Dummy.new(:name => "name名字")

dummy.name_pinyin_sentence #=> "name ming zi"

dummy.name_pinyin_abbr #=> "namemz"
```

## Contributing

1. Fork it ( https://github.com/mongoid/mongoid-pinyin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
