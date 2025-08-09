\version "2.24.4"



\header {
    title = "cherubic hymn"
    subtitle = "At the Great Entrance"
    composer = "D. Bortniansky, No. 5"
    tagline = " "

}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1M" 
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
    \time 3/2
    a'1. | g | f2( g a) | bes1 a2 | g1. |
    bes1 bes2 | a1 a2 | bes1 bes2 | a1. | 
    g1 g2 | f2( g) a | a4( g f2) e | f1. | \section

    a1 a2 | g1 g2 | f2( g a) | bes1 a2 | g1. |
    bes1 bes2 | a1 a2 | bes1. | a1. | 
    g1 g2 | f2( g) a | a4( g f2) e | f2. f4 f2 | \section

    a1. | g1 g2 | f2( g) a | bes1 a2 | g1. |
    bes1 bes2 | a1 a2 | bes1 bes2 | a1. | 
    g1 g2 | f2( g) a | a4( g f2) e | f1.\fermata | \section
}

AltoMusic   = \relative {
    \time 3/2
    f'1. | e | f2( e f) | g1 f2 | e1. |
    g1 g2 | f1 f2 | e1 e2 | f1. |
    e1 e2 | f( e) f | d( c) c | c1. | \section

    f1 f2 | e1 e2 | f2( e f) | g1 f2 | e1. |
    g1 g2 | f1 f2 | e1. | f1. |
    e1 e2 | f( e) f | d( c) c | c2. c4 c2 | \section

    f1. | e1 e2 | f2( e) f | g1 f2 | e1. |
    g1 g2 | f1 f2 | e1 e2 | f1. |
    e1 e2 | f( e) f | d( c) c | c1. | \section
}

TenorMusic  = \relative {
    \time 3/2
    c'1. | c | c | c1 c2 | c1. |
    c1 c2 | c1 c2 | c1 c2| c1. |
    c1 c2 | c1 c2 | c4( bes a2) g | a1. | \section

    c1 c2 | c1 c2 | c1. | c1 c2 | c1. |
    c1 c2 | c1 c2 | c1. | c1. |
    c1 c2 | c1 c2 | c4( bes a2) g | a2. a4 a2 | \section

    c1. | c1 c2 | c1 c2 | c1 c2 | c1. |
    c1 c2 | c1 c2 | c1 c2| c1. |
    c1 c2 | c1 c2 | c4( bes a2) g | a1. | \section
}

BassMusic   = \relative {
    \time 3/2
    f1. | c | a'2( g f) | e1 f2 | c1. |
    e1 e2 | f1 f2 | g1 g2 | f1. |
    c1 <bes bes'>2 | <a a'>( <g g'>) <f f'> | bes( c) c | f1. | \section

    f1 f2 | c1 c2 | a'2( g f) | e1 f2 | c1. |
    e1 e2 | f1 f2 | g1. | f1. |
    c1 <bes bes'>2 | <a a'>( <g g'>) <f f'> | bes( c) c | f2. f4 f2 | \section

    f1. | c1 c2 | a'2( g) f | e1 f2 | c1. |
    e1 e2 | f1 f2 | g1 g2 | f1. |
    c1 <bes bes'>2 | <a a'>( <g g'>) <f f'> | bes( c) c | f1. | \section
}

VerseOne = \lyricmode {
    Let us who mys -- tic -- 'ly
    re -- pre -- sent the Che -- ru -- bim,
    re -- pre -- sent the Che -- ru -- bim,
    And who sing the thrice ho -- ly hymn
    to the life -- cre -- a -- ting,
    to the life -- cre -- a -- ting Trin -- i -- ty,
    Now lay a -- side all earth -- ly cares,
    lay a -- side all earth -- ly cares,
    lay a -- side all earth -- ly cares.
}



\book {
    \score {
        \header {
            piece = \markup { \fontsize #1  \override #'(font-name . "EB Garamond SemiBold Italic") "Before the Great Entrance:" }
        }
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

}
