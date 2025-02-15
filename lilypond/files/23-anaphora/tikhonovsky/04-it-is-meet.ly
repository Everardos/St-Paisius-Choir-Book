\version "2.24.4"




keyTime = { \key f \major}
cadenzaMeasure = {
    \cadenzaOff
    \partial 1024 s1024
    \cadenzaOn
}

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    f'4( g) a g( a g) f f2 \cadenzaMeasure
    g4( a) bes( c bes a) g1 \allowBreak
    a4( bes) c2( bes4) a2 \allowBreak

    g4 a bes2( a g) \cadenzaMeasure
    bes4 c d8([ c]) bes4 c( bes) a2 \allowBreak
    a4 bes2 a4 g2 \cadenzaMeasure
    
    a4 bes c2( bes4) a2 \allowBreak
    f4 g a g2( bes4 a g2 f4) f1 \cadenzaMeasure \section


}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    
    f'2 f4 g2. f4 f2 \cadenzaMeasure
    g2 g1 g1
    f2 f2. f2

    g4 g g1. \cadenzaMeasure
    g4 g g g f2 f 
    f4 g2 a4 g2 \cadenzaMeasure

    f4 f f2. f2
    f4 f f g1.( f4) f1 \cadenzaMeasure
}

VerseOne = \lyricmode {
    It __ is meet __ and right
    to __ wor -- ship 
    the __ Fa -- ther, 

    and the Son, __
    and the Ho -- ly Spi -- rit:
    the Tri -- ni -- ty, 

    one in es -- sence,
    and un -- di -- vi -- ded.
    }


\score {
    \new Staff \with {midiInstrument = "choir aahs"} <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass"  { \voiceTwo \keyTime \BassMusic}

        \new Lyrics \lyricsto "Sop" { \VerseOne }
    >>
    \layout {
    \context {
        \Score
            \omit BarNumber
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)

    }
    \context {
        \Staff
            \remove Time_signature_engraver
    }
    \context {
        \Lyrics
            \override LyricSpace.minimum-distance = #1.0
    }
    }
    \midi {
        \tempo 4 = 120
    }
}





