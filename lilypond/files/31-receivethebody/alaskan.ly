\version "2.24.4"

\header {
    title = "receive the body of christ"
    subtitle = "Communion Hymn"
    composer = "Alaskan Melody"
    tagline = " "
}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#2R" 
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
    \textMark "A." 
    a'8([ bes]) c4. bes8 a4 d8 d c4.( bes8 a4) \cadenzaMeasure
    a8 c bes4 bes8 a g4 f8([ g]) a4. a8 a2 \cadenzaMeasure \section
    \textMark "B."
    f8([ g]) a4. g8 f4 bes8 bes a4.( g8 f4) \cadenzaMeasure
    f8 a g4 g8 f e4 d8([ e]) f4. f8 f2 \cadenzaMeasure \bar ":|."

    \textMark "A." 
    a8 bes c4.( bes8) a4 d8 d c4.( bes8) a4 \cadenzaMeasure
    a8 c bes4.( a8 g4 f8[ g]) a1 \cadenzaMeasure \section
    \textMark "B."
    f8 g a4.( g8) f4 bes8 bes a4.( g8) f4 \cadenzaMeasure
    f8 a g4.( f8 e4 d8[ e]) f1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 f4. f8 f4 bes,8 d f2. \cadenzaMeasure
    f8 f c4 c8 c c4 c f4. f8 f2 \cadenzaMeasure
    f4 f4. f8 f4 bes,8 d f2. \cadenzaMeasure
    f8 f c4 c8 c c4 c f4. f8 f2 \cadenzaMeasure

    f8 f f2 f4 bes,8 d f2 f4 \cadenzaMeasure
    f8 f c1 f1 \cadenzaMeasure
    f8 f f2 f4 bes,8 d f2 f4 \cadenzaMeasure
    f8 f c1 f1 \cadenzaMeasure
}

VerseOne = \lyricmode {
    Re -- ceive the Bo -- dy of Christ;
    taste the Foun -- tain of im -- mor -- ta -- li -- ty.
    Re -- ceive the Bo -- dy of Christ;
    taste the Foun -- tain of im -- mor -- ta -- li -- ty.
    Al -- le -- lu -- ia, Al -- le -- lu -- ia, 
    Al -- le -- lu -- ia.
    Al -- le -- lu -- ia, Al -- le -- lu -- ia, 
    Al -- le -- lu -- ia.
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





