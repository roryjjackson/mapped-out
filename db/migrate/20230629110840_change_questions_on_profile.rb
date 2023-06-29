class ChangeQuestionsOnProfile < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, :what, :q1
    rename_column :profiles, :how, :q2
    rename_column :profiles, :why, :q3
    rename_column :profiles, :advice, :q4
    rename_column :profiles, :linked_in_url, :q5
    rename_column :profiles, :instagram_url, :q6
    add_column :profiles, :q7, :text
    add_column :profiles, :q8, :text
    add_column :profiles, :q9, :text
    change_column :profiles, :q5, :text
    change_column :profiles, :q6, :text
  end
end
