class RenameRegistrationsTableToMemberships < ActiveRecord::Migration[5.0]
  def change
    rename_table :registrations, :memberships
  end
end
