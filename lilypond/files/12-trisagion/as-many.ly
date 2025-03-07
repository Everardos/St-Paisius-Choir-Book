\version "2.24.4"

\header {
    title = "as many as have been baptized"
    subtitle = "Antitrisagion"
    composer = "Lesser Znamenny"
    tagline = " "
}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1i" 
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

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'2 f1 \cadenzaMeasure \bar ".|:"
    f4( g) a2 a4 a a a bes2 bes4 bes bes a2 \cadenzaMeasure
    a4( bes) a2 a4( g) f2 \cadenzaMeasure
    f4 g a2( g) f1 \cadenzaMeasure \bar ":|."
        \textEndMark \markup { \italic \small "thrice" }
    
    f4 \hideNotes f f f   f f f   f f f   f f f \unHideNotes f \cadenzaMeasure
    f4 \hideNotes f f f   f f f   f f \unHideNotes f \allowBreak
    f4 f1 \cadenzaMeasure \section
    a4( bes) a2 a4( g) f2 \cadenzaMeasure
    f4 g a2( g) f1 \cadenzaMeasure \fine
        \textEndMark \markup { \italic \small "As many..." }


}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'2 f1 \cadenzaMeasure
    f2 f f4 f f f bes,2 bes4 bes d f2 \cadenzaMeasure
    f4( bes,) c2 c f \cadenzaMeasure
    d4 d c1 f \cadenzaMeasure
    
    f4 \hideNotes f f f   f f f   f f f   f f f \unHideNotes f \cadenzaMeasure
    f4 \hideNotes f f f   f f f   f f \unHideNotes f \allowBreak
    f4 f1 \cadenzaMeasure \section
    f4( bes,) c2 c f \cadenzaMeasure
    d4 d c1 f \cadenzaMeasure
}

VerseOne = \lyricmode {
    A -- men.
    As man -- y as have been bap -- tized in -- to Christ
    have __ put on __ Christ.
    Al -- le -- lu -- ia.
    Glo -- ry to the Father, and to the Son, and to the Holy Spirit,
    both now and ever, and unto the ages of ages. A -- men.
    have __ put on __ Christ.
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





