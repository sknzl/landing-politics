class CreateSubordinates < ActiveRecord::Migration[5.2]
  def change
    create_table :subordinates do |t|
      t.string :name
      t.integer :birthyear
      t.references :party, foreign_key: true

      t.timestamps
    end
  end
end
