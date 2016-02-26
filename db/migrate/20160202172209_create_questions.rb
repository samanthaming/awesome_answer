class CreateQuestions < ActiveRecord::Migration
  # No need to specify an 'id' column.
  #  ActiveRecord auto create an integer field called 'id' with autoincrement
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
