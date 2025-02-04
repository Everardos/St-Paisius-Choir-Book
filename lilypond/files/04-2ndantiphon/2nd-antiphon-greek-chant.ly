\version "2.24.4"

\header {
    title = "second typical antiphon"
    subtitle = "Psalm 145"
    composer = "Greek Chant, Tone 1"
    tagline = " "

}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1C" 
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
    g'2( a2) f4 g a bes2 bes \cadenzaMeasure %Glory
    a4 \hideNotes a \unHideNotes a bes2 \cadenzaMeasure %and to the son
    a4 \hideNotes a a a \unHideNotes a g2 f \cadenzaMeasure %and to the holy
    f4 f g2( a2) f4( g) a bes1 \cadenzaMeasure %Praise
    a4 bes c bes a a a2 g4 a bes1 \cadenzaMeasure %I will Praise
    a4 \hideNotes a a a a a a a a a \unHideNotes a g2 f1 \cadenzaMeasure %I will sing praises
    f4 \hideNotes f \unHideNotes f g2( a2) f4 \hideNotes f \unHideNotes f g a bes1 \cadenzaMeasure %Put not
    a4 \hideNotes a a a a \unHideNotes a g2 f2 \cadenzaMeasure %in whom
    f4 f g2( a2) a4 bes2 \cadenzaMeasure %When his breath
    a4 \hideNotes a \unHideNotes a g a bes2 \cadenzaMeasure %he returns
    a4 bes c bes a a a g2 f \cadenzaMeasure %on that very day
    a4 bes2( c) a4 bes c d2 d \cadenzaMeasure %the lord will reign
    c4 \hideNotes c c c c c c \unHideNotes c bes1 a1 \cadenzaOff \fine %thy God
}

AltoMusic   = \relative { %not started
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    e'2( f2) f4 f f f2 f \cadenzaMeasure %Glory
    f4 \hideNotes f \unHideNotes f f2 \cadenzaMeasure %and to
    f4 \hideNotes f f f \unHideNotes f e2 c \cadenzaMeasure %and to
    c4 c e2( f) f f4 f1 \cadenzaMeasure %praise
    f4 f f f f f f2 f4 f f1 \cadenzaMeasure %I will
    f4 \hideNotes f f f f f f f f f \unHideNotes f e2 c1 \cadenzaMeasure %I will sing
    c4 \hideNotes c \unHideNotes c e2( f) f4 \hideNotes f \unHideNotes f f f f1 \cadenzaMeasure %put not
    f4 \hideNotes f f f f \unHideNotes f e2 c2 \cadenzaMeasure %in whom
    c4 c e2( f) f4 f2 \cadenzaMeasure %when his breath
    f4 \hideNotes f \unHideNotes f f f f2 \cadenzaMeasure %he returns
    f4 f f f f f f e2 c \cadenzaMeasure %on that very
    f4 f1 f4 f f f2 f \cadenzaMeasure %the lord will reign
    f4 \hideNotes f f f f f f \unHideNotes f f2( e) f1 \cadenzaOff \fine %thy god

}

TenorMusic  = \relative { %not started
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn

    c'1 a4 bes c d2 d \cadenzaMeasure %Glory
    c4 \hideNotes c \unHideNotes c d2 \cadenzaMeasure %and to
    c4 \hideNotes c c c \unHideNotes c bes2 a \cadenzaMeasure %and to the
    a4 a c1 a4( bes) c d1 \cadenzaMeasure %praise
    c4 d ees d c c c2 bes4 c d1 \cadenzaMeasure %I will praise
    c4 \hideNotes c c c c c c c c c \unHideNotes c bes2 a1 \cadenzaMeasure %I will sing
    a4 \hideNotes a \unHideNotes a c1 a4 \hideNotes a \unHideNotes a bes c d1 \cadenzaMeasure %put not
    c4 \hideNotes c c c c \unHideNotes c bes2 a \cadenzaMeasure %in whom
    a4 a c1 c4 d2 \cadenzaMeasure %when his breath
    c4 \hideNotes c \unHideNotes c bes c d2 \cadenzaMeasure %he returns
    c4 d ees d c c c bes2 a \cadenzaMeasure %on that very
    c4 c1 c4 c c bes2 bes \cadenzaMeasure %the lord
    c4 \hideNotes c c c c c c \unHideNotes c d2( c) c1 \cadenzaOff \fine %thy god
}

BassMusic   = \relative { %not started
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    c2( f) f4 f f bes,2 bes2 \cadenzaMeasure %Glory
    f'4 f f bes,2 \cadenzaMeasure %and to
    f'4 \hideNotes f f f \unHideNotes f c2 f \cadenzaMeasure %and to
    f4 f c2( f) f f4 bes,1 \cadenzaMeasure %praise
    f'4 bes a bes f f f2 f4 f4 bes,1 \cadenzaMeasure %I will praise
    f'4 \hideNotes f f f f f f f f f \unHideNotes f c2 f1 \cadenzaMeasure %I will sing
    f4 \hideNotes f \unHideNotes f c2( f) f4 \hideNotes f \unHideNotes f f f bes,1 \cadenzaMeasure %put not
    f'4 \hideNotes f f f f \unHideNotes f c2 f \cadenzaMeasure %in whom
    f4 f c2( f) f4 bes,2 \cadenzaMeasure %when his
    f'4 \hideNotes f \unHideNotes f d c bes2 \cadenzaMeasure %he returns
    f'4 bes a bes f f f c2 f \cadenzaMeasure %on that
    f4 g2( a) f4 g a bes2 bes \cadenzaMeasure %the lord
    a4 \hideNotes a a a a a a \unHideNotes a g2( c,) f1 \cadenzaOff \fine %thy god
}

VerseOne = \lyricmode { %not started
    Glo -- ry to the Fa -- ther,
    and to the Son,
    and to the Ho -- ly Spi -- rit.
    Praise the Lord, __ O __ my soul!
    I will praise the Lord as long as I live;
    I will sing praises to my God while I have my be -- ing.
    Put not your trust __ in princes, in sons of men,
    in whom there is no sal -- va -- tion.
    When his breath__ de -- parts,
    he returns un -- to his earth:
    on that ve -- ry day his plans per -- ish.
    The Lord __ will reign for -- ev -- er:
    Thy God O Zion to all gen -- er -- a -- tions.
    }


\score {
    \new ChoirStaff <<
        \new Staff \with {instrumentName = \markup {
            \right-column {
                \line { "S" }
                \line { "A" }
            }
        }}
        \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
        >>
        \new Staff \with {instrumentName = \markup {
            \right-column {
                \line { "T" }
                \line { "B" }
            }
        }}
        \with {midiInstrument = "choir aahs"} <<          
            \clef "bass"
            \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusic}
            \new Voice = "Bass" { \voiceTwo \BassMusic} 
        >>
    >>
    \layout {
        ragged-last = ##t
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

