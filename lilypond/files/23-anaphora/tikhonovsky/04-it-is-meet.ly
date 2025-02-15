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
    

}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    
}

VerseOne = \lyricmode {
    It is __ meet and __ right
    to wor -- ship the Fa -- ther, and the Son,
    and the Ho -- ly __ Spi -- rit:
    the Tri -- ni -- ty, __ one in es -- sence,
    and un -- di -- vi -- ded.
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





