class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :current_frame_number

      t.timestamps
    end
  end
end
