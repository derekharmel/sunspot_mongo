[![Gem Version](https://badge.fury.io/rb/sunspot_mongo.svg)](http://badge.fury.io/rb/sunspot_mongo)
[![Build Status](https://travis-ci.org/derekharmel/sunspot_mongo.svg)](https://travis-ci.org/derekharmel/sunspot_mongo)

## Installation

### Mongo Mapper

Put the following in your Gemfile:

```ruby
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

### Reindexing Objects

If you are using Rails, objects are automatically indexed to Solr as a part of the save callbacks.

If you make a change to the object's "schema" (code in the searchable block), you must reindex all objects so the changes are reflected in Solr. Run:

```
bundle exec rake sunspot:mongo:reindex
```

## More info

See the [Sunspot documentation](http://sunspot.github.com/docs/index.html).

## Credit

Based on [sunspot_mongoid](https://github.com/jugyo/sunspot_mongoid) by jugyo.
Originally developed by [balexand](https://github.com/balexand).
