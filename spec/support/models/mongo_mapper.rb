class MongoMapperTestDocument
  include MongoMapper::Document
  include Sunspot::Mongo

  key :title, String

  searchable do
    text :title
  end
end

class MongoMapperTestDocumentWithOptions
  include MongoMapper::Document
  include Sunspot::Mongo

  key :title, String

  searchable(:auto_index => false, :auto_remove => false) do
    text :title
  end
end
