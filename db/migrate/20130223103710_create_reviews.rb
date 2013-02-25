class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.integer :year
      t.string :review

      t.timestamps
    end
  end
end
