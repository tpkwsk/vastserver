class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.integer :limit_start
      t.string :movie_url
      t.boolean :cuepoint1, :null => false, :default => false
      t.boolean :cuepoint2, :null => false, :default => false
      t.boolean :cuepoint3, :null => false, :default => false
      t.boolean :cuepoint4, :null => false, :default => false
      t.boolean :cuepoint5, :null => false, :default => false
      
      t.timestamps
    end
  end
end
