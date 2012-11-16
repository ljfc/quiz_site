class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :quiz
      t.text :text

      t.timestamps
    end
    add_index :questions, :quiz_id
  end
end
