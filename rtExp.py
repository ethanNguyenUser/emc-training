## Base Program
from psychopy import visual, core


# Create window
win = visual.Window([500,500], monitor = "TV", units = "deg");

# Create instructions
stim1 = visual.TextStim(win, 'Hi there', color=(0, 1, 0), colorSpace='rgb', height = 0.5, wrapWidth = 1)

# Create fixation cross
stim2 = visual.shape.ShapeStim(win = win, vertices = "cross", pos = [0,0], fillColor = 'white', size = 0.1, lineColor = 'white');

# Create stimulus
stim3 = visual.Circle(win = win, pos = [0,0], fillColor = 'blue', lineColor = 'red');




# Draw stimulus and update the screen
stim1.draw();
win.flip();
core.wait(1);

stim2.draw();
win.flip();
core.wait(1);

stim3.draw();
win.flip();
core.wait(1);