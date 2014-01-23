require! \zpad

#######################
### PARSING REGEXES ###
#######################

regex =
  full: //^     # full timestamp (00:00:00.000)
  (\d\d):       # hours
  ([0-5]\d):    # minutes
  ([0-5]\d)\.   # seconds
  (\d{3})       # milliseconds
  $//
  ass: //^      # ASS timestamp (0:00:00.00)
  (\d):         # hours
  ([0-5]\d):    # minutes
  ([0-5]\d)\.   # seconds
  (\d{2})       # centiseconds
  $//

#########################
####### CONSTANTS #######
#########################

HOUR   = 60 * 60 * 1000
MINUTE = 60 * 1000
SECOND = 1000