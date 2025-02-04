\version "2.24.4"

\header {
    title = "third typical antiphon"
    subtitle = "The Beatitudes"
    composer = "A. Gretchaninov"
    tagline = " "

}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1E" 
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

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    
    a'4 a a2 a4 \hideNotes a a \unHideNotes a a1 \cadenzaMeasure %in thy kingdom
    a4 a a2 a4 a a a bes2 bes1 \cadenzaMeasure \section

    a4 \hideNotes a a a a \unHideNotes a bes2 bes \cadenzaMeasure %poor in spirit
    bes4 \hideNotes bes bes \unHideNotes bes c2 g4 g a1 a \cadenzaMeasure \section

    a4 \hideNotes a a a \unHideNotes a bes2 \cadenzaMeasure %mourn
    bes4 c2 g4 g a2 a4 a1 \cadenzaMeasure \section

    a4 \hideNotes a a \unHideNotes a bes2 \cadenzaMeasure %meek
    bes4 c2 g4 g a2 a4 a a1 \cadenzaMeasure \section

    a4 \hideNotes a a a a a a a a \unHideNotes a bes2. bes4 bes2 \cadenzaMeasure %hunger and thirst
    bes4 c2 g4 g a1 \cadenzaMeasure \section

    a4 \hideNotes a a \unHideNotes a bes2. bes4 bes2 \cadenzaMeasure %merciful
    bes4 c2 g4 g g a1 a \cadenzaMeasure \section

    a4 \hideNotes a a \unHideNotes a bes2 bes4 bes2 \cadenzaMeasure %pure in heart
    bes4 c2 g4 g a1 \cadenzaMeasure \section

    a4 \hideNotes a a \unHideNotes a bes2 bes4 bes2 \cadenzaMeasure %peacemakers
    bes4 bes bes bes c2 g4 a2 a4 a1 \cadenzaMeasure \section

    a4 \hideNotes a a a a a a \unHideNotes a bes2 bes4 bes bes2 \cadenzaMeasure %persecuted for righteousness
    bes4 \hideNotes bes bes \unHideNotes bes c2 g4 g a1 a \cadenzaMeasure \section

    a4 \hideNotes a a a a a a a a \unHideNotes a bes2 bes4 bes bes2 \cadenzaMeasure %blessed are ye
    bes4 \hideNotes bes bes bes bes bes bes bes \unHideNotes bes c2 g4 g a1 a \cadenzaMeasure \section

    a4 a2 a4 a a bes2 bes4 bes bes1  \cadenzaMeasure %rejoice
    bes4 \hideNotes bes bes bes \unHideNotes bes c2 g4 a1 a \cadenzaMeasure \section

    a4 \hideNotes a a \unHideNotes a bes2 bes \cadenzaMeasure %glory
    bes4 \hideNotes bes bes bes bes bes \unHideNotes bes c2 g4 a1 a \cadenzaMeasure \section

    a4 a a bes2 bes \cadenzaMeasure %both now
    bes4 bes bes bes c2 g4 g a2 a4 a a1 \cadenzaMeasure \section
}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn

    f'4 f f2 f4 \hideNotes f f \unHideNotes f f1 \cadenzaMeasure 
    f4 f f2 f4 f f f g2 g1 \cadenzaMeasure

    f4 \hideNotes f f f f \unHideNotes f g2 g \cadenzaMeasure
    g4 \hideNotes g g \unHideNotes g e2 e4 e f1 f \cadenzaMeasure

    f4 \hideNotes f f f \unHideNotes f g2 \cadenzaMeasure
    g4 e2 e4 e f2 f4 f1 \cadenzaMeasure

    f4 \hideNotes f f \unHideNotes f g2 \cadenzaMeasure
    g4 e2 e4 e f2 f4 f f1 \cadenzaMeasure

    f4 \hideNotes f f f f f f f f \unHideNotes f g2. g4 g2 \cadenzaMeasure
    g4 e2 e4 e f1 \cadenzaMeasure

    f4 \hideNotes f f \unHideNotes f g2. g4 g2 \cadenzaMeasure
    g4 e2 e4 e e f1 f \cadenzaMeasure

    f4 \hideNotes f f \unHideNotes f g2 g4 g2 \cadenzaMeasure
    g4 e2 e4 e f1 \cadenzaMeasure

    f4 \hideNotes f f \unHideNotes f g2 g4 g2 \cadenzaMeasure
    g4 g g g e2 e4 f2 f4 f1 \cadenzaMeasure

    f4 \hideNotes f f f f f f \unHideNotes f g2 g4 g g2 \cadenzaMeasure
    g4 \hideNotes g g \unHideNotes g e2 e4 e f1 f \cadenzaMeasure

    f4 \hideNotes f f f f f f f f \unHideNotes f g2 g4 g g2 \cadenzaMeasure
    g4 \hideNotes g g g g g g g \unHideNotes g e2 e4 e f1 f \cadenzaMeasure

    f4 f2 f4 f f g2 g4 g g1  \cadenzaMeasure
    g4 \hideNotes g g g \unHideNotes g e2 e4 f1 f \cadenzaMeasure

    f4 \hideNotes f f \unHideNotes f g2 g \cadenzaMeasure
    g4 \hideNotes g g g g g \unHideNotes g e2 e4 f1 f \cadenzaMeasure

    f4 f f g2 g \cadenzaMeasure
    g4 g g g e2 e4 e f2 f4 f f1 \cadenzaMeasure \fine


}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn

    c'4 c d2 d4 \hideNotes d d \unHideNotes d c1 \cadenzaMeasure 
    c4 c d2 d4 d d d d2 d1 \cadenzaMeasure \section

    d4 \hideNotes d d d d \unHideNotes d d2 d \cadenzaMeasure
    d4 \hideNotes d d \unHideNotes d c2 c4 c c1 c \textEndMark "(On 12)" \cadenzaMeasure \section

    d4 \hideNotes d d d \unHideNotes d d2 \cadenzaMeasure
    d4 c2 c4 c c2 c4 c1 \cadenzaMeasure \section

    d4 \hideNotes d d \unHideNotes d d2 \cadenzaMeasure
    d4 c2 c4 c c2 c4 c c1 \textEndMark "(On 10)" \cadenzaMeasure \section

    d4 \hideNotes d d d d d d d d \unHideNotes d d2. d4 d2 \cadenzaMeasure
    d4 c2 c4 c c1 \cadenzaMeasure \section

    d4 \hideNotes d d \unHideNotes d d2. d4 d2 \cadenzaMeasure
    d4 c2 c4 c c c1 c \textEndMark "(On 8)" \cadenzaMeasure \section

    d4 \hideNotes d d \unHideNotes d d2 d4 d2 \cadenzaMeasure
    d4 c2 c4 c c1 \cadenzaMeasure \section

    d4 \hideNotes d d \unHideNotes d d2 d4 d2 \cadenzaMeasure
    d4 d d d c2 c4 c2 c4 c1 \textEndMark "(On 6)" \cadenzaMeasure \section

    d4 \hideNotes d d d d d d \unHideNotes d d2 d4 d d2 \cadenzaMeasure
    d4 \hideNotes d d \unHideNotes d c2 c4 c c1 c \cadenzaMeasure \section

    d4 \hideNotes d d d d d d d d \unHideNotes d d2 d4 d d2 \cadenzaMeasure
    d4 \hideNotes d d d d d d d \unHideNotes d c2 c4 c c1 c \cadenzaMeasure \section

    d4 d2 d4 d d d2 d4 d d1  \cadenzaMeasure
    d4 \hideNotes d d d \unHideNotes d c2 c4 c1 c \cadenzaMeasure \section

    d4 \hideNotes d d \unHideNotes d d2 d \cadenzaMeasure
    d4 \hideNotes d d d d d \unHideNotes d c2 c4 c1 c \cadenzaMeasure \section

    d4 d d d2 d \cadenzaMeasure
    d4 d d d c2 c4 c c2 c4 c c1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn

    f4 f d2 d4 \hideNotes d d \unHideNotes d f1 \cadenzaMeasure 
    f4 f d2 d4 d d d g2 g1 \cadenzaMeasure

    d4 \hideNotes d d d d \unHideNotes d g2 g \cadenzaMeasure
    g4 \hideNotes g g \unHideNotes g c,2 c4 c f1 f \cadenzaMeasure

    d4 \hideNotes d d d \unHideNotes d g2 \cadenzaMeasure
    g4 c,2 c4 c f2 f4 f1 \cadenzaMeasure

    d4 \hideNotes d d \unHideNotes d g2 \cadenzaMeasure
    g4 c,2 c4 c f2 f4 f f1 \cadenzaMeasure

    d4 \hideNotes d d d d d d d d \unHideNotes d g2. g4 g2 \cadenzaMeasure
    g4 c,2 c4 c f1 \cadenzaMeasure

    d4 \hideNotes d d \unHideNotes d g2. g4 g2 \cadenzaMeasure
    g4 c,2 c4 c c f1 f \cadenzaMeasure

    d4 \hideNotes d d \unHideNotes d g2 g4 g2 \cadenzaMeasure
    g4 c,2 c4 c f1 \cadenzaMeasure

    d4 \hideNotes d d \unHideNotes d g2 g4 g2 \cadenzaMeasure
    g4 g g g c,2 c4 f2 f4 f1 \cadenzaMeasure

    d4 \hideNotes d d d d d d \unHideNotes d g2 g4 g g2 \cadenzaMeasure
    g4 \hideNotes g g \unHideNotes g c,2 c4 c f1 f \cadenzaMeasure

    d4 \hideNotes d d d d d d d d \unHideNotes d g2 g4 g g2 \cadenzaMeasure
    g4 \hideNotes g g g g g g g \unHideNotes g c,2 c4 c f1 f \cadenzaMeasure

    d4 d2 d4 d d g2 g4 g g1  \cadenzaMeasure
    g4 \hideNotes g g g \unHideNotes g c,2 c4 f1 f \cadenzaMeasure

    d4 \hideNotes d d \unHideNotes d g2 g \cadenzaMeasure
    g4 \hideNotes g g g g g \unHideNotes g c,2 c4 f1 f \cadenzaMeasure

    d4 d d g2 g \cadenzaMeasure
    g4 g g g c,2 c4 c f2 f4 f f1 \cadenzaMeasure
}

VerseOne = \lyricmode {
    In Thy King -- dom remember us, O Lord,
    when Thou com -- est in -- to Thy King -- dom.

    Bless -- ed are the poor in spi -- rit:
    for theirs is the King -- dom of Hea -- ven.

    Bless -- ed are they that mourn:
    for they shall be com -- for -- ted.

    Bless -- ed are the meek:
    For they shall in -- her -- it the earth.

    Bless -- ed are they that hunger and thirst af -- ter right -- eous -- ness:
    for they shall be filled.

    Bless -- ed are the mer -- ci -- ful:
    for they shall ob -- tain mer -- cy.

    Bless -- ed are the pure in heart:
    for they shall see God.

    Bless -- ed are the peace -- mak -- ers:
    for they shall be called the sons of God.

    Bless -- ed are they that are persecuted for right -- eous -- ness sake:
    For theirs is the King -- dom of Hea -- ven.

    Bless -- ed are ye when men shall revile you and per -- se -- cute you:
    And shall say all manner of evil against you false -- ly for my sake.

    Re -- joice and be ex -- ceed -- ing -- ly glad
    for great is your re -- ward in hea -- ven.

    Glo -- ry to the Fa -- ther,
    and to the Son, and to the Ho -- ly Spi -- rit;

    Both now and ev -- er,
    and un -- to the a -- ges of a -- ges. A -- men.
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
            \Score
                \omit BarNumber
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







