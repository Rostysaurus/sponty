class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :address
      t.string :busyness
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
