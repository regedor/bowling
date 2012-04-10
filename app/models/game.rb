class Game < ActiveRecord::Base
  has_many :frames  
  
  after_initialize :setup_game

  def roll!(number_of_pins)
    frame = self.find_current_frame
    frame.roll! number_of_pins
    self.current_frame_number += 1 if frame.finished?  
    self.save
  end

  def finished?
    self.current_frame_number == 11
  end

  def score
    self.game_frames.map(&:score).inject(:+)
  end
  
  def find_current_frame
    self.frames[self.current_frame_number - 1]
  end
  
  def game_frames
    self.frames[0..9]
  end
  
  def find_frame_by_number(number)
    self.frames[number - 1]
  end

  def setup_game
    return if self.frames.present?
    self.current_frame_number = 1
    11.times do |frame_number|
      self.frames.build { |frame| frame.number = frame_number + 1 }
    end
    self.save
  end

end
