class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :poster_id
      t.integer :receiver_id
      t.boolean :seen

      t.timestamps
    end
  end
end
