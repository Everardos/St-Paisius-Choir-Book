\version "2.24.4"

\header {
    title = "receive the body of christ"
    subtitle = "Communion Hymn"
    composer = "Znamenny Melody"
    tagline = " "
}

keyTime = { \key g \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#3R" 
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
    b'4 b2( a4 b g2 fis g) g2 \cadenzaMeasure
    a4( b a g fis2) g4 a b1 \cadenzaMeasure
    b2( c1 b4 a) g4( a) b( a) b2 \cadenzaMeasure
    a2 g fis4( g) a2.( g4 fis2) fis e1 \cadenzaMeasure \section

    b'2( a4 b g2) fis g g4 g \cadenzaMeasure
    a4( b) a( g) fis2 g4( a) b1 \cadenzaMeasure
    b2( c1) b4( a) g( a) b( a) b2 \cadenzaMeasure
    a2 g fis4( g a2. g4) fis1 e \cadenzaMeasure \fine

}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn

    e'4 e\breve~ e2 e \cadenzaMeasure
    d1. d4 d e1 \cadenzaMeasure
    e\breve e2 e e \cadenzaMeasure
    e2 e d2 d1. d2 e1 \cadenzaMeasure

    e1. e2 e e4 e \cadenzaMeasure
    d2 d d d e1 \cadenzaMeasure
    e1. e2 e e e \cadenzaMeasure
    e2 e d1. d1 e1 \cadenzaMeasure
    
}

VerseOne = \lyricmode {
    Re -- ceive __ the
    Bo -- dy of Christ;
    taste __ the __  Foun -- tain
    of im -- mor -- ta -- li -- ty.
    Al -- le -- lu -- i -- a,
    Al -- le -- lu -- i -- a, 
    Al -- le -- lu -- i -- a,
    Al -- le -- lu -- i -- a.

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
            \Score
            \override SpacingSpanner.spacing-increment = 2
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





