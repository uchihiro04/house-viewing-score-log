class CreateHouseViewings < ActiveRecord::Migration[7.0]
  def change
    create_table :house_viewings do |t|
      t.uuid :uuid, null: false
      t.index :uuid, unique: true

      t.timestamps
    end
  end
end
