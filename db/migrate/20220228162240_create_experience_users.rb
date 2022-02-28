class CreateExperienceUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :experience_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
