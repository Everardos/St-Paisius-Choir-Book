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
    fis'4 fis | g( b a) g | 
    fis2 \breathe g4 a | b( d c) b |
    a2. a4 | b8( a g fis) g4 b |
    c8( b a g fis4) fis | g( b) a( g) |
    fis4 b4\rest b2\rest | b4 b a b |
    c4( b8 c d4 c) | b4 b4 a8( b a g | 
    b2) a | g2.( a4) | 
    b( d c) b | a2 a4 a | 
    b8( a g fis g4) b | c8( b a g fis2) | 
    g1\fermata \section
}

AltoMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4
    \partial 2
    dis'4 dis | e( g fis) e |
    dis2 e4 fis | g( b a) g |
    fis2. fis4 | g8( fis e dis) e4 g |
    a8( g fis e dis4) dis | e( g) fis( e) |
    dis4 s4 s2 | g4 g fis g |
    a4( g8 a b4 a) | g4 g fis8( g fis e |
    g2) fis | e2.( fis4) |
    g4( b a) g | fis2 fis4 fis | 
    g8( fis e dis e4) g | a8( g fis e dis2) |
    e1 \section
}

TenorMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4  
    \partial 2
    b4 b | b2. b4 |
    b2 \breathe b4 d? | d2. d4 | 
    d2. d4 | d8( c b4) b b | 
    a8( b c b~ b4) b | b2 b |
    b4 r4 r2 | d4 d d d |
    d1 | d4 d d4.( b8~ |
    b2) b | b2.( d4) |
    d2. d4 | d2 d4 d4 |
    d8( c b2) b4 | a8( b c b~ b2) |
    b1 \section
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4  
    \partial 2
    b,4 b | e2( dis4) e |
    b2 e4 d! | g2( fis4) g |
    d2. d4 | g,8( a b4) e e |
    e4( dis8 e b4) b | e2 dis4( e) |
    b4.( c8 b4 a) | g4 g' d d |
    d1 | g4 g d4.( e8 |
    b2) b | e2.( d4) |
    g2( fis4) g | d2 d4 d |
    g,8( a b4 e) e | e( dis8 e b2) |
    e1\fermata \section
}

VerseOne = \lyricmode {
    It is meet __ and right,
    it is meet __ and right 
    to wor -- ship the Fa -- ther 
    and __ the __ Son,
    and the Ho -- ly Spir -- it:
    the Trin -- i -- ty, __ 
    one __ in es -- sence
    and un -- di -- vid -- ed.
    }


\score {
    \new ChoirStaff <<
        \new Staff 
        \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
        >>
        \new Staff
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





