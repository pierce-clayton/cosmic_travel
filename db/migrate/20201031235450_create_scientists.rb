class CreateScientists < ActiveRecord::Migration[6.0]
  def change
    create_table :scientists do |t|
      t.string :name
      t.string :field_of_study
      t.references :planet, foreign_key: true
      t.references :mission, foreign_key: true

      t.timestamps
    end
  end
end
