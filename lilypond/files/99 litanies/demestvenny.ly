\version "2.24.4"




keyTime = { \key c \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    c'4 c c2 c1 \cadenzaMeasure
    d2( f2. e8[ d] a'2. g4) f2 g g1 \cadenzaMeasure
    g2( a4. g8 f2.) e8([ f]) g2 g1 \cadenzaMeasure
    g4 g2 g4 g( a8[ g] f4 g a2 g a4. g8 f2 g1) \cadenzaMeasure
    g1 g \cadenzaMeasure
}

BassMusic   = \relative {
    \cadenzaOn
    c'4 c c2 c1 \cadenzaMeasure
    d2( f2. e8[ d]~ d1) d2 c c1 \cadenzaMeasure
    c1( d2.) d4 c2 c1 \cadenzaMeasure
    g'4 f( e) d d1.( c~ c1) \cadenzaMeasure
    c4( d f2) g1 \cadenzaMeasure


}



VerseOne = \lyricmode {
    Lord, have mer -- cy.
    Lord, __ have mer -- cy.
    Lord, __ have mer -- cy.
    To __ Thee, O __ Lord. __
    A -- men.
    }


\score {
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





