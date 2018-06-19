class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :year
      t.references :politician, foreign_key: true
      t.string :action

      t.timestamps
    end
  end
end
