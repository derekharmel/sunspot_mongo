namespace :sunspot do
  namespace :mongo do
    desc "Reindex all models that include Sunspot::Mongo and are located in your application's models directory."
    task :reindex, [:models] => :environment do |_t, args|
      sunspot_models = if args[:models]
                         args[:models].split('+').map(&:constantize)
                       else
                         all_files = Dir.glob(Rails.root.join('app', 'models', '**', '*.rb'))
                         all_models = all_files.map do |path|
                           dir = Pathname.new(path).relative_path_from(Rails.root.join('app/models'))
                           dir = dir.to_s.gsub(/#{File.extname(dir)}$/, '')
                           dir.camelize.constantize
                         end
                         all_models.select { |m| m.include?(Sunspot::Mongo) && m.searchable? }
                       end

      sunspot_models.each do |model|
        puts "reindexing #{model}"
        model.all.each(&:index)
        Sunspot.commit
      end
    end
  end
end
