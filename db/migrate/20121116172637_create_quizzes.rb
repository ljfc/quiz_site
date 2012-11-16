class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.references :owner
      t.text :introduction
      t.boolean :featured

      t.timestamps
    end
    add_index :quizzes, :owner_id
    add_index :quizzes, :featured
  end
end
