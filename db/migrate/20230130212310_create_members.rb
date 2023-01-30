class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.float :wage
      t.boolean :injured
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
