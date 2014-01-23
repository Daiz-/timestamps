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