\version "2.24.4"

\header {
    title = "cherubic hymn"
    subtitle = "At the Great Entrance"
    composer = "A Kastorsky"
    tagline = " "

}

keyTime = { \key  g \major}

bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#2M" 
}

titleFont = \markup {\fill-line {
                \fontsize #8 \caps
                \override #'(font-name . "EB Garamond")
                \fromproperty #'header:title
                }}
subTitleFont = \markup {\fill-line {
                \fontsize #2 \override #'(font-name . "EB Garamond Italic")
                \fromproperty #'header:subtitle
                }}

\paper {
    #(set-paper-size "letter")
    page-breaking = #ly:optimal-breaking
    ragged-last-bottom = ##t
    right-margin = 17\mm
    left-margin = 17\mm
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
    bookTitleMarkup = \markup \null
    oddHeaderMarkup = \markup {
        \override #'(baseline-skip . 3.5) \fill-line {
            \if \on-first-page  %version 2.23.4
            % \raise #8 \fromproperty #'header:dedication % to ajust and uncomment for dedication
            \if \on-first-page %version 2.23.4
            \raise #3 % to ajust
            \column {
                \titleFont
                \subTitleFont
                \fill-line {
                \smaller \bold
                \fromproperty #'header:subsubtitle
                }
                \fill-line {
                \large \override #'(font-name . "EB Garamond")
                \fromproperty #'header:poet
                { \large \bold \fromproperty #'header:instrument }
                \override #'(font-name . "EB Garamond Medium") \fromproperty #'header:composer
                }
                \fill-line {
                \fromproperty #'header:meter
                \fromproperty #'header:arranger
                }
            }
            \if \on-first-page
                \right-align \bindernumber

        }
        \raise #5
        \if \should-print-page-number %version 2.23.4
        % \if \should-print-page-number  %version 2.23.3
        \fromproperty #'page:page-number-string
    }
    evenHeaderMarkup = \oddHeaderMarkup

}

cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}


SopMusic    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 4/4 

    g'2 g8( a) b4 |
    a4.( g8\noBeam fis g) a4 |
    g2 g4.( a8 |
    b4 c b8 a) b4 |

    a2 a8[( g] a[ b] |
    c4. b8\noBeam a b) c4 |
    b2( a4) g |
    fis4.( g8 a4) g8([ fis]) |

    e4( fis g) g |
    fis2. fis4 |
    e1 \section
}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 4/4 

    e'2 e4 e |
    e2. e4 |
    e2 e( |
    d8[ g] e[ fis] g4) g |

    fis2 fis8([ e] fis[ g] | 
    e2 a4) a |
    a( g fis) e |
    dis4.( e8 fis4) e8( dis) |

    e2. e4 |
    e2( dis4) dis |
    e1 \section

}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 4/4 

    b2 b4 b |
    c2. c4 |
    b2 b4.( c8 |
    d4 c d) d |

    d2 d( |
    c e4) e |
    e2( b4) b |
    b2. b8( a) |

    g4( a b) b |
    c2( b4) a |
    g1 \section
    
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 4/4 

    e2 e8( fis) g4 |
    a2. a4 |
    e2 e4( d8 c |
    b4 a g) b |

    d2 d4( c8 b) |
    a2 c4 c |
    e2( dis4) e4 |
    b2. b4 |

    c2( g4) g |
    a2( b4) b |
    e1 \section
    
}

VerseOne = \lyricmode {
    Let us __ who mys -- ti -- c'ly,
    mys -- ti -- c'ly
    re -- pre -- sent __ the Che -- ru -- bim, __
    the Che -- ru -- bim.
    And who sing __ the thrice ho -- ly hymn,
    and who sing the thrice __ ho -- ly hymn,
    to __ the __ life -- cre -- a -- ting,
    life -- cre -- a -- ting Trin -- i -- ty.
    Now lay __ a -- side __ all cares,
    now __ lay __ a -- side all cares,
    lay __ a -- side __ 
    all __ earth -- ly __ cares,
    all earth -- ly cares
    A -- men.
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
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)


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

