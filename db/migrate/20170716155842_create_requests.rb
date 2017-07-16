class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :ty
      t.string :ri
      t.string :rn
      t.string :pi
      t.datetime :ct
      t.datetime :lt
      t.string :gwl
      t.float :lat
      t.float :lng
      t.string :geui
      t.string :sr
      t.string :app_eui
      t.string :ltid
      t.datetime :et
      t.integer :st
      t.string :cr
      t.string :cnf
      t.integer :cs
      t.string :con
      t.integer :PM2_5
      t.integer :PM10

      t.timestamps
    end
  end
end
