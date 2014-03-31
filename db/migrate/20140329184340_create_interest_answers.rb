class CreateInterestAnswers < ActiveRecord::Migration
  def change
    create_table :interest_answers do |t|
    	t.integer :interest_question_id
    	t.integer :user_id
    	t.text :content

      t.timestamps
    end
    add_index :interest_answers, :user_id
  end
end