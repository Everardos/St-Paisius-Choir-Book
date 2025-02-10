\version "2.24.4"

\header {
    title = "megalynarion"
    subtitle = "Sept. 8: Nativity of the Theotokos"
    composer = " "
    tagline = " "
}

keyTime = { \key g \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1P" 
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
    \cadenzaOn
    a'2 a4 g( b) b a g2 \cadenzaMeasure
    c4 \hideNotes c c \unHideNotes c b2 a4 g a2 a4 a g1 \cadenzaMeasure
    fis4( g) a \hideNotes a a a a \unHideNotes a g a b a g2. \cadenzaMeasure
    b4 c \hideNotes c c c c \unHideNotes c b c( b) a2 \cadenzaMeasure
    fis4 g a a a a g a b b b a g2 \cadenzaMeasure
    a4 b c \hideNotes c \unHideNotes c b c c c b a2 \cadenzaMeasure
    c4 c b2 b4 a g a1 g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    d'2 d4 g2 g4 g g2 \cadenzaMeasure
    c,4 \hideNotes c c \unHideNotes c g'2 fis4 g d2 d4 d g1 \cadenzaMeasure
    d2 d4 \hideNotes d d d d \unHideNotes d d d g g g2. \cadenzaMeasure
    g4 c, \hideNotes c c c c \unHideNotes c g' c,( g') a2 \cadenzaMeasure
    d,4 d d d d d d d g g g g g2 \cadenzaMeasure %both are to be found
    g4 g c, \hideNotes c \unHideNotes c g' c, c c g' a2 \cadenzaMeasure
    c,4 c g'2 g4 fis g d1 g \cadenzaMeasure \fine
    
}

VerseOne = \lyricmode {
    Mag -- ni fy, __ O my soul, 
    the most glori -- ous birth of the Moth -- er of God.
    Vir -- gin -- i -- ty is a -- li -- en to moth -- er -- hood,
    and child -- bearing is a thing strange to vir -- gins:
    yet in thee, O The -- o -- to -- kos, both are to be found.
    There -- fore we and all the na -- tions of the earth
    with -- out ceas -- ing call thee bless -- ed.
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
        \context {
            \Staff
                \remove Time_signature_engraver
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





