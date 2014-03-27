class ChangeSeenToPropertySentInQuestions < ActiveRecord::Migration
  def change
    rename_column :questions, :seen, :property_sent
  end
end
