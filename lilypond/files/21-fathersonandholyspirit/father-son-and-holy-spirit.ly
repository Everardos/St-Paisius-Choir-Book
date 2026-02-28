\version "2.24.4"


\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}

keyTime = { \key f \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    a'4 a2 a 
    a4 g a2 
    a4 a g a bes2 a1 \cadenzaMeasure

    a4 \hideNotes a4. \unHideNotes a4 g a2 a
    a4 g a bes2 bes a1 \cadenzaMeasure \section

    %a'4 a a a2 g4 a bes2 bes4 bes a2 \cadenzaMeasure \section


}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn

    f'4 f2 f
    f4 e f2
    f4 f e f f2 f1 \cadenzaMeasure

    f4 \hideNotes f4. \unHideNotes f4 e f2 f
    f4 e f f2 e f1 \cadenzaMeasure \section

    %f'4 f f f2 d4 f f2 e4 e f2 \cadenzaMeasure \section

}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn

    c'4 c2 c
    c4 c c2
    c4 c c c d2 c1 \cadenzaMeasure

    c4 \hideNotes c4. \unHideNotes c4 c c2 c
    c4 c c d2 c c1 \cadenzaMeasure \section

    %c'4 c c c2 bes4 c d2 c4 c c2 \cadenzaMeasure \section
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn

    f4 f2 f
    f4 c f2
    f4 f c f bes,( c) f1 \cadenzaMeasure

    f4 \hideNotes f4. \unHideNotes f4 c f2 f
    f4 c f bes,2 c f1 \cadenzaMeasure \section

    %f4 f f f2 g4 f bes,2 c4 c f2 \cadenzaMeasure \section
}

VerseOne = \lyricmode {
    The Fa -- ther, and the Son, and the Ho -- ly Spi -- rit, 
    the Trinity, one in es -- sence, and in -- di -- vis -- i -- ble.

    }


\score {
    \new StaffGroup <<
        \new Staff <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
        >>
        \new Staff <<
            \clef "bass"
            \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusic}
            \new Voice = "Bass" { \voiceTwo \BassMusic} 
        >>
    >>
      \layout {
        \context {
            \Score
                \omit BarNumber
        }
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
        \tempo 4 = 180
    }
}





