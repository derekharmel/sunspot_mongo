#### Next

* Changed `DataAccessor#load_all` to use the `.find` method for MongoMapper and Mongoid for loading a group of documents - [@derekharmel](https://github.com/derekharmel).
* Changed `load` and `load_all` methods to not force ids to BSON::ObjectId's - [@derekharmel](https://github.com/derekharmel).
* [#5](https://github.com/derekharmel/sunspot_mongo/pull/5): Added CONTRIBUTING and CHANGELOG - [@dblock](https://github.com/dblock).
* [#5](https://github.com/derekharmel/sunspot_mongo/pull/5): Added Travis-CI - [@dblock](https://github.com/dblock).
* [#5](https://github.com/derekharmel/sunspot_mongo/pull/5): Added RuboCop, Ruby-style linter - [@dblock](https://github.com/dblock).
* [#1](https://github.com/derekharmel/sunspot_mongo/pull/1): Also search subdirectories of models in `rake sunspot:mongo:reindex` - [@aaw](https://github.com/aaw).
* Your contribution here.

#### 1.0.1 (2011/10/08)

* Created rake task `sunspot:mongo:reindex` and a Railtie - [@balexand](https://github.com/balexand).

#### 1.0 (2011/08/11)

* Initial public release - [@balexand](https://github.com/balexand).
