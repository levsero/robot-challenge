## Design decisions

Will have a Robot class, Board class and Input class.
The Board will know of the Robots to pass along the commands to the correct one as well as be able to track all their positions to check for valid positioning.
The Robot will track its own position, direction, and control movement.
Will not use an actual matrix in any way but rather just track the positions. (Though a matrix would make checking for crashes much easier so may add it.)
