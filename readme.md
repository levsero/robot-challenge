## Design decisions

Have a Robot class, Board class and Input function.
The Board knows of the Robots to pass along the commands to the correct one as well as be able to track all their positions to check for valid positioning.
The Robot will track its own position, direction, and control movement.
There are a number of error cases and inputs that are not handled (eg. badly formatted place args).
The Board test cases are integration specs for Board with the Robots.
