class CreateCampsites < ActiveRecord::Migration
  def change
    create_table :campsites do |t|
      t.references :location, index: true

      t.timestamps
    end
  end
end
