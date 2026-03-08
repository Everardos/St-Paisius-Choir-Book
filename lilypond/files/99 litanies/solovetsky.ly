\version "2.24.4"




keyTime = { \key f \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    d'4.( e8) e16([ d] e8) f8([ e] f[ c]) d1 \cadenzaMeasure
    f4.( e8) e16([ d] e8) f8([ g] f[ e]) d1 \cadenzaMeasure
    d4.( e8) e16([ d] e8) f8([ e d c]) d1 \cadenzaMeasure
    d4.( e8) e16([ d]) e8 f8([ e d c] d1) \cadenzaMeasure
    f2( e4) d1 \cadenzaMeasure
}

BassMusic   = \relative {
    \cadenzaOn
}



VerseOne = \lyricmode {
    Lord, __ have __ mer -- cy.
    Lord, __ have __ mer -- cy.
    Lord, __ have __ mer -- cy.
    To __ Thee, O __ Lord. __
    A -- men.
    }


\score {
    \new Staff 
    %\with {midiInstrument = "choir aahs"} 
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





