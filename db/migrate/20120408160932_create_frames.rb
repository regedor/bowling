class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.integer :game_id
      t.integer :number
      t.integer :pins_knocked_down_by_ball_one
      t.integer :pins_knocked_down_by_ball_two
      t.integer :pins_knocked_down_by_ball_three
      t.integer :points                         

      t.timestamps
    end
  end
end
