\version "2.24.4"

keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    g'4 g a b b b b a b2 b4 b b1 \cadenzaMeasure
    g4 g a b b b b a8([ b]) c4 b2( a4 g a2) b4( a) g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    g'4 g d g g g g g g2 g4 g g1 \cadenzaMeasure
    e4 e d g g g g a a g2( d1) g4( d) g1 \cadenzaMeasure \fine
    
}



VerseOne = \lyricmode {
    Bless -- ed is He that comes in the Name of the Lord.
    God is the Lord and hath re -- vealed Him -- self __ to us.
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





