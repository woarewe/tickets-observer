# frozen_string_literal: true

Database = Sequel.connect(ENV.fetch("DATABASE_URL"), logger: Container.fetch("logger"))
