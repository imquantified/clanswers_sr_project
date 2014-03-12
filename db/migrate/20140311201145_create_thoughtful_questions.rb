class CreateThoughtfulQuestions < ActiveRecord::Migration
  def change
    create_table :thoughtful_questions do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
    add_index :thoughtful_questions, [:user_id, :created_at]    
  end
end
