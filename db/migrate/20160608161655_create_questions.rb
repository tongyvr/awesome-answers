# migrations are used to change the structure of the database. for example: creating tables. dropping tables, adding colums to tables, removing colums from tables. adding indexes, remove indexes
class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
