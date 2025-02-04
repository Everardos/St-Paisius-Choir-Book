\version "2.24.4"




keyTime = { \key f \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    a'4( d c bes a g bes4. a8) a4.( g8 f2 e4 d1) \cadenzaMeasure \section
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    f'4( bes f1.) f1( a,4 d1) \cadenzaMeasure \section
}

VerseOne = \lyricmode {
    A -- men.
    }


\score {
    \new Staff \with {midiInstrument = "choir aahs"} <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass"  { \voiceTwo \keyTime \BassMusic}

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
        \tempo 4 = 120
    }
}





