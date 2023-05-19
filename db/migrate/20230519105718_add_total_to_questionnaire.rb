class AddTotalToQuestionnaire < ActiveRecord::Migration[7.0]
  def change
    add_column :questionnaires, :total_score, :integer
  end
end
