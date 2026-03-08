\version "2.24.4"




keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    d'4.( e8 fis4) g a2 g \cadenzaMeasure
    a4.( b8 c4) b a2 g \cadenzaMeasure \section
    d4( e) fis2 g4( a) g2 \cadenzaMeasure \section
    g2( a) g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    d'2~ d4 d4 d2 g \cadenzaMeasure
    c,2~ c4 c d2 g \cadenzaMeasure
    d2 d d g \cadenzaMeasure \section
    g2( d2) g1 \cadenzaMeasure 

    
}



VerseOne = \lyricmode {
    Lord, __ have mer -- cy.
    Lord, __ have mer -- cy.
    To __ Thee, O __ Lord.
    A -- men.
    }


\score {
    \header {
        piece = \markup {\large \italic "3. Carpatho-Russian"}
    }
    \new Staff 
    \with {midiInstrument = "choir aahs"}
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





