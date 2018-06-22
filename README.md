# Geckorate

A dead simple decorator for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geckorate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geckorate

## Usage

### A Rails example

Define your decorator as such:

```ruby
# app/decorators/post_decorator.rb

class PostDecorator < Geckorate::Decorator
  def decorate
    {
      title: title,
      username: user.name
    }.to_json
  end
end
```

and initialize it in your controller and use it for your view:
```ruby
# app/controllers/posts_contrller.rb

class PostsController < ApplicationController
  def show
    post           = Post.find(params[:id])
    decorated_post = PostDecorator.new(post).decorate

    render json: { post: decorated_post }
  end
end
```

### For collections

There's a method `decorate_collection(collection)` for decorating collections.
Example: `PostDecorator.decorate_collection(Post.all)` returns an array of
decorated Post objects.

### With paginated collections

Currently, there are two methods for pagination; one for Kaminari
`decorate_kaminari_collection(collection)` and another for will_paginate
`decorate_will_paginate_collection(collection)`. The returned hash from both
methods looks like this:

```ruby
{
  page: 1,
  per_page: 25,
  total: 100,
  records: [{...}, {...}]
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/aonemd/geckorate.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
