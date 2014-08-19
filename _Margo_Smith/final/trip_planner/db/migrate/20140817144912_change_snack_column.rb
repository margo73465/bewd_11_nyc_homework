class ChangeSnackColumn < ActiveRecord::Migration
  def change
  	rename_column :locations, :snacks, :snack
  end
end
