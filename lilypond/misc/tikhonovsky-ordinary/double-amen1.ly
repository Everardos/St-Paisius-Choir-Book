\version "2.24.4"

% This is an option vs. double-amen2.ly


keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    g'2 g1 \cadenzaMeasure
    g4( fis g a b2 c4 b a c) b1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    g'2 g1 \cadenzaMeasure
    g4( d g1 a) g \cadenzaMeasure \fine
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





