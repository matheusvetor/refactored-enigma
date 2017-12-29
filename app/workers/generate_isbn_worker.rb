class GenerateIsbnWorker
  include Sidekiq::Worker

  def perform(id)
    book = Book.find(id)
    book.populate_isbn
    book.save
  end
end
