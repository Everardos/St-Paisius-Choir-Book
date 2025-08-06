\version "2.24.4"

\header {
    title = "anaphora"
    subtitle = "A Mercy of Peace"
    composer = "Feofanovskoye"
    tagline = " "
}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1O" 
     }


subTitleFont = \markup {\fill-line {
                \fontsize #3 \override #'(font-name . "EB Garamond Italic")
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

#(define-markup-command (ebregular layout props text)
   (markup?)
   (interpret-markup layout props
     (markup #:override '(font-name . "EB Garamond") text )))

\markup \vspace #1
\markup \wordwrap {\larger {  Deacon: \ebregular{Let us stand well, let us stand with fear, let us attend, that we may offer the holy oblation in peace.}}}
\markup \vspace #0.5


\include "01-mercy-of-peace.ly"

\markup \wordwrap {\larger {  Priest: \ebregular{The grace of our Lord Jesus Christ, and the love of God the Father, and the communion of the Holy Spirit be with you all.}}}
\markup \vspace #0.5

\include "02-and-with.ly"

\markup \wordwrap {\larger {  Priest: \ebregular{Let us lift up our hearts.}}}
\markup \vspace #0.5

\include "03-we-lift.ly"

\pageBreak
\markup \vspace #0.5
\markup \wordwrap {\larger {  Priest: \ebregular{Let us give thanks unto the Lord.}}}
\markup \vspace #0.5

\include "04-it-is-meet.ly"


\pageBreak
\markup \vspace #0.5
\markup \wordwrap {\larger {  Priest: \ebregular{Singing the triumphal hymn, shouting, crying aloud and saying:}}}
\markup \vspace #0.5

\include "05-sanctus.ly"

\pageBreak

\markup \vspace #0.5
\markup \wordwrap {\larger {  Priest: \ebregular{Take, eat: this is My Body, which is broken for you for the remission of sins.}}}
\markup \vspace #0.5

\include "06-amen1.ly"

\markup \wordwrap {\larger {  Priest: \ebregular{Drink of it, all of you: this is My Blood of the New Testament, which is shed for you and for many, for the remission of sins.}}}
\markup \vspace #0.5

\include "07-amen2.ly"

\markup \wordwrap {\larger {  Priest: \ebregular{Offering unto Thee Thine own of Thine own, in behalf of all and for all.}}}
\markup \vspace #0.5

\include "08-we-praise-thee.ly"

\markup \wordwrap {\larger {  Priest: \ebregular{Especially for our most holy, most pure, most blessed, glorious Lady Theotokos and Ever-Virgin Mary.}}}