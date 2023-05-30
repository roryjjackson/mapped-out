class AddProfileIdToQuestionnaire < ActiveRecord::Migration[7.0]
  def change
    add_reference :questionnaires, :profile, null: false, foreign_key: { to_table: :profiles }
  end
end
