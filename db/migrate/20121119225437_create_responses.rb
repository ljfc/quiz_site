class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :user
      t.references :answer
      t.text :why
      t.string :session_id
      t.references :rejected_by

      t.timestamps
    end
    add_index :responses, :user_id
    add_index :responses, :answer_id
    add_index :responses, :session_id
    add_index :responses, :rejected_by_id
  end
end
