class AddIndiciesToQuestions < ActiveRecord::Migration
  def change
    # this will add an index (not unqiue) to the questions table
    #  on the title column
    add_index :questions, :title
    add_index :questions, :body


    # To create a composite index:
    # add_index :questions, [:title, :body]
  end
end
