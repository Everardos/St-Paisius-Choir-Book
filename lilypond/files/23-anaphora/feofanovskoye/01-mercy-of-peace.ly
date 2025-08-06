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
    \partial 2 
    g'4( a) | b( d) c b | 
    a2. a4 | b8( a g fis g4) b |
    c8( b a g fis4) fis | g1 \section
}

AltoMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4
    \partial 2 
    e'4( fis) | g( b) a g |
    fis2. fis4 | g8( fis e dis e4) g |
    a8( g fis e dis4) dis | e1 \section
}

TenorMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4  
    \partial 2 
    b4( d) | d2 d4 d |
    d2. d4 | d( b2) b4 |
    a8( b c b~ b4) b | b1 \section

}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4  
    \partial 2 
    e4( d) | g2 fis4 g |
    d2. d4 | d( e8 b e4) e |
    e( dis8 e b4) b | e1 \section
}

VerseOne = \lyricmode {
    A __ mer -- cy of peace,
    a sac -- ri -- fice __ of praise.
    }

VarDynamics = {
    \partial 2
    s4\p s 
    s\< s\! s s
    s\> s s s\!
    s1
    s1
    s1
}


\score {
    \new ChoirStaff <<
        \new Dynamics {
            \VarDynamics
        }
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
            \override DynamicText.direction = #UP
            \override DynamicLineSpanner.direction = #UP
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





