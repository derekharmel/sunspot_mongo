# Delete reindex task registered by sunspot_rails
tasks = Rake.application.instance_variable_get '@tasks'
tasks.delete 'sunspot:reindex'

namespace :sunspot do
  desc "Reindex all models that include Sunspot::Mongo and are located in your application's models directory."
  task :reindex, [:models] => :environment do |_t, args|
    sunspot_models = if args[:models]
                       args[:models].split('+').map(&:constantize)
                     else
                       Rails.application.eager_load!
                       Sunspot.searchable # when a model calls searchable, it registers itself to Sunspot
                     end

    sunspot_models.each do |model|
      puts "reindexing #{model}"
      Sunspot.remove_all(model)
      model.all.each(&:index)
      Sunspot.commit
    end
  end
end
