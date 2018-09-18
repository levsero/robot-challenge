## Design decisions

The main classes are the `Robot` class, and a `Board` class. There's also an `input` InputCommands class which can be used for reading in files of commands. If we would add further input types it would go here and would then find abstractions within the `process_files` function.
The Board knows of the Robots to pass along the commands to the correct one as well as be able to track all their positions to check for valid positioning.  
The Robot will track its own position, direction, and control movement.  
There are a number of error cases and inputs that are not handled (eg. badly formatted place args).  
Board uses a `COMMAND_MAPPING` to abstract the commands being passed in away from the actual function names in Robot, while still allowing new commands to be easily added.

## testing

Can run the tests using `rspec`.  
The robot_spec's are unit tests on `Robot`. The board_spec cases are integration specs for the `Board` and `Robot`. I felt it reasonable here to have the specs cover both instead of stubbing the `Robot` as it does provide better test coverage as well as still being fairly limited in scope in this case. Too much stubbing in tests can lead to less accurate testing.

## using file input

Can run all the example files using `ruby input.rb` on the command line.  
Output should be:

```
example 1
ALICE: 0,1,NORTH

example 2
BOB: 0,0,WEST

example 3
ALICE: 3,3,NORTH
BOB: 4,2,SOUTH

example 4
ALICE: 2,1,EAST
BOB: 1,1,EAST
```

Alternatively could load the input.rb file in irb and call `InputCommands.process_files(filename)` with whichever files you would like.
