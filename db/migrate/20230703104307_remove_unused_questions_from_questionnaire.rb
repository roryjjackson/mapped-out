class RemoveUnusedQuestionsFromQuestionnaire < ActiveRecord::Migration[7.0]
  def change
    remove_column :questionnaires, :q21, :integer
    remove_column :questionnaires, :q22, :integer
    remove_column :questionnaires, :q23, :integer
    remove_column :questionnaires, :q24, :integer
    remove_column :questionnaires, :q25, :integer
  end
end
