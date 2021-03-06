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

#########################
###### MAIN OBJECT ######
#########################

time =

  # Parses a timestamp (full or ASS) string.
  # Returns the value in milliseconds.
  parse: (str) ->
    ASS = 1
    if res = str.match regex.full then void
    else if res = str.match regex.ass then
       ASS = 10
    else res = [0,0,0,0,0]
    hh = parse-int res.1, 10
    mm = parse-int res.2, 10
    ss = parse-int res.3, 10
    ms = parse-int res.4, 10
    ms * ASS + ss * SECOND + mm * MINUTE + hh * HOUR

  # Takes a millisecond value as input.
  # Returns hours, minutes, seconds, centiseconds and milliseconds as an object.
  parts: (ms) ->
    hh = ~~  (ms / HOUR)
    mm = ~~ ((ms - hh * HOUR) / MINUTE)
    ss = ~~ ((ms - hh * HOUR - mm * MINUTE) / SECOND)
    cs = ~~ ((ms - hh * HOUR - mm * MINUTE - ss * SECOND) / 10 + 0.5)
    ms = ~~  (ms - hh * HOUR - mm * MINUTE - ss * SECOND + 0.5)

    {hh, mm, ss, cs, ms}

  # Get full timestamp as string from millisecond input value.
  stamp: (ms) ->
    {hh, mm, ss, ms} = time.parts ms
    "#{zpad hh}:#{zpad mm}:#{zpad ss}.#{zpad ms, 3}"

  # Get ASS timestamp as string from millisecond input value.
  ass: (ms) ->
    {hh, mm, ss, cs} = time.parts ms
    "#hh:#{zpad mm}:#{zpad ss}.#{zpad cs}"

module.exports = time