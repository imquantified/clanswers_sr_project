class CreateQuickQuestions < ActiveRecord::Migration
  def change
    create_table :quick_questions do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
    add_index :quick_questions, [:user_id, :created_at]
  end
end
