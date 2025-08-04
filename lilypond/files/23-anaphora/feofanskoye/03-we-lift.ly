\version "2.24.4"




keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4
    b'4\rest b4 a b | c b8( c) d4 c | b1 \section
}

AltoMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4
    s4 g'4 fis g | a g8( a) b4 a | g1 \section
}

TenorMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4  
    d4\rest d' d d | d d d d | d1 \section

}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4  
    s4 g d d | d d d d | g1 \section

}

VerseOne = \lyricmode {
    We lift them up un -- to the Lord.
    }


\score {
    \new ChoirStaff <<
        \new Staff \with {instrumentName = \markup {
            \right-column {
                \line { "S" }
                \line { "A" }
            }
        }}
        \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
        >>
        \new Staff \with {instrumentName = \markup {
            \right-column {
                \line { "T" }
                \line { "B" }
            }
        }}
        \with {midiInstrument = "choir aahs"} <<          
            \clef "bass"
            \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusic}
            \new Voice = "Bass" { \voiceTwo \BassMusic} 
        >>
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





