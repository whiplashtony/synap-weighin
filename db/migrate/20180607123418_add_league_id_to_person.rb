class AddLeagueIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :league_id, :int
  end
end
