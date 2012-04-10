Write a Ruby on Rails application that takes score of a bowling game.
=====================================================================
It should take the number of pins knocked down by each ball as input and give the score for each frame as output. The details:

* Bowling is played by throwing a ball down a narrow alley toward ten wooden pins. The object is to knock down as many pins as possible per throw
* The game is played in ten frames. At the beginning of each frame, all ten pins are set up. The player then gets two tries to knock them all down.
* If the player knocks all the pins down on the first try, it is called a „strike,“ and the frame ends.
* If the player fails to knock down all the pins with his first ball, but succeeds with the second ball, it is called a „spare.“
* After the second ball of the frame, the frame ends even if there are still pins standing.
* A strike frame is scored by adding ten, plus the number of pins knocked down by the next two balls, to the score of the previous frame.
* A spare frame is scored by adding ten, plus the number of pins knocked down by the next ball, to the score of the previous frame.
* Otherwise, a frame is scored by adding the number of pins knocked down by the two balls in the frame to the score of the previous frame.
* If a strike is thrown in the tenth frame, then the player may throw two more balls to complete the score of the strike.
* Likewise, if a spare is thrown in the tenth frame, the player may throw one more ball to complete the score of the spare.
* Thus the tenth frame may have three balls instead of two.

For background information, please see http://en.wikipedia.org/wiki/Ten-pin_bowling
