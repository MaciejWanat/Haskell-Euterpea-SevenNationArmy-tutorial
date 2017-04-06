import Euterpea

-- main motive

mel1 = e 3 dqn :+: e 3 en :+: g 3 den :+: e 3 den :+: d 3 en --tact 1
mel2 = c 3 hn :+: b 2 hn --tact 2

melody = mel1 :+: mel2 :+: mel1 :+: mel2 -- whole melody (phrase)
melPV = mel1 :+: mel2 :+: mel1 :+: mel2 :=: preVoc -- mel + preVoc

-- percussions

bassDrumPhrase = times 16$ perc AcousticBassDrum qn -- phrase of bd
bassDrum = perc AcousticBassDrum qn

-- vocals 1
preVoc = rest hn :+: rest en :+: times 3 (e 4 en) -- tact before phrase
voc11 = g 4 en :+: e 4 en :+: e 4 en :+: rest en :+: rest hn
voc12 = rest qn :+: rest en :+: d 4 en :+: e 4 en :+: d 4 en :+: e 4 en :+: d 4 en
--voc3 = e 4 en :+: d 4 en :+: e 4 en :+: d 4 en  :+: e 4 den :+: rest sn :+: e 4 en :+: e 4 en
voc13 = e 4 en :+: d 4 en :+: e 4 en :+: d 4 en  :+: tempo(3/4) (times 3 (e 4 en)) -- triplet at the end

voc1 = voc11 :+: voc12 :+: voc13
vocPre1 = voc11 :+: voc12 :+: voc13 :+: preVoc -- voc + preVoc

-- vocals 2
voc21 = times 2 (b 4 en) :+: times 2 (a 4 en) :+: g 4 den :+: fs 4 den :+: e 4 qn
voc22 = times 3 (e 4 en) :+: times 3 (ds 4 en) :+: e 4 wn :+: rest en
--voc22 = times 3 (e 4 en) :+: tempo(3/4) (times 2 (ds 4 en)) :+: e 4 wn :+: rest en

vocPre2 = voc21 :+: voc22 :+: preVoc

-- additional defs

melBD = melody :=: bassDrumPhrase -- melody + BD
melPBD = melPV :=: bassDrumPhrase  -- melody + BD + vocPre (phrase before vocs)
melBDV = vocPre1 :=: melBD -- melody + BD + voc (loop)
melBDV2 = vocPre2 :=: melBD -- melody + BD + voc2
melBDVend = voc1 :=: melBD -- melody - last pre

-- music
--music = melody :+: melPBD :+: times 2 melBDV
music = melody :+: melPBD :+: times 2 melBDV :+: melBDV2 :+: melBDVend