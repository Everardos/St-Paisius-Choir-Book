\version "2.24.4"

\header {
    title = "megalynarion"
    subtitle = "Nov. 21: Entry of the Theotokos"
    composer = "Tone 4"
    tagline = " "
}

keyTime = { \key f \major}


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
    f'4 \hideNotes f f f \unHideNotes f e f( e) d2 \cadenzaMeasure
    d4 g g g g2 \allowBreak f4 e f2 f \cadenzaMeasure
    g2 g4 g g f g a2 f \cadenzaMeasure
    f4 \hideNotes f f f \unHideNotes f g2( f) e1 \cadenzaMeasure
    f4 f e f( e) d2 \cadenzaMeasure
    g4 \hideNotes g g \unHideNotes g f2 e f2. \cadenzaMeasure
    g4 g g g2 f4 g a2 f \cadenzaMeasure
    f4 f f e f( e) d2 \cadenzaMeasure
    d4 g \hideNotes g g g g \unHideNotes g f e \allowBreak f2 f \cadenzaMeasure
    g4 g g2. g4 a2 f1 \cadenzaMeasure
    f4 \hideNotes f f f \unHideNotes f \allowBreak f f g2 f4 f e1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 \hideNotes f f f \unHideNotes f c f( c) d2 \cadenzaMeasure
    d4 c c c c2 c4 c f2 f \cadenzaMeasure
    c2 c4 c c c c f2 f \cadenzaMeasure
    f4 \hideNotes f f f \unHideNotes f e2( f) c1 \cadenzaMeasure
    f4 f c f( c) d2 \cadenzaMeasure
    c4 \hideNotes c c \unHideNotes c f2 c f2. \cadenzaMeasure
    c4 c c c2 c4 c f2 f \cadenzaMeasure
    f4 f f c f( c) d2 \cadenzaMeasure
    d4 c \hideNotes c c c c \unHideNotes c c c f2 f \cadenzaMeasure
    c4 c c2. c4 f2 f1 \cadenzaMeasure
    f4 \hideNotes f f f \unHideNotes f f f e2 f4 f c1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    Be -- holding the entry of the All -- Pure,
    the an -- gels were struck with a -- maze -- ment,
    see -- ing how the Vir -- gin en -- tered
    in -- to the Holy of Ho -- lies.
    Let no pro -- fane __ hand
    touch the liv -- ing Ark of God, but let the lips of the faith -- ful,
    sing -- ing with -- out ceas -- ing
    the words of the Angel to the The -- o -- to --kos,
    cry a -- loud in great joy:
    O pure Virgin, thou art tru -- ly high a -- bove all.
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





