class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :blog_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
