\version "2.24.4"

keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    \set breathMarkType = #'outsidecomma
    g'4 a b b a( b c) d b2 \cadenzaMeasure
    c4( b a) c b2 \cadenzaMeasure
    a4 b c2 c4 b a g a2 a \breathe \cadenzaMeasure
    b4( a) g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    \set breathMarkType = #'spacer
    g'4 g g g a2. g4 g2 \cadenzaMeasure
    a2. a4 g2 \cadenzaMeasure
    a4 a a2 a4 a a g a2 a \breathe \cadenzaMeasure
    g4( d) g1 \cadenzaMeasure \fine
    
}



VerseOne = \lyricmode {
    One is Ho -- ly, One __ is Lord:
    Je -- sus Christ,
    to the glo -- ry of God the Fa -- ther.
    A -- men.
    }


\score {
    \new Staff \with {midiInstrument = "choir aahs"} <<
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





