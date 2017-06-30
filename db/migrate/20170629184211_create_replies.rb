class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.string :ticket_id
      t.string :reply
      t.string :replied_by

      t.timestamps
    end
  end
end
