\version "2.24.4"

\header {
    title = "before thy cross"
    subtitle = "Antitrisagion"
    composer = "Obikhod"
    tagline = " "
}

keyTime = { \key g \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#2i" 
     }


subTitleFont = \markup {\fill-line {
                \fontsize #2 \override #'(font-name . "EB Garamond Italic")
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
 %{
SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    e'4 e1 \cadenzaMeasure \bar ".|:"

    d4 e2( d4) d4 e2 fis4 g a( g a) fis g2 fis4  fis e2 fis \cadenzaMeasure
    g4 g fis2 e d4 e fis4.( g8 fis4 e) d2 d4 e2 d e1
    \cadenzaMeasure \bar ":|."
        \textEndMark \markup { \italic \small "thrice" }
    
    e4 e \break e \hideNotes e e e  e e e  e e e  e \unHideNotes e e2 d \cadenzaMeasure
    d4 \hideNotes d d d d d d d \unHideNotes d e2 e4 e e2( fis) \cadenzaMeasure \section
    g4 g fis2 e d4 e fis4.( g8 fis4 e) d2 d4 e2 d e1
    \cadenzaMeasure \fine
        \textEndMark \markup { \italic \small "Before Thy Cross..." }
}
%}

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    e'4 e1 \cadenzaMeasure \bar ".|:"

    fis4 g2( fis4) fis4 g2 a4 b c( b c) a b2 a4  a g2 a \cadenzaMeasure
    b4 b a2 g fis4 g a4.( b8 a4 g) fis2 fis4 g2 fis g1
    \cadenzaMeasure \bar ":|."
        \textEndMark \markup { \italic \small "thrice" }
    
    g4 g \break g \hideNotes g g g  g g g  g g g  g \unHideNotes g g2 fis \cadenzaMeasure
    fis4 \hideNotes fis fis fis  fis fis fis  fis \unHideNotes fis g2 g4 g g2( a) \cadenzaMeasure \section
    b4 b a2 g fis4 g a4.( b8 a4 g) fis2 fis4 g2 fis g1
    \cadenzaMeasure \fine
        \textEndMark \markup { \italic \small "Before Thy Cross..." }


}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    e'4 e1 \cadenzaMeasure

    b4 e2( b4) b e2 d4 d d2. d4 g2 d4 d e2 d \cadenzaMeasure
    g4 g d2 e b4 b b1 b2 b4 a2 b e1 \cadenzaMeasure

    e4 e \break e \hideNotes e e e  e e e  e e e  e \unHideNotes e e2 b \cadenzaMeasure
    b4 \hideNotes b b b  b b b  b \unHideNotes b e2 e4 e e2( d) \cadenzaMeasure

    g4 g d2 e b4 b b1 b2 b4 a2 b e1 \cadenzaMeasure \fine


    
}

VerseOne = \lyricmode {
    A -- men.
    Be -- fore __ Thy Cross we bow down __ in wor -- ship, O Mas -- ter,
    and Thy ho -- ly Res -- ur -- rec -- tion, we glo -- ri -- fy.
    Glo -- ry to the Father, and to the Son, and to the Ho -- ly Spir -- it,
    both now and ever, and unto the ages of ag -- es. A -- men. __ 
    And Thy ho -- ly Res -- ur -- rec -- tion, we glo -- ri -- fy.
    }



\score {
    \new Staff
    \with {midiInstrument = "choir aahs"} <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass" { \voiceTwo \BassMusic }
        \new Lyrics \lyricsto "Sop" { \VerseOne }
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
            \override SpacingSpanner.spacing-increment = 3
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





