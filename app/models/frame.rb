class Frame < ActiveRecord::Base
  belongs_to :game
  
  def roll!(number_of_pins)
    if self.finished? or number_of_pins > 10 or number_of_pins < 0
      raise "InvalidPlay"
    elsif ! self.pins_knocked_down_by_ball_one 
      self.pins_knocked_down_by_ball_one = number_of_pins
    elsif self.last? and self.pins_knocked_down_by_ball_two 
      frame = self.next_frame
      frame.pins_knocked_down_by_ball_one = number_of_pins
      frame.save      
    elsif (self.pins_knocked_down_by_ball_one + number_of_pins < 11) or (self.last? && self.strike?)
      self.pins_knocked_down_by_ball_two = number_of_pins
    else
      raise "InvalidPlay"
    end
    self.save
  end
  
  def score
    total = (self.pins_knocked_down_by_ball_one || 0) + (self.pins_knocked_down_by_ball_two || 0)
    if self.last?
      total + (self.next_frame.pins_knocked_down_by_ball_one || 0)
    elsif self.strike?
      total + strike_bonus
    elsif self.spare?
      total + spare_bonus
    else
      total
    end
  end

  def finished?
    if self.last?
      return(self.pins_knocked_down_by_ball_two && ((!self.spare_or_strike?) || self.next_frame.pins_knocked_down_by_ball_one))
    else 
      return(self.strike? || self.pins_knocked_down_by_ball_two)
    end
  end

  def strike?
    self.pins_knocked_down_by_ball_one == 10
  end
  
  def spare_or_strike?
    (self.pins_knocked_down_by_ball_one || 0) + (self.pins_knocked_down_by_ball_two || 0) > 9
  end
  
  def spare?
    !strike? && spare_or_strike?
  end

  def spare_bonus
    (self.next_frame.pins_knocked_down_by_ball_one || 0 )
  end

  def strike_bonus
    bonus = self.spare_bonus
    if bonus == 10 
      bonus += (next_frame(self.number + 2).pins_knocked_down_by_ball_one ||0)
    else
      bonus += (next_frame.pins_knocked_down_by_ball_two || 0)
    end
    bonus
  end
  
  def last?
    self.number == 10
  end
  
  def next_frame(frame_number=nil)
    self.game.find_frame_by_number(frame_number||self.number + 1)
  end

end
