class CreateEnquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :enquiries do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.text :message

      t.timestamps
    end
  end
end
