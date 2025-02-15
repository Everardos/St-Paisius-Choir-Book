\version "2.24.4"

keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    g'4 g g a b \hideNotes \repeat unfold 9 {b} \unHideNotes b b2 b2 \cadenzaMeasure
    g4 a b \hideNotes b b b b b \unHideNotes b a b2 b4 b b2 \cadenzaMeasure
    g4 a b \hideNotes b b b b \unHideNotes b a b2 b \cadenzaMeasure
    c2 a g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    g'4 g g d g \hideNotes \repeat unfold 9 {g} \unHideNotes g g2 g2 \cadenzaMeasure
    g4 d g \hideNotes g g g g g \unHideNotes g d g2 g4 g g2 \cadenzaMeasure
    g4 d g \hideNotes g g g g \unHideNotes g d g2 g \cadenzaMeasure
    c,2 d g1 \cadenzaMeasure \fine
    
}



VerseOne = \lyricmode {
    Glo -- ry to the Fa -- ther, and to the Son, and to the Ho -- ly Spir -- it,
    both now and ever and unto the a -- ges of a -- ges. A -- men.
    Lord, have mer -- cy. Lord, have mercy. Lord, have mer -- cy.
    Fa -- ther, bless!
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





