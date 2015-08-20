class MongoidTestDocument
  include Mongoid::Document
  include Sunspot::Mongo

  field :title

  has_and_belongs_to_many :tags, class_name: 'MongoidTestDocumentTag'

  searchable do
    text :title
  end
end

class MongoidTestDocumentTag
  include Mongoid::Document
  include Sunspot::Mongo

  field :name

  has_and_belongs_to_many :documents, class_name: 'MongoidTestDocument'
end
