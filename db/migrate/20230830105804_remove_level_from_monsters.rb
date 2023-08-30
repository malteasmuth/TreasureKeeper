class RemoveLevelFromMonsters < ActiveRecord::Migration[7.0]
  def change
    remove_column :monsters, :level, :integer
    remove_column :monsters, :creature_type, :string
    add_column :monsters, :image_url, :string
    add_reference :monsters, :challenge, foreign_key: true
  end
end
