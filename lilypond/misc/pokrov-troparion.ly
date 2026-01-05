\version "2.24.4"

\header {
    title = "troparion for the protecting veil"
    subtitle = "Tone 4"
    composer = "Greek Chant"
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
    f'4 g a \hideNotes a \unHideNotes a g8([ a]) bes4( a8[ g]) a4 g8([ a]) a4( bes) c8([ bes]) a([ bes]) a2 \cadenzaMeasure
    f4 g a a g8([ a]) bes4 a8([ g]) a4 g f g a g8([ f]) g( a4 g8) f2 \cadenzaMeasure
    f8([ g]) a4 a a g8([ a]) bes4( a8[ g]) a4 g8([ a]) bes8( c4 bes8) a4 g a2 
    a4 a g( f8[ e]) d2
    \cadenzaMeasure
    d4 e f( e) f g a g a bes8([ a]) bes8([ c8]) c8([ bes8]) a2 \cadenzaMeasure
    f8([ g]) a4 a a g8([ a]) bes4( a8[ g]) a2 a4 a a8([ g]) a8([ bes]) c([ bes]) a([ bes]) a2 \cadenzaMeasure
    a4 g8([ f]) g4 g8([ f]) g8([ a]) a([ g]) f1 \cadenzaMeasure
}

BassMusic   = \relative { %not started
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 f f \hideNotes f \unHideNotes f f f2 f4 f f2 f4 f f2 \cadenzaMeasure
    f4 f f f f f f f f f f f f c2 f \cadenzaMeasure
    f4 f f f f f f f f f2 f4 f f2 
    f4 f c2 d \cadenzaMeasure  
    d4 d c2 c4 c d d d d f f f2 \cadenzaMeasure
    f4 f f f f f2 f f4 f f f f f f2 \cadenzaMeasure
    f4 f c c c c f1 \cadenzaMeasure


}



VerseOne = \lyricmode { 
    O -- ver -- sha -- dowed by thy co -- ming, O Mo -- ther of God,
    we the right faith -- ful peo -- ple cel -- e -- brate to -- day with splen -- dor.
    And gaz -- ing at thine all -- pre -- cious im -- mage, we say 
    with com -- punc -- tion:
    Cov -- er us with thy pre -- cious o -- mo -- pho -- ri -- on,
    and save us from all e -- vils, as thou en -- treat -- est thy Son,
    Christ our God, to save our souls.
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

