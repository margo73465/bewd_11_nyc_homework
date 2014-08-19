class CreateBikeshops < ActiveRecord::Migration
  def change
    create_table :bikeshops do |t|
      t.references :location, index: true

      t.timestamps
    end
  end
end
