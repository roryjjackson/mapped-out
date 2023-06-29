class AddSummaryToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :summary, :text
    add_column :profiles, :compensation, :string
    add_column :profiles, :time_off, :text
    add_column :profiles, :personal_background, :text
    add_column :profiles, :entry_qualifications, :text
    add_column :profiles, :side_hustles, :text
  end
end
