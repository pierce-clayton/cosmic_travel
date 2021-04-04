class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name
      t.references :scientist, foreign_key: true
      t.references :planet, foreign_key: true

      t.timestamps
    end
  end
end
