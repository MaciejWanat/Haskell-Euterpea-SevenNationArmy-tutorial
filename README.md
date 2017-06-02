# Seven Nation Army in Haskell + Euterpea tutorial

## Setup and basic informations

This project is basicly a song written by The White Stripes called "Seven Nation Army", programmed in Haskell.
File "sevennation.hs" contains the code.

If you wonder how come that you can program a song using Haskell, check out the package called [Euterpea](http://www.euterpea.com/).

This project is based on Euterpea.

### Instaling environment:
1. Install [Haskell Platform](https://www.haskell.org/platform/)
2. Install [Euterpea](http://www.euterpea.com/download-and-installation/)
3. You are ready to go!

### Starting the program:
1. Turn on ghci (Haskell Platform)
2. To load Euterpea, use 
```
:m + Euterpea
```
3. To load the file, use 
```
:l sevennation.hs
```
4. Type in 
```
play music
```
5. Enjoy!

I hope this project will deliver you some fun.

## Tutorial

### Introdution

If you want to use Euterpea, you need to know how to read notes. Unfortunately, you can't pass it. You have to know the basics.
If you don't know it and still wanna try, it is possible to do it mechanicaly (if you want just to rewrite the notes that you found on the Internet). Here is your cheat sheet:

[- How to read notes](http://www.musicnotes.com/blog/2014/04/11/how-to-read-sheet-music/)

[- Rhythmic values](http://ezstrummer.com/ezriffs/demo/notes_rests.gif)

[- Notes names](http://plankchoir.weebly.com/uploads/1/4/2/7/14279649/756817385.gif)

In the further part, I assume that you know the basics of writing notes.

### Basics

Single sound looks something like this:

```
e 3 qn 
```

One sound contains:
- the name of the sound
- the number of octave
- the value of the note

So, "e 3 qn" is the E quarter note in the octave number 3.

You can play the sound in ghci console (after including Euterpea) with 

```
play (d 3 en)
```

As you can see in the example, the line containing melody looks like this:

```
ef 3 qn :+: es 3 en :+: g 3 hn :+: rest en :+: e 3 wn :=: d 3 en 
```

As you can probably see, its a sequence of the 5 sounds and one pause.

"qn" stands for the quarter note, "hn" stands for the half note, and so on, and so on. "den" stands for the eight note with a dot. 
"ef" stands for the E flat, "es" is the E sharp.

If we want to include the pause, just type "rest" and the value of pause (just like in the example).

### Definition of a tact, phrase and combining notes 

Notes are being combined with ":+:" and ":=:" symbols. ":=:" means that the sounds will be played simultaneously, ":+:" means that the ounds will be played one after another.
The biggest defect of the Euterpea is that it doesn't bring any definition of a tact. You must control it on your own. Euterpea just lets you playing sounds in a sequence.
But with the cons comes the pros - you are writing in Haskell, so you can define anything in a way that is very convinient for a programmer. 
So if you want to define a tact, you need to simply assign it to the variable

```
tact1 = e 3 dqn :+: e 3 en :+: g 3 den :+: e 3 den :+: d 3 en 
```	

That's a definition of an example 4/4 tact. 
From now on you can play a whole tact using 

```
play mel1
```

Tacts can be merged into phrases, for example:

```
phrase1 = tact1 :+: tact2 :+: tact3 :+: tact4
```

You can merge as many sounds as you like, in any configuration.

### Rhythm, repeating phrases, declaring your own instruments

If you want to declare your own instrument, you just need to add "instrument NameOfInstrument". For example, to play sound by TenorSax:

```
play (instrument TenorSax (e 4 qn))
```

To programm percussions, you need to declare every single sound (bass drum, snare drum, hi hat).
You do this just like any other instrument, just skipping the value part and using word "perc" instead of an "instrument".

```
bassDrum = perc AcousticBassDrum qn
```

You can assign it to variables just like other examples (look into the code for more).

### Changing tempo, triplets

You can change tempo - divide or multiply it. Euterpea doesn't implement playing any other values than "square" ones, but you can force them by changing tempo.
For example, that's how to programm a triplet:

```
tempo(3/4) (times 3 (e 4 en))
```