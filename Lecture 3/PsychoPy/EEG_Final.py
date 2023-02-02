## Base Program
from psychopy import visual, core, event, gui
import os, csv, time, random
from AppKit import NSScreen

# Emotiv
from psychopy.hardware import emotiv
from psychopy import visual, core

# use a global variable to always have access to core.Clock();
routineTimer = core.Clock()


# starts recording
cortex_rec = visual.BaseVisualStim(win=win, name="cortex_rec")
cortex_obj = emotiv.Cortex(subject= ParticipantInfo[0])

# injects a marker into the emotiv recording
routineTimer = eegStuff[0]
t = routineTimer.getTime()
tThisFlip = win.getFutureFlipTime(clock=routineTimer)
delta_time = tThisFlip - t
eegStuff[1].inject_marker(value=str('1'), label = 'label', delta_time = delta_time)

# ends recording
cortex_obj.close_session()

STEP 1 Add time column to output:
Import time


def upTIme():
	return [lib.getTickCount64(), time.time()];
output = (...startTime, endTime)