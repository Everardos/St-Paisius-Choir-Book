\version "2.24.4"

\header {
    title = "litany of the catechumens"
    subtitle = " "
    composer = "N. Kedrov Jr."
    tagline = " "

}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1L" 
}


\include "C:/Users/Zhao/Choir Book/lilypond/ly/choirbook-variables.ly"

titleFont = \markup {\fill-line {
                \fontsize #6 \caps
                \override #'(font-name . "EB Garamond")
                \fromproperty #'header:title
                }}
subTitleFont = \markup {\fill-line {
                \fontsize #2 \override #'(font-name . "EB Garamond Italic")
                \fromproperty #'header:subtitle
                }}

\include "C:/Users/Zhao/Choir Book/lilypond/ly/choirbook-paper.ly"

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 10/4
    f'4 f f1 f |
    f4 f f1 f |
    f4 f4 g1 a1 |
    a4 a bes1 c |
    c4 c bes1 a |
    a4 a g1 a |
    \cadenzaOn
    a2 g1 f f \cadenzaMeasure
    a2 a1 \fine
}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 10/4
    c'4 c c1 c1 |
    c4 c d1 c |
    c4 c d1 f |
    f4 f f1 a |
    f4 f f1 f |
    f4 f d1 f |
    \cadenzaOn
    f2 d1 bes c \cadenzaMeasure
    f2 f1 \fine
}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 10/4
    a4 a a1 a|
    a4 a bes1 a |
    a4 a bes1 c |
    c4 c d1 f |
    ees4 ees d1 c |
    c4 c bes1 c |
    \cadenzaOn
    c2 bes1 g a \cadenzaMeasure
    c2 c1 \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 10/4
    f4 f f1 f |
    f4 f f1 f |
    f4 f f1 f |
    f4 f f1 f |
    f4 f f1 f |
    f4 f f1 f |
    \cadenzaOn
    f2 f1 f f \cadenzaMeasure
    f2 f1 \fine
}

VerseOne = \lyricmode {
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    Lord, have mer -- cy.
    To Thee, O Lord.
    A -- men.
    }


\score {
    \new StaffGroup <<
        \new Staff \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
        >>
        \new Staff \with {midiInstrument = "choir aahs"} <<
            \clef "bass"
            \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusic}
            \new Voice = "Bass" { \voiceTwo \BassMusic} 
        >>
    >>
      \layout {
        \context {
            \Staff
                \remove Time_signature_engraver
        }
        \context {
            \Lyrics
                \override LyricSpace.minimum-distance = #1.0
        }
    }
    \midi {
        \tempo 4 = 120
    }
}





