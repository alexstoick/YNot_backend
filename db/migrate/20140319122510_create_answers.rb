class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.integer :poster_id
      t.integer :receiver_id
      t.boolean :seen

      t.timestamps
    end
  end
end
