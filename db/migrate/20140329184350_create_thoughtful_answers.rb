class CreateThoughtfulAnswers < ActiveRecord::Migration
  def change
    create_table :thoughtful_answers do |t|
    	t.integer :thoughtful_question_id
    	t.integer :user_id
    	t.text :content

      t.timestamps
    end
    add_index :thoughtful_answers, :user_id
  end
end
