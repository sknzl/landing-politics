class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :date
      t.references :politician, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
