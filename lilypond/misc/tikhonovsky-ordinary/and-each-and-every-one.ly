\version "2.24.4"




keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    g'4( fis g a) b1
    % b4( c b a) g( fis g a b2) a g1 \cadenzaMeasure
    b4( c) b( a g fis g a b2) a g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    g'4( fis g2) g1
    % g1 g4( fis g1) d2 g1 \cadenzaMeasure
    g2 g2.( fis4 g1) d2 g1 \cadenzaMeasure \fine
}



VerseOne = \lyricmode {
    And __ each 
    and __ ev -- ery one.
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





