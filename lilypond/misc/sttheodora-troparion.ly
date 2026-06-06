\version "2.24.4"

\header {
    title = "troparion of sts. justinian & theodora"
    subtitle = "Tone 3"
    composer = "Abbr. Greek Chant"
    tagline = " "
}

keyTime = { \key g \major}


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

SopMusic    = \transpose f g { \relative { %done
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn

    d'4 e f f f e f g a a a2 \cadenzaMeasure
    a4 \hideNotes a a \unHideNotes a g2( f4) e d2 \cadenzaMeasure
     f4 \hideNotes f f f \unHideNotes f e f g( a) a2 \cadenzaMeasure

    a4 \hideNotes a a a \unHideNotes a g a bes2. bes4 a2 \cadenzaMeasure
    a4 a a g2 g4 f e d2 \cadenzaMeasure
    f4 \hideNotes f f f \unHideNotes f e f g( a) a2 \cadenzaMeasure

    a4 bes c2 c4 bes bes a2 \cadenzaMeasure
    a1( g2 f) g4( a bes a g f g1) f \cadenzaMeasure  
}}

BassMusic   = \transpose f g { \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn

    d'4 c f f f c f c f f f2 \cadenzaMeasure
    f4 \hideNotes f f \unHideNotes f e2( f4) c d2 \cadenzaMeasure
    f4 \hideNotes f f f \unHideNotes f c f c( f) f2 \cadenzaMeasure

    f4 \hideNotes f f f \unHideNotes f f f bes,2. d4 f2 \cadenzaMeasure
    f4 f f e2 e4 f c d2 \cadenzaMeasure
    f4 \hideNotes f f f \unHideNotes f c f c( f) f2 \cadenzaMeasure

    f4 bes a2 a4 bes4 bes f2 \cadenzaMeasure
    f1( c2 d) g1~( g4 d c1) f1 \cadenzaMeasure


}}



VerseOne = \lyricmode { 
    You have shone with the deeds of Or -- tho -- dox -- y,
    and wiped away all her -- e -- sy. 

    You have become tro -- phy bear -- ing vic -- tors, 
    and enriched the uni -- verse with your pi -- e -- ty, 
    great -- ly em -- bel -- lish -- ing the Church, 
    
    so that you have right -- ly found Christ God, 
    
    who hath grant -- ed to the world great mer -- cy.

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

