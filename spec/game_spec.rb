require 'spec_helper'

describe Game do
  before(:each) do
    @game = Game.new
  end

  it "should have 10 frames + 1 extra (used for the third ball in last frame)" do
    @game.frames.length.should == 11
  end
  
  it "should have numbered frames" do
    @game.frames.map(&:number).should == [1,2,3,4,5,6,7,8,9,10,11]
  end
  
  it "should calculate a gutter game" do
    repeat_roll!(20, 0)
    @game.score.should == 0
  end
  
  it "should calculate an all ones game" do
    repeat_roll!(20, 1)
    @game.score.should == 20
  end

  it "should calculate a spare" do
    roll_spare!
    @game.roll!(3)
    @game.score.should == 16
  end
  
  it "should calculate a strike" do
    roll_strike!
    @game.roll!(3)
    @game.roll!(4)
    @game.score.should == 24
  end
  
  it "should calculate a perfect game" do
    12.times { roll_strike! }
    @game.score.should == 300
  end
  
  it "#score should calculate the current game score" do
    @game.roll!(10)
    @game.roll!(10)
    @game.roll!(3)
    @game.roll!(7)
    @game.roll!(10)
    @game.score.should == 73
  end
    
  it "#score should include the frame bonus in case of spare" do
    repeat_roll!(18,2)
    roll_spare!
    @game.roll!(3)
    @game.score.should == 18*2 + 10 + 3
  end
  
  ## Helper methods
  #################

  def repeat_roll!(number_of_rolls, pins)
    (1..number_of_rolls).each { @game.roll!(pins) }
  end
  
  def roll_spare!
    @game.roll!(5)
    @game.roll!(5)
  end

  def roll_strike!
    @game.roll!(10)
  end
   
end
