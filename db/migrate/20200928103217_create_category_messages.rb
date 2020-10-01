class CreateCategoryMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :category_messages do |t|
      t.references :message, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
