\version "2.24.4"




keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    b'4( a b c d2 c b a) g1 \cadenzaMeasure \section

    \textMark "1" g4( fis) g( a) b2( a) g1 \cadenzaMeasure
    \textMark "2" b4( a) b( c) b2( a) g1 \cadenzaMeasure
    \textMark "3" g4( fis e) fis g( a) g1 \cadenzaMeasure
    \textMark "4" g4( fis g a b2) a4( g) a( b2 a4) g1 \cadenzaMeasure
    \textMark "5" b4( a b c d2) c4( b) a2( b4 c) b1 \cadenzaMeasure \section

    g4( fis g a) b2 a g1 \cadenzaMeasure \section

    b2 b1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    g'1.( g1 d2) g1 \cadenzaMeasure \section

    g4( d) g2 g2( d) g1 \cadenzaMeasure
    g2 g g( d) g1 \cadenzaMeasure
    e2. d4 g2 g1 \cadenzaMeasure
    g4( fis g1) e2 d1 g \cadenzaMeasure
    g1. a2 a1 g1 \cadenzaMeasure

    e4( d g2) g fis g1 \cadenzaMeasure

    g2 g1 \cadenzaMeasure \fine
}



VerseOne = \lyricmode {
    A -- men.
    Lord, __ have mer -- cy.
    Lord, __ have mer -- cy.
    Lord, __ have mer -- cy.
    Lord, __ have __ mer -- cy.
    Lord, __ have __ mer -- cy.
    To Thee, O Lord.
    A -- men. __
    }


\score {
    \header {
        piece = \markup {\large \italic "1. St. Tikhon's Melody"}
    }
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
        \tempo 4 = 120
    }
}





