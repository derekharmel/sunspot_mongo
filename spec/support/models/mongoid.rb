class MongoidTestDocument
  include Mongoid::Document
  include Sunspot::Mongo

  field :title

  searchable do
    text :title
  end
end
