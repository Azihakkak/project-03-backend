class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :title
      t.integer :duration
      t.integer :cost
      t.text :description

      t.timestamps
    end
  end
end
