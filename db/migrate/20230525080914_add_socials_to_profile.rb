class AddSocialsToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :linked_in_url, :string
    add_column :profiles, :instagram_url, :string
  end
end
