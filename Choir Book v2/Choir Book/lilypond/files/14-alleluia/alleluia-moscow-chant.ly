\version "2.24.4"

\header {
    title = "alleluia"
    subtitle = "Before the Gospel"
    composer = "Moscow Chant"
    tagline = " "
}

keyTime = { \key g \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1K" 
     }

\include "C:/Users/Zhao/Choir Book/lilypond/ly/choirbook-variables.ly"
\include "C:/Users/Zhao/Choir Book/lilypond/ly/choirbook-paper.ly"


SopMusic    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 2/2
    g'1 | g4( a b2) | a2.( g4 | fis g a2) | g1 |
    g2.( a4 | b2) c | b1 | a |
    b2 b | c2.( b4 | c2 b4 a | g a b2) | a1 | \section

    b2 b4( c) | b2( a) g2.( a4 | b2 c4 b | a1) |
    a4( b) c2 | b b | 
    a g | a( g4 fis) | g1 | \fine
}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 2/2
    d'1 | d2( g) | d1~ | d | d |
    d1( | g2) g | g1 | fis |
    g2 g | g1~ | g ~ | g | fis | \section

    g2 g | g( fis) | d1( | g | e) |
    e4( g) g2 | g g |
    fis2 g | fis( d) | d1 | \fine
}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 2/2
    b1 | b4( c d2) | c2.( b4 | a b c2) | b1 |
    b2.( c4 | d2) e | d1 | d |
    d2 d | e2.( d4 | e2 d4 c | b c d2) | d1 | \section

    d2 d4( e) | d2( c) | b2.( c4 | d2 e4 d | c1) |
    c4( d) e2 | d d |
    c2 b | c( b4 a4) | b1 | \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 2/2
    g1 | g | d~ | d | g |
    g( | g2) c, | g'1 | d1 |
    g2 g | c,2.( g'4 | c,2 g' | g1) d | \section

    g2 g | g( d) | g1( | g2 c,4 g' | a1) |
    a4 g c,2 | g' g |
    d2 g | d1 | g | \fine
}

VerseOne = \lyricmode {
    Al -- le -- lu -- ia,
    Al -- le -- lu -- ia,
    Al -- le -- lu -- ia.
    Al -- le -- lu -- ia,
    Al -- le -- lu -- ia,
    Al -- le -- lu -- ia.
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
        ragged-last = ##t
        \context {
            \Staff
                \remove Time_signature_engraver
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)
        }
        \context {
            \Score
                \omit BarNumber
        }
        \context {
            \Lyrics
                \override LyricSpace.minimum-distance = #2.0
                \override LyricText.font-size = #1.5
        }
    }
    \midi {
        \tempo 4 = 180
    }
}
