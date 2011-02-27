class CreateClicks < ActiveRecord::Migration
  def self.up
    create_table :clicks do |t|
      t.string :url
      t.string :request_ip
      t.text :request_data

      t.timestamps
    end
  end

  def self.down
    drop_table :clicks
  end
end
