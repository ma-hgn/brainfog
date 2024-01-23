

# brainfog

An esoteric programming language based on brainfuck.


## inspiration

I have known about the language brainfuck for a while since it has a reputation in the programming world.
Mostly, it is known to be terrible to write and anything beyond hello-world is practically incomprehensible to mere mortals.

What the language actually tries to achieve, though, is something completely different: The simplest language to possibly implement a compiler/interpreter for.

Now if you liked how brainfuck code was hilariously unreadable, you'll love its' derivative boolfuck - now using bits instead of bytes. Hooray!
Even though decrementing and incrementing now do the same thing - flipping the bit - I would argue the complexity of the language actually increased, all the while making it another order of magnitude more horrendous to work in.

This is something I found beauty in and I started wishing for this beauty to be polished out even further - I wanted to have an even less useful, more atrocious language, that strays yet further from brainfucks initial simplicity.

I believe the field computation should be free.
Free of toxic stereotypes like the expectation that everything shall be represented in base 2.
Free of worries such as UI/UX design and which JavaScript framework to use.
Free of false hope that you will actually finish the project you started this time.

To free programmers from these shackles, I have carefully and lovingly created brainfog.


## specification

Like its ancestors, brainfog has a set of single character instructions and uses a tape of registers.
Since it is a common unrealistic expectation towards computers that all of them should operate in "Binary" because it "works well", I have decided against this.

Brainfog specifically targets platforms operating in base 7 - though it can also be represented in binary.
What this means is that we are not working with bits in our registers, as you would in boolfuck, nor do we work with bytes, which brainfuck would urge you to populate your memory with.

Instead we are working with registers of one sevenit each - or whatever else you may want to call these beautiful creations; You should be free to do so after all.

Successors and predecessors are equally overused in mathematical contexts, which is why I've replaced the `+` and `-` operations with the `5` operation which simply increases the value of the current registers sevenit by 5, wrapping around after 6.

Due to this revolutionary implementation, some operations become much simpler - most notably: adding 5 to a value.
Though a decrement operator seems to the naive user like it would be beneficial, this is actually no more than a conspiracy theory as we all know a decrement of one in mod 7 is actually just four increments of `5` disguised in a trenchcoat.

The movement along the tape is in brainfuck is cool and all, but it's not very freeing for people that have difficulty differentiating between left and right.
And so the tape shall be vertical.
Instead of `<` and `>` you will use the `^` and `v` instructions to move up and down the tape - for freedom.

Jumping if a value is zero, how creative - **NOT** - that's been done a thousand times!
In Brainfog the jump operations have been renamed to `{` and `}`, since these look far fancier than square brackets, and instead of 0 they use the value 6 to determine when to jump.

The enhanced input `;` and output `:` operators now in-/output an sevenit at a time and then move down like `v`, so you can immediately read/write another sevenit.
How these are interpreted is left to your free will. But if you really need it, to convert to 8 bits, simply convert 3 sevenits to base 2 and use the least significant 8 bits and vice-versa.
If you want to be truly free, however, you may come up with a base-7 encoding for characters too - it will be great for the base 7 target platform.
