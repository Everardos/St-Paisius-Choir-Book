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

    b'2\rest fis2 | g4( b a g) | fis2
    g4( a) | b( d c b) | a2
    a4 a | b4.->( a8) g4 fis | g2( b) |
    c4.( b8 a4 g) | fis2

    \repeat volta 2 {
        fis4 fis | g4( b) a g | fis4 b4\rest b2\rest |
        b4 b a b | c( b8 c d4 c) | b2. b4\rest
        b2( c4) b4  | a2( b4 a4 | g1) |

        \alternative {
            \volta 1 { fis2 fis | g1}
            \volta 2 { fis2. fis4 | e1 \fine} 
        }
    }

}

AltoMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4

    s2 dis'2 | e4( g fis e) | dis2
    e4( fis) | g( b a g) | fis2
    fis4 fis | g4.( fis8) e4 dis | e2( g) |
    a4.( g8 fis4 e) | dis2

    \repeat volta 2 {
        dis4 dis | e( g) fis e | dis s4 s2 |
        g4 g fis g | a( g8 a b4 a) | g2. s4 |
        g2( a4) g | fis2( g4 fis | e1) | 

        \alternative {
            \volta 1 { e2 dis | e1 }
            \volta 2 { e2( dis4) dis | e1 } 
        }
    }

}

TenorMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4 

    d2\rest b'2 | b1 | b2
    b4( d?) | d1 | d2
    d4 d | d4.( c8) b4 b | b1 |
    a4.( b8 c4 b4) | b2

    \repeat volta 2 {
        b4 b | b2 b4 b | b a4\rest a2\rest |
        d4 d d d | d1 | d2. d,4\rest |
        d'2. d4 | d1 | b1 |
        \alternative {
            \volta 1 { c2 b2 | b1 }
            \volta 2 { c2( b4) a | g1 } 
        }
    }
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \time 4/4  

    s2 b,2 | e2( dis4 e) | b2
    e4( d!) | g2( fis4 g) | d2
    d4 d | g,4.( a8) b4 b | e1 |
    e2( dis4 e) | b2

    \repeat volta 2 {
        b4 b | e2 dis4 e | b4.( c8 b4 a) |
        g4 g' d d | d1 | g2. s4 |
        g2( fis4) g | d2( g4 d | e1) |   

        \alternative {
            \volta 1 { a,2 b | e1 }
            \volta 2 { a,2( b4) b | e1 \fine} 
        }
    }
}

VerseOne = \lyricmode {
    We praise __ Thee,
    we __ bless __ Thee,
    we give thanks un -- to Thee, __ O __ Lord, and we pray __ un -- to Thee,
    and we pray un -- to __ Thee,
    O __ our God, __
    O our God.
    O our God.
    }

VarDynamics = {
    \textMark \markup { \italic { \smaller Slowly}}
    s4 s\p s s
    s1 s s s
    s4 s s s
    s2\< s
    s4.\! s8\> s4 s
    s4\! s\pp s s
    s4\< s s\! s\>
    s8 s\! s4 s s
    s4\> s s s\!
    s\< s8\! s s4\> s
    s4\! s s s
     
}


\score {
    \new ChoirStaff <<
        \new Dynamics {
            \VarDynamics
        }
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





