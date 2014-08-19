class CreateLodgings < ActiveRecord::Migration
  def change
    create_table :lodgings do |t|
      t.references :location, index: true

      t.timestamps
    end
  end
end
