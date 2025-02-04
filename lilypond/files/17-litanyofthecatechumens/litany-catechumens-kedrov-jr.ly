\version "2.24.4"

\header {
    title = "litany of the catechumens"
    subtitle = " "
    composer = "N. Kedrov Jr."
    tagline = " "

}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1L" 
}


titleFont = \markup {\fill-line {
                \fontsize #6 \caps
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
    \time 10/4
    f'4 f f1 f |
    f4 f f1 f |
    f4 f4 g1 a1 |
    a4 a bes1 c |
    c4 c bes1 a |
    a4 a g1 a |
    \cadenzaOn
    a2 g1 f f \cadenzaMeasure
    a2 a1 \fine
}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 10/4
    c'4 c c1 c1 |
    c4 c d1 c |
    c4 c d1 f |
    f4 f f1 a |
    f4 f f1 f |
    f4 f d1 f |
    \cadenzaOn
    f2 d1 bes c \cadenzaMeasure
    f2 f1 \fine
}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 10/4
    a4 a a1 a|
    a4 a bes1 a |
    a4 a bes1 c |
    c4 c d1 f |
    ees4 ees d1 c |
    c4 c bes1 c |
    \cadenzaOn
    c2 bes1 g a \cadenzaMeasure
    c2 c1 \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 10/4
    f4 f f1 f |
    f4 f f1 f |
    f4 f f1 f |
    f4 f f1 f |
    f4 f f1 f |
    f4 f f1 f |
    \cadenzaOn
    f2 f1 f f \cadenzaMeasure
    f2 f1 \fine
}

VerseOne = \lyricmode {
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    To Thee, O Lord.
    A -- men.
    }


\score {
    \new StaffGroup <<
        \new Staff \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
        >>
        \new Staff \with {midiInstrument = "choir aahs"} <<
            \clef "bass"
            \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusic}
            \new Voice = "Bass" { \voiceTwo \BassMusic} 
        >>
    >>
      \layout {
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





