# hackR

Remember the 90's, when hacker movies roamed the movie theaters, 
unabated by modern cynicism?

This package lets you rekindle your love of goofy leet hacker names.



## Installation

```r
library(devtools)
install_github(repo="hackR", username="wrathematics")
```


## Package Use

You can take an input and leetify it with `leetify()`:
```r
leetify("wrathematics")
# "WrA+}{3mAtIcS"
```

There's an element of random chance here, so re-running can have
different results:

```r
leetify("wrathematics")
# "wRa+hE^^A+IcS"
```

If you can't think of an awesome hacker name, try the `rleet()` 
function, which produces a random leet hacker name:

```r
rleet()
# "DaRxVoR+eX"
rleet()
# "s+@rVo!d"
rleet()
# "cRyPtOv!pEr"
```



## Software license and disclaimer

Copyright (C) 2014 Drew Schmidt. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice, 
    this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */

