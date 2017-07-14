class CreateReqs < ActiveRecord::Migration[5.0]
  def change
    create_table :reqs do |t|
      t.string :content

      t.timestamps
    end
  end
end
