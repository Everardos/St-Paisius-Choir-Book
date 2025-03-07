\version "2.24.4"




keyTime = { \key f \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    a'2 a1 \cadenzaMeasure \section

    \textMark "1" a2( g4) f g( a) f1 \cadenzaMeasure
    \textMark "2" a2( g4) a bes( c) a1 \cadenzaMeasure
    \textMark "3" c4( a bes) c d2 c1 \cadenzaMeasure
    \textMark "4" d4( c bes) a bes( c) a1 \cadenzaMeasure
    \textMark "5" c2( g4) a bes( g) f1 \cadenzaMeasure \section

    c'4 g( a bes) g f1 \cadenzaMeasure \section
    a2 a1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    f'2 f1 \cadenzaMeasure \section

    f2. f4 f2 f1 \cadenzaMeasure
    f2. f4 f2 f1 \cadenzaMeasure
    f2. f4 f2 f1 \cadenzaMeasure
    f2. f4 f2 f1 \cadenzaMeasure
    f2( g4) g g2 f1 \cadenzaMeasure
    
    f4 g2. g4 f1 \cadenzaMeasure

    f2 f1 \cadenzaMeasure \fine
}



VerseOne = \lyricmode {
    A -- men.
    Lord, __ have mer -- cy.
    Lord, __ have mer -- cy.
    Lord, __ have mer -- cy.
    Lord, __ have mer -- cy.
    Lord, __ have mer -- cy.
    To Thee, __ O Lord.
    A -- men.
    }


\score {
    \header {
        piece = \markup {\large \italic "3. Romanian"}
    }
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





