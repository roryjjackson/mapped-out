class AddProfileToReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :profile, null: false, foreign_key: { to_table: :profiles }
  end
end
