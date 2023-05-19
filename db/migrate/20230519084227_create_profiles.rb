class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :hours
      t.string :title
      t.text :how
      t.text :why
      t.text :what
      t.text :advice
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
