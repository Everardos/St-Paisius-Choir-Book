\version "2.24.4"




keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    b'4 \hideNotes b b b b b \unHideNotes b b( c b a g2) a4( b) c2( a) g1 \cadenzaMeasure
}

BassMusic   = \relative {
    \cadenzaOn
    g'4 \hideNotes g g g g g \unHideNotes g g1. a2 a1 g \cadenzaMeasure
}



VerseOne = \lyricmode {
    Lord, have mercy. Lord, have mer -- cy. Lord, __ have __ mer -- cy.
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





