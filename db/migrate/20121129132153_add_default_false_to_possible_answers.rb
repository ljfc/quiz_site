class AddDefaultFalseToPossibleAnswers < ActiveRecord::Migration
  def change
    change_column :possible_answers, :correct, :boolean, :default => false
  end
end
