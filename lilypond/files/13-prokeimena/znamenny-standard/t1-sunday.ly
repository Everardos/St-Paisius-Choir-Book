\version "2.24.4"




keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    g'4 \hideNotes g g g g \unHideNotes g a b b \cadenzaMeasure \bar "!"
    b4 a( g a2) g4 b b a \break 
    a8([ g] fis4 g fis e2) e d1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    e'4 \hideNotes e e e e \unHideNotes e d g g \cadenzaMeasure \bar "!"
    g4 d1 e4 e e d
    a'4( d, g d e2) a, d1 \cadenzaMeasure \fine
}



VerseOne = \lyricmode {
    Let Thy mercy, O Lord, be up -- on us,
    ac -- cor -- ding as we have 
    hoped __ in Thee.
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
        ragged-last = ##t
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





