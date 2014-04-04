class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :content
      t.boolean :quick_flag
      t.boolean :interest_flag
      t.boolean :thoughtful_flag


      t.timestamps
    end
    add_index :questions, [:user_id, :created_at]
  end
end
