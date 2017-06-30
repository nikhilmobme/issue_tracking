class CreateUserQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :user_queries do |t|
      t.string :ticket_id
      t.string :subject
      t.string :query
      t.string :raised_by
      t.string :owner
      t.string :status
      t.string :email
      t.string :department

      t.timestamps
    end
  end
end
