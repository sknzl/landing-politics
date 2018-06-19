class CreatePoliticians < ActiveRecord::Migration[5.2]
  def change
    create_table :politicians do |t|
      t.string :name
      t.datetime :birthday
      t.boolean :leader
      t.references :party, foreign_key: true

      t.timestamps
    end
  end
end
