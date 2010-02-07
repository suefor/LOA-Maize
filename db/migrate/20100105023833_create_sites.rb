class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name, :null => false
      t.string :location_name
      t.float :lat, :null => false
      t.float :lng, :null => false
      t.timestamps
    end

    add_index :sites, :name
    add_index :sites, :location_name
    add_index :sites, :lat
    add_index :sites, :lng
  end

  def self.down
    drop_table :sites
  end
end
