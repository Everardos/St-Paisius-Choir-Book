\version "2.24.4"

keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    \repeat volta 3 {
    g'4 g g a b b b b \allowBreak
    b4 b a8([ b]) c4 b2( a4 g a2) b4( a) g1 
    \textEndMark "repeat 3x"
    \cadenzaMeasure 
    }
}

BassMusic   = \relative {
    \cadenzaOn
    \repeat volta 3 {
    g'4 g g d g g g g \allowBreak
    g4 g a a g2( d1) e4( fis) g1 \cadenzaMeasure
    }
    
}



VerseOne = \lyricmode {
    Bless -- ed be the Name of the Lord
    hence -- forth and __ for -- ev -- er __ more.
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





