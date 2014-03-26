class RemovePosterIdFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :poster_id, :integer
  end
end
