class CreateViews < ActiveRecord::Migration[5.2]
  def change
    create_table :views do |t|
      t.integer :goal_id, null:false 

      t.timestamps
    end
  end
end
