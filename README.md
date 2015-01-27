[![Build Status](https://travis-ci.org/derekharmel/sunspot_mongo.svg)](https://travis-ci.org/derekharmel/sunspot_mongo)

## Installation

### Mongo Mapper

Put the following in your Gemfile:

```
gem 'mongo_mapper'
gem 'sunspot_mongo'
```

Then run:

```
rails g mongo_mapper:config
rails g sunspot_rails:install
rake sunspot:solr:start
```

### Mongoid

```ruby
gem 'bson_ext'
gem 'mongoid'
gem 'sunspot_mongo'
```

Then run:

```
rails g mongoid:config
rails g sunspot_rails:install
rake sunspot:solr:start
```

## Usage

Add the following to your model (assuming you have a string field named "content"):

```ruby
include Sunspot::Mongo
searchable do
  text :content
end
```

Then search like usual:

```ruby
search = Article.search do
  fulltext "something interesting"
end
search.results
```

Note: Mongoid adds `Article.search`, use `Article.solr_search` instead.

## More info

See the [Sunspot documentation](http://sunspot.github.com/docs/index.html).

## Credit

Based on [sunspot_mongoid](https://github.com/jugyo/sunspot_mongoid) by jugyo.
Originally developed by [balexand](https://github.com/balexand).
