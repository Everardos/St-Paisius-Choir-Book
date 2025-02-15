\version "2.24.4"




keyTime = { \key f \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    f'8([ e]) f g a2 bes8([ a]) g4( a8[ bes]) c2( bes4) a2 g4 f1 \cadenzaMeasure \section
}

BassMusic   = \relative {
    \cadenzaOn
    f'8([ e]) f f f2 g4 g2 f2. f2 g4 f1 \cadenzaMeasure \section
}



VerseOne = \lyricmode {
    Glo -- ry to Thee, O __ Lord, __ glo -- ry to Thee.
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





