class GenerateIsbnWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(id)
    book = Book.find(id)
    book.populate_isbn!
  end
end
