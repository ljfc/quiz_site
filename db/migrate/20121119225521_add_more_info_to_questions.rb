class AddMoreInfoToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :more_info, :text
  end
end
