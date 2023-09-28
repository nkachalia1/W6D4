class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, null: false
      t.text :description
      t.timestamp :timestamps

      t.timestamps
    end
  end
end
