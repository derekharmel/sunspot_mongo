#### 1.2.1 (Next)

* Your contribution here.

#### 1.2.0 (2015/08/28)

* [#9](https://github.com/derekharmel/sunspot_mongo/pull/9): Changed `DataAccessor` to fix support for eager loading of associations - [@cec](https://github.com/cec).
* [#9](https://github.com/derekharmel/sunspot_mongo/pull/9): Changed `rake sunspot:mongo:reindex` to support namespaced models - [@cec](https://github.com/cec).
* [#9](https://github.com/derekharmel/sunspot_mongo/pull/9): Renamed `rake sunspot:mongo:reindex` to `sunspot:reindex`, overriding Sunspot's original task - [@cec](https://github.com/cec).
* [#9](https://github.com/derekharmel/sunspot_mongo/pull/9): Added UPGRADING - [@cec](https://github.com/cec).

#### 1.1.0 (2015/01/27)

* Changed `DataAccessor#load_all` to use the `.find` method for MongoMapper and Mongoid for loading a group of documents - [@derekharmel](https://github.com/derekharmel).
* Changed `load` and `load_all` methods to not force ids to BSON::ObjectId's - [@derekharmel](https://github.com/derekharmel).
* [#5](https://github.com/derekharmel/sunspot_mongo/pull/5): Added CONTRIBUTING and CHANGELOG - [@dblock](https://github.com/dblock).
* [#5](https://github.com/derekharmel/sunspot_mongo/pull/5): Added Travis-CI - [@dblock](https://github.com/dblock).
* [#5](https://github.com/derekharmel/sunspot_mongo/pull/5): Added RuboCop, Ruby-style linter - [@dblock](https://github.com/dblock).
* [#1](https://github.com/derekharmel/sunspot_mongo/pull/1): Also search subdirectories of models in `rake sunspot:mongo:reindex` - [@aaw](https://github.com/aaw).

#### 1.0.1 (2011/10/08)

* Created rake task `sunspot:mongo:reindex` and a Railtie - [@balexand](https://github.com/balexand).

#### 1.0 (2011/08/11)

* Initial public release - [@balexand](https://github.com/balexand).
