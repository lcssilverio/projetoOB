class AddTemaIdToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :tema_id, :integer
  end
end
