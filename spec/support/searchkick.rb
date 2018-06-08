# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    # reindex models
    Book.reindex

    # and disable callbacks
    Searchkick.disable_callbacks
  end

  config.around(:each, search: true) do |example|
    Searchkick.enable_callbacks
    example.run
    Searchkick.disable_callbacks
  end
end
