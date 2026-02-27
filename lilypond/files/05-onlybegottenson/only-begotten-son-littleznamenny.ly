\version "2.24.4"

\header {
    title = "only-begotten son"
    subtitle = "A Hymn of St. Justinian"
    composer = "Lesser Znamenny, Tone 6"
    tagline = " "
}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1D" 
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
    a'4 \hideNotes \repeat unfold 12 {a} \unHideNotes a a2 a2 \cadenzaMeasure
    a4 \hideNotes \repeat unfold 7 {a} \unHideNotes a g a2 g4 f g2 \cadenzaMeasure \section
    f4 f f g2 g4 \hideNotes g g \unHideNotes g f g a( g) f( g) a2 \cadenzaMeasure
    g4 g g a bes2 a4 \hideNotes a a a \unHideNotes a g a2( g) f \cadenzaMeasure
    f4 g a2 a4 \hideNotes a a a \unHideNotes a g a( g f2) g \cadenzaMeasure
    f4 f f g2 g4 \hideNotes g \unHideNotes g f g a( g) f( g) a2 \cadenzaMeasure
    g4 g a bes2 a4 a g a2 g f \cadenzaMeasure
    f4 g a2 \allowBreak a4 a a g a( g) f2 g \cadenzaMeasure
    g2 g4 \hideNotes g g g g \unHideNotes g \break g f g a( g f g) a2 \cadenzaMeasure
    g2( a bes2. a4 g2 f) g1 \cadenzaMeasure \fine

}

BassMusic   = \relative { %not started
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 \hideNotes \repeat unfold 12 {f} \unHideNotes f f2 f \cadenzaMeasure
    f4 \hideNotes \repeat unfold 7 {f} \unHideNotes f c f2 c4 d c2 \cadenzaMeasure \section
    d4 d d c2 c4 \hideNotes c c  \unHideNotes c d c f( c) d( c) f2 \cadenzaMeasure
    g4 g g f bes,2 f'4 \hideNotes f f f \unHideNotes f c f2( c) d \cadenzaMeasure
    d4 c f2 f4 \hideNotes f f f \unHideNotes f c f( c d2) c \cadenzaMeasure
    d4 d d c2 c4 \hideNotes c \unHideNotes c d c f( c) d( c) f2 \cadenzaMeasure
    g4 g f bes,2 f'4 f c f2 c d \cadenzaMeasure
    d4 c f2 f4 f f c f( c) d2 c \cadenzaMeasure
    c2 c4 \hideNotes c c c c \unHideNotes c c d c f( c d c) f2 \cadenzaMeasure
    g2( f bes,2. f'4 c2 d) g1 \cadenzaMeasure \fine 


}



VerseOne = \lyricmode { 
    [Glo -- ry to the Father, and to the Son, and to the Ho -- ly Spir -- it.]
    Both now and ever and unto the ag -- es of ag -- es. A -- men.
    On -- ly be -- got -- ten Son and Im -- mor -- tal Word __ of __ God,
    who for our sal -- va -- tion didst will to be in -- car -- nate
    of the ho -- ly Theotokos and ever -- Vir -- gin Mar -- y,
    who with -- out change didst become man, and wast cru -- ci -- fied,
    O Christ our God, tram -- pling down death by death, who art one
    of the Ho -- ly Trin -- i -- ty, glo -- ri fied with the Father and the Ho -- ly Spir -- it:
    save __ us.
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

