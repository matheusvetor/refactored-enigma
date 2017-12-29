class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string     :name,        null: false, default: ''
      t.text       :description, null: false, default: ''
      t.string     :isbn

      t.belongs_to :author, index: true, foreign_key: true
      t.datetime   :published_at

      t.timestamps
    end
  end
end
