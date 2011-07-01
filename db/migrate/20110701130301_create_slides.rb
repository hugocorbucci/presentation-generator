class CreateSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.references :presentation
      t.string :content
      t.string :image
      
      t.timestamp
    end
  end

  def self.down
    drop_table :slides
  end
end
