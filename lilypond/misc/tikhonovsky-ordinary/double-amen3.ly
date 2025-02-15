\version "2.24.4"

% This is for after the Our Father


keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    g'4( fis g a) b2 \cadenzaMeasure
    b4( c b a g2 a) g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    e'2.( d4) g2 \cadenzaMeasure
    g2.( d4 e2 d) g,1 \cadenzaMeasure \fine
}



VerseOne = \lyricmode {
    A -- men. A -- men.
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





