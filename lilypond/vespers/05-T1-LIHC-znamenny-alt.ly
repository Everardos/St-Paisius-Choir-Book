\version "2.24.4"

\header {
    title = "lord, i have cried"
    subtitle = "Tone I"
    composer = "Znamenny"
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
    a'4( bes8[ c]) a4 a8([ g]) bes4( a g8[ f]) g( [ a]) bes4 a( g8[ a] g2) \cadenzaMeasure
    c4 c bes8([ a]) bes4 a1 \cadenzaMeasure
    f8([ g] a4) a4 a8([ g]) f4 g4.( e8 f4) e4 d1 \cadenzaMeasure

    f8 \hideNotes f f f f \unHideNotes f g4 g8 f e e2 \cadenzaMeasure
    d8 d d d f \hideNotes f f \unHideNotes f f f4 f2 \cadenzaMeasure
    f4 f8([ g]) a4.( g8) f8([ g]) a4 a8( g4.) \cadenzaMeasure
    f8([ g] a4) a4 a8([ g]) f4 g4.( e8 f4) e4 d1 \cadenzaMeasure


    f8 \hideNotes f f f f f f f f \unHideNotes f f2 \cadenzaMeasure
    f8 \hideNotes f f \unHideNotes f g a2 \cadenzaMeasure
    a4 a a a8([ g]) f([ g]) a4 a8( g4.) \cadenzaMeasure
    f8([ g] a4) a4 a8([ g]) f4 g4.( e8 f4) e4 d1 \cadenzaMeasure



}

BassMusic   = \relative { %not started
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'2 f4 f d2. c4 d f2( g2) \cadenzaMeasure
    f4 f f f f1 \cadenzaMeasure
    f2 d4 d d g2( d4) d4 d1 \cadenzaMeasure

    f8 \hideNotes f f f f \unHideNotes f d4 d8 d d d2 \cadenzaMeasure
    d8 d d d d \hideNotes d d \unHideNotes d d d4 d2 \cadenzaMeasure
    d4 d f2 c4 c c2 \cadenzaMeasure
    f2 d4 d d g2( d4) d4 d1 \cadenzaMeasure

    f8 \hideNotes f f f f f f f f \unHideNotes f f2 \cadenzaMeasure
    f8 \hideNotes f f \unHideNotes f f f2 \cadenzaMeasure
    f4 f f f c c c2 \cadenzaMeasure
    f2 d4 d d g2( d4) d4 d1 \cadenzaMeasure
}



VerseOne = \lyricmode { 
    Lord, I have cried un -- to Thee, 
    hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I have cried unto Thee, hear -- ken un -- to me; 
    at -- tend to the voice of my sup -- pli -- ca -- tion,
    when I cry un -- to Thee.
    Hear -- ken un -- to me, O Lord.

    Let my prayer be set forth
    as incense be -- fore Thee,
    the lifting up of my hands
    as an eve -- ning sac -- ri -- fice.
    Heark -- en un -- to me, O Lord.
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

