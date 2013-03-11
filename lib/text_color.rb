# Found at: http://www.linuxgazette.net/issue65/padala.html

# ATTRIBUTES
RESET      = 0
BRIGHT     = 1
DIM        = 2
UNDERLINE  = 3
BLINK      = 4
REVERSE    = 7
HIDDEN     = 8

# COLORS
BLACK      = 0
RED        = 1
GREEN      = 2
YELLOW     = 3
BLUE       = 4
MAGENTA    = 5
CYAN       = 6
WHITE      = 7

def text_color(attr, color)
  command = String.new

  # Command is the control command to the terminal
  command << "\e[%d;%dm" % [attr, color + 30]
  printf(command)
end
