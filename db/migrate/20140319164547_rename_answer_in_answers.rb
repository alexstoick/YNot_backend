class RenameAnswerInAnswers < ActiveRecord::Migration
  def change
    rename_column :answers, :answer, :body
  end
end
