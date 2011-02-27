class AddUserToClick < ActiveRecord::Migration
  def self.up
    add_column :clicks, :user_id, :string
  end

  def self.down
    remove_column :clicks, :user_id
  end
end
