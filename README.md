# Fouriest

This is a joke.  Severe apologies if you actually expected this to calculate Fourier transforms for you.  This calculates 'fourier' and 'fouriest' transforms instead.  See [Zach Weiner's paper](http://www.smbc-comics.com/index.php?db=comics&id=2874) for an explanation of the mathematical concepts involved.

-----------------------

### How to use

    bash-3.2$ irb
    irb(main):001:0> require 'fouriest'
    => true
    irb(main):002:0> class Integer; include Fouriest; end
    => Integer
    irb(main):003:0> puts 624.fouriest_didactic
    624 has a four-count of 1.

    The bases in which 624 has a higher four-count are:
    5, in which it is [4, 4, 4, 4], with a four-count of 4.
    12, in which it is [4, 4, 0], with a four-count of 2.
    155, in which it is [4, 4], with a four-count of 2.

    Obviously, the highest four-count among these is 4. The bases which yield this
    four-count are [5]. These are the bases of its fouriest transform!
    => nil
    irb(main):004:0>
