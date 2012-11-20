class AddOrderToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :order, :integer, default: 0
    add_index :questions, :order
  end
end
