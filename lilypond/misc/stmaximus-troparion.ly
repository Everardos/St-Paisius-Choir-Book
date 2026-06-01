\version "2.24.4"

\header {
    title = "troparion of st. maximus"
    subtitle = "Tone 8"
    composer = "Lesser Znamenny"
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
    a'4 a a2 a4 \hideNotes a a a a a \unHideNotes a g2( a bes4) a g1  \cadenzaMeasure
    c2 bes4 a g2 bes a( g1) \cadenzaMeasure
    a4 bes2 bes4 \hideNotes bes bes bes \unHideNotes bes a2( bes4 a2 g) f1 \cadenzaMeasure
    f4 f g a2 a4 \hideNotes a a a a \unHideNotes a a( g) f2 g( a) bes4( a) g1 \cadenzaMeasure
    a4( g a bes) c2 bes4 a g2( bes a) g1 \cadenzaMeasure
    bes4 \hideNotes bes bes bes \unHideNotes bes a bes2( c) c4( bes a2) bes2.( a4 g1) \cadenzaMeasure

    
}

BassMusic   = \relative { %not started
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 f f2 f4 \hideNotes f f f f f \unHideNotes f f2 f f4 f g1 \cadenzaMeasure
    g2 g4 g g2 g g1. \cadenzaMeasure
    g4 g2 g4 \hideNotes g g g \unHideNotes g g2.~ g1 f1 \cadenzaMeasure
    f4 f f f2 f4 \hideNotes f f f f \unHideNotes f f2 f2 f1 f2 g1 \cadenzaMeasure
    g1 g2 g4 g g1. g1 \cadenzaMeasure
    g4 \hideNotes g g g  \unHideNotes g g f1 f f1( g1) \cadenzaMeasure



}



VerseOne = \lyricmode { 
    O in -- struc -- tor of Orthodoxy, teacher of piety and pu -- ri -- ty, 
    bea -- con of all the world, 
    di -- vine -- ly inspired adornment of mo -- nas -- tics: 
    O all "- wise" Max -- i -- mus, by thy doctrines thou hast en -- light -- ened all. 
    O harp of the Spir -- it, 
    en -- treat Christ God, that our souls be saved.
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

