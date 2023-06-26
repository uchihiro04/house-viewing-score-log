class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.references :room, null: false, foreign_key: true
      t.string :reviewer_name, null: false
      t.integer :living_room, null: false
      t.integer :storage, null: false
      t.integer :kitchen, null: false
      t.integer :bath, null: false
      t.integer :toilet, null: false
      t.integer :equipment, null: false
      t.integer :surroundings, null: false
      t.integer :rent, null: false

      t.timestamps
    end
  end
end
