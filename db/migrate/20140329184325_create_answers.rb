class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.integer :question_id
    	t.integer :user_id    	
    	t.text :content
      t.boolean :quick_flag
      t.boolean :interest_flag
      t.boolean :thoughtful_flag

      t.timestamps
    end
    add_index :answers, :user_id
  end
end
