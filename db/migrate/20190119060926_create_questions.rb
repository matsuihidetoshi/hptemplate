class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.string :name
      t.string :address
      t.string :tel
      t.string :email
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
