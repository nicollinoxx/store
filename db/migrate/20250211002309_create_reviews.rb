class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
