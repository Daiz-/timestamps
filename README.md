# timestamps

*timestamps* is a small Node.js module for parsing and formatting video and ASS subtitle timestamps.

## Installation

timestamps is available via npm:

```bash
$ npm install timestamps
```

## Usage

```javascript
var time = require('timestamps');

// time.parse(string) will parse valid full and ASS timestamps into milliseconds
var test1 = time.parse('01:24:22.203'); // -> 5062203
var test2 = time.parse('1:03:45.21');   // -> 3825210

// time.stamp(ms) and time.ass(ms) will return valid full and ASS timestamps from milliseconds
time.stamp(test1); time.stamp(test2);   // -> "01:24:22.203", "01:03.45.210"
time.ass(test1); time.ass(test2);       // -> "1:24:22.20", "1:03:45.21"

// time.parts(ms) returns an object with the individual parts of the timestamps.
// You can be use it eg. for creating custom timestamps with your own formatting.
// If you need simple zero padding, get the 'zpad' module from npm.
time.parts(test1);                      // -> {hh: 1, mm: 24, ss: 22, cs: 20, ms: 203}
time.parts(test2);                      // -> {hh: 1, mm:  3, ss: 45, cs: 21, ms: 210}
```