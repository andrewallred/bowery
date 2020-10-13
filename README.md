# bowery
[druid](github.com/monome/druid) script collection

- [boids.lua](boids.lua): four simulated birds that fly around your input
- [booleanlogic.lua](booleanlogic.lua): logic gates determined by two input gates
- [clockdiv.lua](clockdiv.lua): four configurable clock divisions of the input clock
- [cvdelay.lua](cvdelay.lua): a control voltage delay with four taps & looping option
- [euclidean.lua](euclidean.lua): a euclidean rhythm generator
- [gingerbread.lua](gingerbread.lua): clocked chaos generators
- [lorenz.lua](lorenz.lua): lorenz attractor chaotic lfos
- [samplehold-basic](samplehold-basic.lua): sample and hold basics for scripting tutorial
- [samplehold.lua](samplehold.lua): sample and hold with quantization & randomness
- [seqswitch.lua](seqswitch.lua): route an input to 1 of 4 outputs with optional 'hold'
- [shiftregister.lua](shiftregister.lua): output the last 4 captured voltages & play just friends
- process pieces
  - [first.lua](process-pieces/first.lua): the default crow script
  - [first-chords.lua](process-pieces/first-chords.lua): slightly tweaked crow first script setting output 3 to be in chord mode, output 4 to a clock divider, and output 2 to deliver alternating control voltages
- quantizers
  - [12tet-quantizer.lua](quantizers/12tet-quantizer.lua): a continuous and clocked 12tet quantizer demo
  - [microtonal-quantizer.lua](quantizers/microtonal-quantizer.lua): a continuous microtonal quantizer
  - [microtonal-quantizer-polyphonic.lua](quantizers/microtonal-quantizer-polyphonic.lua): a continuous and polyphonic microtonal quantizer

learn how to upload scripts to crow using [***stage one*** of the crow scripting tutorial](https://monome.org/docs/crow/scripting)

