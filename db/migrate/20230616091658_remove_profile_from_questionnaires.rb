class RemoveProfileFromQuestionnaires < ActiveRecord::Migration[7.0]
  def change
    remove_reference :questionnaires, :profile, foreign_key: true
  end
end
