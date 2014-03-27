class RemoveSeenFromAnswer < ActiveRecord::Migration
  def change
    remove_column :answers, :seen, :boolean
  end
end
