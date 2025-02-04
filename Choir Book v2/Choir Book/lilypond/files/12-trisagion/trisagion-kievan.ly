\version "2.24.4"

\header {
    title = "trisagion"
    subtitle = "The Thrice-Holy Hymn"
    composer = "Kievan Variant"
    tagline = " "

}

keyTime = { \key g \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1I" 
     }

\include "C:/Users/Zhao/Choir Book/lilypond/ly/choirbook-variables.ly"
\include "C:/Users/Zhao/Choir Book/lilypond/ly/choirbook-paper.ly"

SopMusic    = \relative { 
    \cadenzaOn

    g'2 g \cadenzaMeasure \bar ".|:"
        \textMark \markup { \italic "thrice" }
    g4( a b) g fis1 \cadenzaMeasure
    fis4( g a) fis g2 g \cadenzaMeasure \break
    a4( b) c a b2 a4 \cadenzaMeasure
    g4 a2 g4 fis g1 \cadenzaMeasure \bar ":|."

    g4 \hideNotes \repeat unfold 6 {g} \unHideNotes g \break g \hideNotes g g g \unHideNotes g g2 fis \cadenzaMeasure
    fis4 \hideNotes \repeat unfold 7 {fis} \unHideNotes fis g2 g4 \break g g2 \cadenzaMeasure
    a4( b) c a b2 a4 \cadenzaMeasure
    g4 a2 g4 fis g1 \cadenzaMeasure \fine
}

AltoMusic   = \relative {
    \cadenzaOn

    e'2 e \cadenzaMeasure

    e4( fis g) e dis1 \cadenzaMeasure
    dis4( e fis) dis e2 e \cadenzaMeasure
    fis4( g) a fis g2 fis4 \cadenzaMeasure
    e4 fis2 e4 dis e1 \cadenzaMeasure

    e4 \hideNotes \repeat unfold 6 {e} \unHideNotes e e \hideNotes e e e \unHideNotes e e2 dis2 \cadenzaMeasure
    dis4 \hideNotes \repeat unfold 7 {dis} \unHideNotes dis e2 e4 e e2 \cadenzaMeasure
    fis4( g) a fis g2 fis4 \cadenzaMeasure
    e4 fis2 e4 dis e1 \cadenzaMeasure \fine
}

TenorMusic  = \relative {
    \cadenzaOn

    b2 b \cadenzaMeasure

    b2. b4 b1 \cadenzaMeasure
    b2. b4 b2 b \cadenzaMeasure
    d2 d4 d d2 d4 \cadenzaMeasure
    b b2 b4 b b1 \cadenzaMeasure

    b4 \hideNotes \repeat unfold 6 {b} \unHideNotes b b \hideNotes b b b \unHideNotes b b2 b \cadenzaMeasure
    b4 \hideNotes \repeat unfold 7 {b} \unHideNotes b b2 b4 b b2 \cadenzaMeasure
    d2 d4 d d2 d4 \cadenzaMeasure
    b b2 b4 b b1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn

    e2 e \cadenzaMeasure
    e2. e4 b1 \cadenzaMeasure
    b2. b4 e2 e \cadenzaMeasure
    d2 d4 d g2 d4 \cadenzaMeasure
    e b2 b4 b e1 \cadenzaMeasure

    e4 \hideNotes \repeat unfold 6 {e} \unHideNotes e e \hideNotes e e e \unHideNotes e e2 b \cadenzaMeasure
    b4 \hideNotes \repeat unfold 7 {b} \unHideNotes b e2 e4 e e2 \cadenzaMeasure
    d2 d4 d g2 d4 \cadenzaMeasure
    e b2 b4 b e1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    A -- men.
    Ho -- ly God,
    Ho -- ly Migh -- ty,
    Ho -- ly Im -- mor -- tal,
    have mer -- cy on us.
    Glory to the Father and to the Son and to the Ho -- ly Spi -- rit,
    both now and ever and unto the ages of a -- ges. A -- men.
    Ho -- ly Im -- mor -- tal,
    have mer -- cy on us.

}

VerseTwo = \lyricmode {
    \override LyricText.font-size = #-1

    А -- минь.
    "Свя - тый__" _  Боже,
    "Свя - тый__" _ Креп -- кий,
    Свя -- тый Бес -- смерт -- ный,
    по -- ми__ _ -- луй нас.
    Сла -- ва _ От -- цу, и Сы -- ну, и _ Свя -- то -- му Ду -- ху,
    и ныне и при -- сно, и во ве -- ки ве -- ков. А -- минь.
    Свя -- тый Бес -- смерт -- ный,
    по -- ми__ _ -- луй нас.


}

VerseThree = \lyricmode {
    \override LyricText.font-size = #-1

    A -- min.
    "Svya - tiy__" _ Bozhe,
    "Svya - tiy__" _ Krep -- kiy,
    Svya -- ty Bes -- smert -- niy,
    po -- mi__ _ -- luy nas.
    Sla -- va _ Ot -- su, i Si -- nu, i _ Svya -- to -- mu Du -- khu,
    i ninye i pri -- sno, i vo vye -- ki vye -- kov. A -- min.
    Svya -- ty Bes -- smert -- niy,
    po -- mi__ _ -- luy nas.
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
            \new Lyrics \lyricsto "Sop" { \VerseTwo }
            \new Lyrics \lyricsto "Sop" { \VerseThree }
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
                forbidBreakBetweenBarLines = ##f

        }
        \context {
            \Lyrics
                \override LyricSpace.minimum-distance = #1
                \override LyricText.font-size = #1
        }
    }
    \midi {
        \tempo 4 = 180
    }
}