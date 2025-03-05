\version "2.24.4"

\header {
    title = "o protection of christians"
    subtitle = "Sixth Tone"
    composer = "Abbr. Bulgarian Chant"
    tagline = " "

}

keyTime = { \key f \major}

bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#2h" 
}

titleFont = \markup {\fill-line {
                \fontsize #6 \caps
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



SopMusic    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    a'4 \hideNotes a a a a a \unHideNotes a bes c2 c bes1 \cadenzaMeasure
    g4 g a bes \hideNotes bes bes bes bes bes \unHideNotes bes a bes2( a) g1 \cadenzaMeasure
    a4 \hideNotes a a a a a  \unHideNotes a bes c1 bes \cadenzaMeasure
    g4 g a bes a bes2( a) g1 \cadenzaMeasure
    a4 \hideNotes a a \unHideNotes a bes c2 c4 c c bes1 \cadenzaMeasure
    g4 g g g a bes bes \hideNotes bes bes bes bes bes \unHideNotes bes a bes2( a) g1 \cadenzaMeasure
    a4 \hideNotes a a a a \unHideNotes a a bes c1 bes \cadenzaMeasure
    g4 a bes( a bes2) a g1 \cadenzaMeasure \fine
}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 \hideNotes f f f f f \unHideNotes f g a2 a g1 \cadenzaMeasure
    e4 e f g \hideNotes g g g g g \unHideNotes g f g2( f) e1 \cadenzaMeasure
    f4 \hideNotes f f f f f \unHideNotes f g a1 g \cadenzaMeasure
    e4 e f g f g2( f) e1 \cadenzaMeasure
    f4 \hideNotes f f \unHideNotes f g a2 a4 a a g1 \cadenzaMeasure
    e4 e e e f g g \hideNotes g g g g g \unHideNotes g f g2( f) e1 \cadenzaMeasure
    f4 \hideNotes f f f f \unHideNotes f f g a1 g \cadenzaMeasure
    e4 f g( f g2) f e1 \cadenzaMeasure \fine


}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    c'4 \hideNotes c c c c c \unHideNotes c c f2 fis d1 \cadenzaMeasure
    c4 c c c \hideNotes c c c c c \unHideNotes c c c1 c \cadenzaMeasure
    c4 \hideNotes c c c c c \unHideNotes c c f2( fis) d1 \cadenzaMeasure
    c4 c c c c c1 c \cadenzaMeasure
    c4 \hideNotes c c \unHideNotes c c f2 fis4 fis fis d1 \cadenzaMeasure
    c4 c c c c c c \hideNotes c c c c c \unHideNotes c c c1 c \cadenzaMeasure
    c4 \hideNotes c c c c \unHideNotes c c c f2( fis) d1 \cadenzaMeasure
    c4 c c1 c2 c1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f4 \hideNotes f f f f f \unHideNotes f f f2 d g1 \cadenzaMeasure
    c,4 c c c \hideNotes c c c c c \unHideNotes c f e2( f) c1 \cadenzaMeasure
    f4 \hideNotes f f f f f \unHideNotes f f f2( d) g1 \cadenzaMeasure
    c,4 c c c f e2( f) c1 \cadenzaMeasure
    f4 \hideNotes f f \unHideNotes f f f2 d4 d d g1 \cadenzaMeasure
    c,4 c c c c c c \hideNotes c c c c c \unHideNotes c f e2( f) c1 \cadenzaMeasure
    f4 \hideNotes f f f f \unHideNotes f f f f2( d) g1 \cadenzaMeasure
    c,4 c c2( e) f c1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    O protection of Christians that can -- not be put to shame,
    O me -- di -- a -- tion unto the Cre -- a -- tor un -- fail -- ing,
    dis -- dain not the suppliant voic -- es of sin -- ners;
    but be thou quick, O good one,
    to help us who in faith cry un -- to thee;
    has -- ten to in -- ter -- ces -- sion and speed thou to make sup -- pli -- ca -- tion,
    thou who dost ever protect, O The -- o -- to -- kos, 
    them that ho -- nor thee.
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

