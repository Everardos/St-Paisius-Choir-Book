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
    b'4 b a a | 
    g( b a) g |
    fis2( g4) a |
    b( d c) b |
    a2\fermata

    a4 a |
    b8( a g fis g4) b |
    c8( b a g) fis4 fis |
    g4.( fis8) g4 \breathe

    a4 |
    b b a b |
    c( b8 c d4 c) |
    b2. b4\rest |

    b4 b8\noBeam b\noBeam a4 b |
    c4( b8 c) d4 c |
    b2 b8[( a]) c[( b]) |
    a2.

    a4 |
    b8[( a]) g[( fis]) g4 b |
    c8( b a g fis2) |
    g1\fermata \section
}

AltoMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4
    g'4 g fis fis |
    e( g fis) e |
    dis2( e4) fis |
    g4( b a) g |
    fis2

    fis4 fis |
    g8( fis e dis e4) g4 |
    a8( g fis e) dis4 dis | 
    e4.( dis8) e4 
    
    fis4 |
    g g fis g |
    a( g8 a b4 a) |
    g2. s4 |

    g4 g8\noBeam g\noBeam fis4 g |
    a4( g8 a) b4 a |
    g2 g8[( fis)] a[( g)] |
    fis2.

    fis4 |
    g8[( fis)] e[( dis)] e4 g |
    a8( g fis e dis2) |
    e1 \section


}

TenorMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4  
    d'4 d d d |
    b2. b4 | b2. d?4
    d2. d4 |
    d2 

    d4 d |
    d8( c b2) b4 |
    a8( b c b) b4 b |
    b2 b4 \breathe

    d?4 |
    d4 d d d |
    d1 |
    d2. c,4\rest |

    d'4 d8\noBeam d d4 d |
    d2 d4 d |
    d2 d4 d |
    d2.

    d4 |
    d8( c) b4 b b |
    a8( b c b~ b2) |
    b1 \section
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4  
    
}

VerseOne = \lyricmode {
    Ho -- ly, Ho -- ly, Ho -- ly
    Lord __ of Sa -- ba -- oth;
    heav'n and earth __ are 
    full __ of Thy glo -- ry.
    Ho -- san -- na in the high -- est.
    Bless -- ed is He that comes __
    in the Name of __ the __ Lord.
    Ho -- san -- na __ in the high -- est.
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
        \Lyrics
            \override LyricSpace.minimum-distance = #1.0
    }
    }
    \midi {
        \tempo 4 = 120
    }
}





