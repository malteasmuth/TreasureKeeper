class RemoveChallengeFromMonster < ActiveRecord::Migration[7.0]
  def change
    remove_reference :monsters, :challenge, null: false, foreign_key: true
    remove_column :monsters, :type
    add_column :monsters, :creature_type, :string
  end
end
