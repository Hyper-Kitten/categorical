Categorical
===========

Categorical is an intentionally simple and straight forward way to add tagging to a Rails application. 

Install
-------

Categorical is a Rails engine tested against Rails >= 4.1 and Ruby >= 2.0.0. To get started, add Categorical to your Gemfile, bundle install, and copy the necessary migrations:

`rake categorical:install:migrations`

Run the migrations:

`rake db:migrate`

Use
---

The Categorical::Tag behaves like an ordinary tag. It has a label attribute that can be used to name your tag. 

```ruby
tag = Categorical::Tag.create!(label: 'Ruby')
tag2 = Categorical::Tag.create!(label: 'Haskell')
```

On any models that you would like to add tags just include the Taggable module:

``` ruby
class Post < ActiveRecord::Base
  include Categorical::Taggable
end
```

You can now add tags to Posts like any other Rails [has_many relationship](http://guides.rubyonrails.org/association_basics.html#has-many-association-reference "Rails Has Many Relationship"):

```ruby
tag = Categorical::Tag.create!(label: 'Ruby')
tag2 = Categorical::Tag.create!(label: 'Haskell')

post = Post.create!(title: 'Ruby Composition')
post2 = Post.create!(title: 'Haskell Style')
post3 = Post.create!(title: 'What Haskell can Teach Us About Ruby')

post.tags << tag
post2.tags << tag2
post3.tags << [tag1, tag2]
```
### Customizing the Categorical::Tag Model

Sometimes you want to make changes to or add onto the Categorical::Tag model. To do this create the following file in your application:

app/models/categorical/tag.rb

```ruby
class Categorical::Tag < ActiveRecord::Base
  include Categorical::Concerns::Models::Tag
end
```

You can then add or override it however you wish.

Todo
----

Create a generator that generates the Categorical::Tag model in the host application.

