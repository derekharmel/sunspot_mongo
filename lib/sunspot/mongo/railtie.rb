module Sunspot
  module Mongo
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load 'sunspot/mongo/tasks.rb'
      end
    end
  end
end
