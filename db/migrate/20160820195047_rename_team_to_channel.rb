class RenameTeamToChannel < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :team, :channel
  end
end
