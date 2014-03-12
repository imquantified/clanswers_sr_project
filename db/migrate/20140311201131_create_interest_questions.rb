class CreateInterestQuestions < ActiveRecord::Migration
  def change
    create_table :interest_questions do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
    add_index :interest_questions, [:user_id, :created_at]
  end
end
