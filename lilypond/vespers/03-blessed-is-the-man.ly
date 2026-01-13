\version "2.24.4"

\header {
    title = "blessed is the man"
    composer = "Valaam"
    tagline = " "
}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "" 
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

SopMusic    = \relative { %done
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    g'4. a8 g4 f g2( f) bes4\rest
    f4 f g a a bes8([ a]) g2( f) \break g4 g g a bes( a2 bes4 a8[ g]) a4( g4. a8 g4 f) \cadenzaMeasure
    g4 a bes4( a2 bes4 a) g( f) g1 \cadenzaMeasure \section
}

BassMusic   = \relative { %not started
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    g'4. a8 g4 f g2( f) bes4\rest
    f4 f e d d d d1 
    d4 d d d d1~ d4 d4~ d1 \cadenzaMeasure

    g4 f f1~ f4 d2 g1

}



VerseOne = \lyricmode { 
    Bless -- ed is the man __ that hath not walked in the coun -- sel of the un -- god -- ly. __ Al -- le -- lu -- i -- a.
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

