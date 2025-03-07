\version "2.24.4"




keyTime = { \key f \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    f'2 f1 \cadenzaMeasure \section
    \textMark "1" f4 f e8([ f] g2) f1 \cadenzaMeasure
    \textMark "2" f2( g4) a g( a8[ bes] a4 g) f1 \cadenzaMeasure
    \textMark "3" a2 a4 bes2( a4 g) f1 \cadenzaMeasure \section
    a4 bes2( a4) g2 f1 \cadenzaMeasure \section
    a2 bes( a4 g1 f) \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    f'2 f1 \cadenzaMeasure
    f4 f c2. f1 \cadenzaMeasure
    f2. f4 c1 f \cadenzaMeasure
    f2 f4 bes,2( c) f1 \cadenzaMeasure
    f4 bes,2( f'4) c2 f1 \cadenzaMeasure
    f2 bes,2( f'4 c1 f) \cadenzaMeasure \fine

}



VerseOne = \lyricmode {
    A -- men.
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    To Thee, O Lord.
    A -- men. __
    }


\score {
    \header {
        piece = \markup {\large \italic "2. Kievan"}
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





