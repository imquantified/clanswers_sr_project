class CreateQuickAnswers < ActiveRecord::Migration
  def change
    create_table :quick_answers do |t|
    	t.integer :quick_question_id
    	t.integer :user_id    	
    	t.text :content

      t.timestamps
    end
    add_index :quick_answers, :user_id
  end
end
