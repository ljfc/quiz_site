class CreatePossibleAnswers < ActiveRecord::Migration
  def change
    create_table :possible_answers do |t|
      t.references :question
      t.text :text
      t.boolean :correct

      t.timestamps
    end
    add_index :possible_answers, :question_id
  end
end
