// book of crazy
// copyright: dan fichter

// main voice
(
SynthDef(\organ, { | out, freq = 440, amp = 0.5, nharms = 9, pan = 0.7, gate = 100 |
  var audio = Blip.ar(freq, nharms, amp, mul:0.23);
  var env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

// staccato notes in main voice
(
SynthDef(\organStac, { | out, freq = 440, amp = 0.5, nharms = 9, pan = 0.7, gate = 100 |
  var audio = Blip.ar(freq, nharms, amp, mul:0.26);
  var env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

// legato notes in main voice
(
SynthDef(\organLeg, { | out, freq = 440, amp = 0.5, nharms = 9, pan = 0.7, gate = 100 |
  var depthChange, vibrato, audio, env;
  depthChange = Line.kr(0, 60, 1.4);
  vibrato = SinOsc.ar(freq: freq, mul: depthChange, add: freq);
  audio = Blip.ar(vibrato, nharms, vibrato, mul:0.35);
  env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

// main voice, wobbly
(
SynthDef(\organ2, { | out, freq = 440, amp = 0.5, nharms = 9, pan = 0.7, gate = 100 |
  var depthChangeVibrato, depthChangeHarms, vibrato, audio, env, harms;
  depthChangeVibrato = Line.kr(0, 20, 3);
  depthChangeHarms = Line.kr(0, 2.3, 240);
  vibrato = SinOsc.ar(freq: freq, mul: depthChangeVibrato, add: freq);
  harms = SinOsc.ar(freq: nharms, mul: depthChangeHarms, add: nharms);
  audio = Blip.ar(vibrato, harms, vibrato, mul:0.23);
  env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

// wobbly
(
SynthDef(\organStac2, { | out, freq = 440, amp = 0.5, nharms = 9, pan = 0.7, gate = 100 |
  var depthChangeVibrato, depthChangeHarms, vibrato, audio, env, harms;
  depthChangeVibrato = Line.kr(0, 20, 3);
  depthChangeHarms = Line.kr(0, 5, 10);
  vibrato = SinOsc.ar(freq: freq, mul: depthChangeVibrato, add: freq);
  harms = SinOsc.ar(freq: nharms, mul: depthChangeHarms, add: nharms);
  audio = Blip.ar(vibrato, harms, vibrato, mul:0.23);
  env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

// wobbly
(
SynthDef(\organLeg2, { | out, freq = 440, amp = 0.5, nharms = 9, pan = 0.7, gate = 100 |
  var depthChangeVibrato, depthChangeHarms, vibrato, audio, env, harms;
  depthChangeVibrato = Line.kr(0, 20, 3);
  depthChangeHarms = Line.kr(0, 2.3, 240);
  vibrato = SinOsc.ar(freq: freq, mul: depthChangeVibrato, add: freq);
  harms = SinOsc.ar(freq: nharms, mul: depthChangeHarms, add: nharms);
  audio = Blip.ar(vibrato, nharms, vibrato, mul:0.23);
  env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

// for the solo section
(
SynthDef(\organSolo, { | out, freq = 440, amp = 0.5, nharms = 9, pan = 0.2, gate = 100 |
  var audio = Blip.ar(freq, nharms, amp, mul:0.2);
  var env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

// lower voice in the B section
(
SynthDef(\funkbass, { | out, freq = 440, amp = 0.5, nharms = 3.5, pan = 0.3, gate = 100 |
  var depthChange, vibrato, audio, env;
  depthChange = Line.kr(0, 30, 0.5);
  vibrato = SinOsc.ar(freq: freq, mul: depthChange, add: freq);
  audio = Blip.ar(vibrato, nharms, vibrato, mul:0.3);
  env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

// higher voice in the B section
(
SynthDef(\funkorgan, { | out, freq = 440, amp = 0.1, nharms = 8, pan = 0.1, gate = 100 |
  var depthChange, vibrato, audio, env;
  depthChange = Line.kr(0, 25, 0.1);
  vibrato = SinOsc.ar(freq: freq, mul: depthChange, add: freq);
  audio = Blip.ar(vibrato, nharms, vibrato, mul:0.09);
  env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

// upper harmony to higher voice in the B section
(
SynthDef(\funkorgan2, { | out, freq = 440, amp = 0.1, nharms = 8, pan = 0.9, gate = 100 |
  var depthChange, vibrato, audio, env;
  depthChange = Line.kr(0, 35, 0.1);
  vibrato = SinOsc.ar(freq: freq, mul: depthChange, add: freq);
  audio = Blip.ar(vibrato, nharms, vibrato, mul:0.09);
  env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

// string rhythm
(
SynthDef(\plucker, { | out, freq = 440, amp = 0.5, nharms = 35, pan = 0.5, gate = 100 |
  var audio = Pluck.ar(BrownNoise.ar(0.1), Impulse.kr(2), 440.reciprocal, 440.reciprocal, 5, mul:1.8);
  var env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

(
SynthDef(\drum, { | out = 0, sustain = 0.4, drum_mode_level = 0.25,
  freq = 90, drum_timbre = 1.0, amp = 0.8 |
  var drum_mode_sin_1, drum_mode_sin_2, drum_mode_pmosc, drum_mode_mix, drum_mode_env,
      stick_noise, stick_env, drum_reson, tom_mix;
  drum_mode_env = EnvGen.ar(Env.perc(0.0005, sustain), 1.0, doneAction: 2);
  drum_mode_sin_1 = SinOsc.ar(freq*2.1, 0, drum_mode_env * 0.5);
  drum_mode_sin_2 = SinOsc.ar(freq,     0, drum_mode_env * 0.3);
  drum_mode_pmosc = PMOsc.ar(
                Saw.ar(freq*0.1),
                freq*1.2,
                drum_timbre/0.9,
                mul: drum_mode_env*250,
                add: 0);
  drum_mode_mix = Mix.new([drum_mode_sin_1, drum_mode_sin_2, drum_mode_pmosc]) * drum_mode_level;
  stick_noise = Crackle.ar(0.01, 0.1);
  stick_env = EnvGen.ar(Env.perc(0.005, 0.001), 1.0) * 2;
  tom_mix = Mix.new([drum_mode_mix, stick_env]) * 0.04 * amp;
  Out.ar(out, [tom_mix, tom_mix]);
}).add
)

(
SynthDef(\bass, { | out, freq = 440, amp = 0.5, nharms = 1.2, pan = 0.75, gate = 100 |
  var audio = Blip.ar(freq, nharms, amp, mul:0.35);
  var env = Linen.kr(gate, doneAction: 2);
  OffsetOut.ar(out, Pan2.ar(audio, pan, env) );
}).add;
)

(
var reps, key, bass, drum, plucker,
    arpegLine, arpegDur, arpeg, arpeg2, arpegStac, arpegStac2, arpegLeg, arpegLeg2,
    arpegs, arpegs2, arpegOutro, arpegTeaser1, arpegTeaser2,
    funk, funkBass, funkLine, funkLine2, funkDur, funkBassLine, funkBassDur, drumLine, drumDur,
    solo, soloLine1, soloLine2, soloLine3a, soloLine3b, soloLine4, soloLine4a, soloLine4b,
    soloDur1, soloDur2, soloDur3a, soloDur3b, soloDur4, soloDur4a, soloDur4b;

r = \rest;
reps = 1;
key = 30;

TempoClock.default.tempo = 0.997;

// main melody
arpegLine = [10!2,6!1,r,    6,  r,10,13,r,  13!2,r,8!1,r,5,r, 1,r,   15,15,13,   11,  r,   9,   r,9,9,6,8!1, 9!2,   r];
arpegDur  = [   2,  2,4,  0.1,2.9, 2, 1,2,     1,1,  1,1,1,3,21,0,    1, 1, 1,  0.5,3.5,0.67,3.33,1,2,2,  2,0.01,0.99];

arpegOutro = Pbind(
  \instrument,\organ2,
  \midinote,Pseq([10!2,6!1,1,r,6,4,1,-1,-3,-6]+key+24,reps),
  \dur,Pseq(     [   2,  2,1,3,6,2,2, 2, 2, 7]/8,reps),
);

arpegStac = Pbind(
  \instrument,\organStac,
  \midinote,Pseq([r,  1,   r,      15,r,   1,r,      14,15!1,  r,  18,    r]+key+24,reps),
  \dur,Pseq(     [4,0.5,10.5,    0.01,9,   5,2.89,  0.1,   1,1.1,   1, 28.9]/8,reps),
  \sustain,0.003
);

arpegLeg = Pbind(
  \instrument,\organLeg,
  \midinote,Pseq([    r, 15.0!1,    r]+key+24,reps),
  \dur,Pseq(     [36.25,    0.1,27.65]/8,reps),
  \sustain,0.4
);

arpegStac2 = Pbind(
  \instrument,\organStac2,
  \midinote,Pseq([r,  1,   r,     15,r,    1,   r,   14,15!1,  r,  18,    r]+key+24,reps),
  \dur,Pseq(     [4,0.5,10.5,   0.01,9,    5,2.89,  0.1,   1,1.1,   1, 28.9]/8,reps),
  \sustain,0.003
);

arpegLeg2 = Pbind(
  \instrument,\organLeg2,
  \midinote,Pseq([    r, 15.0!1,    r]+key+24,reps),
  \dur,Pseq(     [36.25,    0.1,27.65]/8,reps),
  \sustain,0.2
);

arpegTeaser1 = Ppar([
  Pbind(\instrument,\organ,
    \midinote,Pseq([10!2,6!1,r,6, 1,3]+key+24,reps),
    \dur,Pseq(     [   2,  2,4,8,16,8]/8,reps),
    \sustain,0.1
  ),
  Pbind(
    \instrument,\organStac,
    \midinote,Pseq([r,  1]+key+24,reps),
    \dur,Pseq(     [4,0.5]/8,reps),
    \sustain,0.003
  )
]);

arpegTeaser2 = Ppar([
  Pbind(\instrument,\organ,
    \midinote,Pseq(arpegLine[0..12]+key+24,reps),
    \dur,Pseq(arpegDur[0..12]/8,reps),
    \sustain,0.1
  ),
  Pbind(
    \instrument,\organStac,
    \midinote,Pseq([r,  1,   r,    15,r,  1]+key+24,reps),
    \dur,Pseq(     [4,0.5,10.5,  0.01,9,  5]/8,reps),
    \sustain,0.003
  )
]);

funkBassLine = [6!1,9!2,6,9,6!1,11!2,-1,  -1,3,4,5!1,6!1,r];
funkBassDur  = [  8,  5,1,1,  1,   4, 4,   1,2,2,  2,  1,0];

funkLine  = [6!4,  r,  18!4,   r,18!2,18!3,16!4,r,  16!3,16!2,13!2,15!4,    r,11!2,11!3,10,6,11!2.5,10!1];
funkLine2 = [6!4,  r,  21!4,   r,21!2,21!3,20!4,r,  18!3,20!2,21!2,18!4,    r,15!2,15!3,14,9,16!2.5,13!1];
funkDur   = [0.5,1.5,   0.5, 1.5,   2,   1,   5,1,     1,   1,   1, 0.5,  3.5,   4,   1, 2,2,     2,   1];

drumLine = [6!2,6,6,6!1.5,6!2,6,6,6,6!1.5,6!2,6,6,6!2,r,r,6,r,6,6,6,6,6!1,6!2,6!2,6!2,r,6,6,r,6,6,6,6,6!1,  r,r,6,6,6,6,6,6,6!1,6!1,6!2];
drumDur  = [  2,2,2,    1,  2,2,2,2,    1,  2,2,2,  1,1,1,1,1,1,1,1,1,  1,  2,  2,  2,2,1,1,2,2,1,1,2,  2,  2,1,1,1,1,1,1,1,  1,  1,  1];

soloLine1 = [6!3,6!1,1,6!2,1,1,6!2,6,1,6!2,6,6,5,1!2,1!1,-4,1!2,-4,-4,1!2,1,-4,1!2,1,1,2,3!1,3!1,6,3!1,6!1,6,3!1,3,6,3!1,6,3!1,6,11!2,11,9,6,3,3,-1,-1,-3,-6,9,6,9];
soloDur1  = [  1,  1,2,  2,1,1,  1,1,1,  2,1,1,1,  1,  1, 2,  2, 1, 1,  1,1, 1,  2,1,1,1,  1,  1,2,  2,  1,1,  1,1,1,  2,1,  1,1,   1, 1,2,2,1,1, 1, 1, 1, 2,1,1,1];

soloLine2 = [6!1,6!2,r,1,6!1,10,6!1,6!2,r,1,6!1,10,11!1,10,8,5,1!1,5,8!1,13,16!1,13,11!1,13,r,11,9!1,9,6!1,6,3!1,3!1,3,1,-1,-3,-3,-1,-3,-13,r,-10,-9,-15,r,6];
soloDur2  = [  1,  1,1,1,  1, 1,  1,  1,1,1,  1, 1,   1, 1,1,1,  1,1,  1, 1,   1, 1,   1, 3,1, 1,  1,1,  1,1,  1,  2,2,1, 3, 2, 2, 2, 2,  3,4,  1, 2,  3,1,1];

soloLine3a = [6,6,1,6,1,1,6!2,6,1,6!2,6,6,5,1!2,1,-4,1!2,-4,-4,1!2,1,-4,1!2];
soloDur3a  = [1,1,2,2,1,1,  1,1,1,  2,1,1,1,  1,1, 2,  2, 1, 1,  1,1, 1,  2];

soloLine3b = [10,10,6,10,r,6!1,10,10,6,10, r,1,1!1,2,r,3,6!1,6,3,3,6,6,r,11,15!1,15,r,11,15!1,15,r,6,9,9,6,6,9,9,r,11,9,9,4,4,6,6];
soloDur3b  = [ 1, 1,2, 2,1,  1, 1, 1,1, 2,16,  1,1,1,1,  1,1,1,1,1,1,1,1, 1,   1, 1,1, 1,   1, 1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1];

soloLine4a = [6,6,1,6,1,1,6,6,1,6,6,8,9,10,13,18,16,18,21,18,16,18,22,18,15,18,15,13,13,r,15,15,r,18!1,15,11,r,18!1,15,11,r,18!1,15,11,r];
soloDur4a  = [1,1,2,2,1,1,1,1,1,2,1,1,1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,1, 1, 2,1,   1, 1, 1,1,   1, 1, 1,1,   1, 1, 1,1];

soloLine4b = [18!1,15,11,18!1,11,21!1,18,15,21!1,27,26,23,21,18,15,9,15,18,21,18,21,15,15,15,15,r,15,6];
soloDur4b  = [   1, 1, 1,   1, 1,   2, 1, 1,   1, 1, 1, 1, 1, 1, 1,1, 1, 1, 1, 1, 1, 1, 1, 1, 1,1, 2,1];

soloLine4 = soloLine4a++soloLine4b;
soloDur4  = soloDur4a++soloDur4b;

funkBass = Pbind(
  \instrument,\funkbass,
  \midinote,Pseq(funkBassLine+key,reps*2),
  \dur,Pseq(funkBassDur/8,reps*2),
  \sustain,0.003
);

funk = Ppar([
  Pbind(
    \instrument,\funkorgan,
    \midinote,Pseq(funkLine+key+12,reps*2),
    \dur,Pseq(funkDur/8,reps*2),
    \sustain,0.002
  ),
  Pbind(
    \instrument,\funkorgan2,
    \midinote,Pseq([r] ++funkLine2+key+12,reps),
    \dur,Pseq(     [32]++funkDur/8,reps),
    \sustain,0.002
  )
]);

bass = Pbind(
  \instrument,\bass,
  \midinote,Pseq([6,  1, 3!2, 10,  11!2]+key,reps),
  \dur,Pseq(     [16,16,   8,  8,    16]/8,reps),
);

arpeg = Pbind(
  \instrument,\organ,
  \midinote,Pseq(arpegLine+key+24,reps),
  \dur,Pseq(arpegDur/8,reps),
  \sustain,0.1
);

arpeg2 = Pbind(
  \instrument,\organ2,
  \midinote,Pseq(arpegLine+key+24,reps),
  \dur,Pseq(arpegDur/8,reps),
  \sustain,0.1
);

arpegs = Ppar([arpeg, arpegStac, arpegLeg]);
arpegs2 = Ppar([arpeg2, arpegStac2, arpegLeg2]);

drum = Pbind(
  \instrument,\drum,
  \midinote,Pseq(drumLine+key+6,reps),
  \dur,Pseq(drumDur/8,reps),
);

plucker = Pbind(
  \instrument,\plucker,
  \midinote,Pseq(arpegLine+key+24,reps),
  \dur,Pseq(arpegDur/8,reps),
);

solo = Pseq([
  Ppar([
    Pbind(
      \instrument,\organSolo,
      \midinote,Pseq((soloLine1++soloLine2)+key+24),
      \dur,Pseq((soloDur1++soloDur2)/8)
  ), bass++bass, drum++drum]),
  Ppar([
    Pbind(
      \instrument,\organSolo,
      \midinote,Pseq(soloLine3a+key+24),
      \dur,Pseq(soloDur3a/8)
    ),
    Pbind(
      \instrument,\organSolo,
      \midinote,Pseq(soloLine3b+key+24),
      \dur,Pseq(soloDur3b/8)
    ), bass, drum]),
  Ppar([
    Pbind(
      \instrument,\organSolo,
      \midinote,Pseq((soloLine4)+key+24),
      \dur,Pseq((soloDur4)/8)
  ), bass, drum]),
]);

Pseq([
  bass,
  Ppar([bass,drum]),
  Ppar([bass,drum,arpegs]),
  Ppar([bass,drum,arpegs,plucker]),
  Ppar([drum,funkBass,arpegOutro,plucker]),
  Ppar([drum,funkBass,funk,plucker]),
  Ppar([bass,drum,arpegs,plucker]),
  Ppar([bass,drum,arpegs]),
  Ppar([solo]),
  Ppar([bass,drum,arpegs]),
  Ppar([funkBass,drum,arpegOutro]),
  Ppar([bass,drum])
]).play;
)

(
s.recSampleFormat = 'int32';
s.recHeaderFormat = 'aiff';
s.prepareForRecord;
   {
      s.record;
      wait(360);
      s.stopRecording;
   }.r.play
)
