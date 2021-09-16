task :boot do
  require_relative 'config/boot'
end

namespace :db do
  namespace :migrations do
    task run: :up do
      Sequel.extension :migration
      dir_path = ROOT.join("db/migrations")
      Sequel::Migrator.run(Database, dir_path)
    end

    task up: :boot do
      Sequel.extension :migration
      dir_path = ROOT.join("db/migrations")
      Sequel::Migrator.run(Database, dir_path)
    end

    task down: :boot do
      step = ENV.fetch("STEP", 1).to_i
      Sequel.extension :migration
      dir_path = ROOT.join("db/migrations")
      versions = Database[:schema_migrations].select(:filename).map { |h| h.fetch(:filename).to_i }
      target = versions.sort.reverse[step] || 0

      Sequel::Migrator.run(Database, dir_path, target: target)
    end

    task new: :boot do
      name = ENV.fetch("NAME")
      file_path = ROOT.join("db/migrations/#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_#{name}.rb")
      File.open(file_path, "w") do |file|
        file.write(<<~RUBY)
          # frozen_string_literal: true

          Sequel.migration do
            up do
            end

            down do
            end
          end
        RUBY
      end
    end
  end
end
