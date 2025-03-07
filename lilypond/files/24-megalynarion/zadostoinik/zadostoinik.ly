\version "2.24.4"

\header {
    title = "instead of it is truly meet"
    subtitle = "Megalynaria for Feasts"
    composer = " "
    tagline = " "
}

bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#3p" 
     }


subTitleFont = \markup {\fill-line {
                \fontsize #1 \override #'(font-name . "EB Garamond Italic")
                \fromproperty #'header:subtitle
                }}

titleFont = \markup {\fill-line {
                \fontsize #8 \caps
                \override #'(font-name . "EB Garamond")
                \fromproperty #'header:title
                }}

\paper {
    #(set-paper-size "letter")
    page-breaking = #ly:optimal-breaking
    ragged-bottom = ##t
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

\include "nativity-of-the-theotokos.ly" \pageBreak
\include "exaltation-of-the-cross.ly" \pageBreak
\include "entry-of-the-theotokos.ly" \pageBreak
\include "nativity-of-the-lord.ly" \pageBreak
\include "theophany.ly" \pageBreak
\include "meeting-of-the-lord.ly" \pageBreak
\include "annunciation.ly" \markup \vspace #5
\include "lazarus-saturday.ly" \pageBreak
\include "palm-sunday.ly" \markup \vspace #5
\include "holy-thursday.ly" \pageBreak
\include "holy-saturday.ly" \markup \vspace #5
\include "mid-pentecost.ly" \pageBreak
\include "ascension.ly" \markup \vspace #5
\include "pentecost.ly" \pageBreak
\include "transfiguration.ly" \markup \vspace #5
\include "dormition.ly"