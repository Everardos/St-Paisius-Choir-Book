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
    e'4 g( f e g) f( e) f( g) a2. \cadenzaMeasure
    a2 bes4.( a8) g4 g a g f g f2 \cadenzaMeasure
    f4 f g( f8[ e]) f4( g) a8( bes4 a8) a2 \cadenzaMeasure
    a4 d d c( bes) a g f8([ bes] a4. g8) f2 \cadenzaMeasure
    f4 e g f2( e d8[ cis] e4) d1 \cadenzaMeasure \section

}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    a4 a1 d2 d d2. \cadenzaMeasure
    d2 d d4 d d d d d d2 \cadenzaMeasure
    d4 d d2 d f f \cadenzaMeasure
    f4 bes bes f2 f4 f f2. f2 \cadenzaMeasure
    a,4 a a a1. d1 \cadenzaMeasure
}

VerseOne = \lyricmode {
    It is __ meet and __ right
    to wor -- ship the Fa -- ther, and the Son,
    and the Ho -- ly __ Spi -- rit:
    the Tri -- ni -- ty, __ one in es -- sence,
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





