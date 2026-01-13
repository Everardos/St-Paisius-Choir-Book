\version "2.24.4"

% Znamenny harmonized, per Benedict Sheehan


keyTime = { \key f \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    f'2 f1 \cadenzaMeasure
    e4( f g2.) g4 g1 f \cadenzaMeasure
    f2( g2.) g4 g1 f \cadenzaMeasure
    d2( f g2.) g4 g1 f \cadenzaMeasure
    e4( f) g1 g4( e) f( g2. f1) \cadenzaMeasure
    f2( e) f1 \cadenzaMeasure
}

BassMusic   = \relative {
    \cadenzaOn
    d'2 d1 \cadenzaMeasure
    d1~ d4 d4 d1 d \cadenzaMeasure
    d1~ d4 d4 d1 d \cadenzaMeasure
    d1~ d2. d4 d1 d \cadenzaMeasure
    d2 d1 d2 d1~ d \cadenzaMeasure
    d1 d \cadenzaMeasure
}



VerseOne = \lyricmode {
    A -- men.
    Lord, __ have mer -- cy.
    Lord, __ have mer -- cy.
    Lord, __ have mer -- cy.
    To __ Thee, O __ Lord. __
    A -- men.
    }


\score {
    \new Staff 
    \with {midiInstrument = "choir aahs"} <<
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





