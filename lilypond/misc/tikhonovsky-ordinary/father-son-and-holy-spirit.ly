\version "2.24.4"




keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    g'4( fis) g( a) b2 b c4( b) a( c) b2 b1 \cadenzaMeasure
    b4( c) d2 c b1 \cadenzaMeasure
    a4 b c2( b) a1 \cadenzaMeasure
    g4 a b a2( c4 b a1) g4 g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    g'4( fis) g2 g g a a g g1 \cadenzaMeasure
    g2 g g g1 \cadenzaMeasure
    a4 a a1 a \cadenzaMeasure
    g4 g g a1~ a g4 g1 \cadenzaMeasure
}



VerseOne = \lyricmode {
    Fa -- ther, __ Son, and Ho -- ly __ Spi -- rit:
    the __ Trin -- i -- ty,
    one in es -- sence,
    and in -- di -- vi -- si -- ble.
    }


\score {
    \new Staff \with {midiInstrument = "choir aahs"} 
    <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass" { \voiceTwo \BassMusic }
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
        \tempo 4 = 180
    }
}





