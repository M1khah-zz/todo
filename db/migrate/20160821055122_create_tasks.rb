class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :list_id
      t.boolean :done, default:  false
      t.integer :position
      t.timestamps null: false
    end
  end
end
