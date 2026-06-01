\version "2.24.4"

\header {
    title = "troparion of st. anna"
    subtitle = "Tone 4"
    composer = "Lesser Znamenny"
    tagline = " "
}

keyTime = { \key c \major}


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

    d'4 e f2 f4 e f2( e) d1 \cadenzaMeasure
    e4 f g2 g4 \hideNotes  g g \unHideNotes g f g2 f4 e f1 \cadenzaMeasure
    g4 a2 f4 g2 f4 e f1 \cadenzaMeasure
    g4 \hideNotes g g \unHideNotes g f e2( d) e1  \cadenzaMeasure
    
    e4 f g2 g4 \hideNotes g g g g \unHideNotes g f g2( f4 e) f1 \cadenzaMeasure
    f4 f f g a2 f4 g2 f4 e f1 \cadenzaMeasure
    g4 g f e2 d e1 \cadenzaMeasure

    e4 e f g2 g4 g f g2( f4 e) f1 \cadenzaMeasure
    g4 g f e2 e4 d4( e) f4 e1( d1) \cadenzaMeasure
}

BassMusic   = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    d'4 d d2 d4 d d1 d \cadenzaMeasure
    d4 d4 c2 c4 \hideNotes c c \unHideNotes c c c2 c4 c d1 \cadenzaMeasure
    d4 d2 d4 d2 d4 d d1 \cadenzaMeasure
    c4 \hideNotes c c \unHideNotes c c c1 c \cadenzaMeasure

    c4 c c2 c4 \hideNotes c c c c \unHideNotes c c c1 d1 \cadenzaMeasure
    d4 d d d d2 d4 d2 d4 d d1 \cadenzaMeasure
    c4 c c c2 c c1 \cadenzaMeasure

    c4 c c c2 c4 c c c1 d1 \cadenzaMeasure
    c4 c c c2 c4 c2 c4 c1( d) \cadenzaMeasure

}



VerseOne = \lyricmode { 
    O di -- vine -- ly wise An -- na, 
    in thy womb thou didst bear the pure Moth -- er of God, 
    who gav -- eth birth un -- to Life. 
    Where -- fore, rejoic -- ing in glo -- ry,

    thou hast now been translated to the man -- sions of heav -- en,
    where is the a -- bode of those who re -- joice. 
    O ev -- er "- bles" -- sed one, 

    be -- seech thou cleans -- ing of trans -- gres -- sions 
    for those who hon -- or thee with love.
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

