class CreateGuides < ActiveRecord::Migration[6.0]
  def change
    create_table :guides do |t|
      t.references :user, null: false, foreign_key: true
      t.references :guide, null: true, foreign_key: true
      t.string :title
      t.string :content
      t.string :champion

      t.timestamps
    end
  end
end
