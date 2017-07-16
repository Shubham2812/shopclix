class AddColumnToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :gstin, :string
    add_column :profiles, :aadhar_no, :string
  end
end
