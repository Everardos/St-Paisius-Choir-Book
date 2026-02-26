\version "2.24.4"

\header {
    title = "augmented litany"
    subtitle = " "
    composer = "N. Kedrov Jr."
    tagline = " "

}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "" 
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

keyTime = { \key f \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    a'2 a a1 a \cadenzaMeasure
    a2( f g) a bes4( a g2) a1 \cadenzaMeasure
    a4 \hideNotes a a a a a \unHideNotes a a2( f g) a bes4( a g2) a1 \section
    a2 a1 \fine

}

AltoMusic = \relative { 
    \cadenzaOn
    f'2 f f1 f \cadenzaMeasure
    f1. f2 f1 f \cadenzaMeasure
    f4 \hideNotes f f f f f \unHideNotes f f1. f2 f1 f \section
    f2 f1 \fine
}

TenorMusic = \relative { 
    \cadenzaOn
    c'2 c c1 c \cadenzaMeasure
    c2( a bes) c2 d4( c bes2) c1 \cadenzaMeasure
    c4 \hideNotes c c c c c \unHideNotes c c2( a bes) c2 d4( c bes2) c1 \section
    c2 c1 \fine
}


BassMusic   = \relative {
    \cadenzaOn
    f2 f f1 f \cadenzaMeasure
    f1. f2 f1 f \cadenzaMeasure
    f4 \hideNotes f f f f f \unHideNotes f f1. f2 f1 f \section
    f2 f1 \fine
}



VerseOne = \lyricmode {
    Lord, have mer -- cy.
    Lord, __ have mer -- cy.
    Lord, have mercy. Lord, have mer -- cy. Lord, __ have mer -- cy.
    A -- men.
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
            \Staff
                \remove Time_signature_engraver
        }
        \context {
            \Lyrics
                \override LyricSpace.minimum-distance = #1.0
        }
    }
    \midi {
        \tempo 4 = 60
    }
}





