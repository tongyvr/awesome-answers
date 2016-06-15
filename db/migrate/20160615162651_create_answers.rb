class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      # this will generate an intefer field named 'question_id'
      # the 'index:true,' option will automatically add an index on the question_id field because we are likely going to use it in queries. The 'foreign_key: true' option will automatically add a foreign key constraint on the question_id field referencing the 'id' field in the question table.
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
