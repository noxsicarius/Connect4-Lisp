3152 Project - Connect 4
===========
3152 Programming Project Proposal

Variable Difficulty Connect Four

Language: Lisp

AI has been an integral part of computer games since their beginning. A well crafted, intelligent AI program can make for a challenging—or even impossible to beat—competitor. 

Our project will focus on this traditional use of AI by simulating the general game play of the classic board game of Connect Four. Our implementation will be designed for one human player versus a computer player. The computer player will have 3 settings to play against: Easy, Medium, and Hard. If time permits it will even be given an Impossible level. Computer AI comes into play to a small amount in the Medium difficulty, but is mostly seen in the Hard difficulty. The computer at easy level will make relatively random, but legal moves. The medium level will attempt to get 4 in a row in the fastest or easiest manner such that it will drop 4 game pieces in the right corner unless blocked by a player. The hard level will attempt to trick the user by predicting future moves by the user, and—if there is enough time—an impossible level will be implemented to make the computer anticipate moves made by the player and block every possible win for the player while attempting to get win itself. Impossible can be expected to only
result in a win or draw against a user.

Goals:
* Implement a working version of Connect Four complete with ASCII game board.
* Properly Implement an Easy, Medium, Hard, and Impossible AI Player component to compete with the User.
* Make the AI anticipate and learn the user’s next steps on the Impossible setting.


Possible board setups:

Something with a circle such as a face or symbol

    o o o o o o o
    o o o o o o o
    ☺ o o o o o o
    ☺ ☺ ☻ o o o o
    ☻ ☻ ☺ ☻ o o o
    ☻ ☺ ☻ ☺ o o o

A matrix with X and O or any other combination (could also use player's initials and C for computer)

    |_|_|_|_|_|_|_|
    |_|x|_|_|_|_|_|
    |_|o|x|_|_|o|_|
    |_|o|o|x|x|x|_|
    |_|o|x|o|x|x|_|
    |o|x|o|o|o|x|_|

Those two seem to be the cleanest way of representing this graphically. If you have a better idea please map it out here.
