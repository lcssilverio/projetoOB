class CreateTemas < ActiveRecord::Migration[6.1]
  def change
    create_table :temas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
