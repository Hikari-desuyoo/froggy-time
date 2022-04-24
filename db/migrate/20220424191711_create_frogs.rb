class CreateFrogs < ActiveRecord::Migration[6.1]
  def change
    create_table :frogs do |t|
      t.string :name
      t.string :scientific_name
      t.string :cpf
      t.string :color
      t.integer :age
      t.boolean :on_sale

      t.timestamps
    end
  end
end
