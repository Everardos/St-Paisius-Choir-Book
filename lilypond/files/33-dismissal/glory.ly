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

#(define-markup-command (ebItalic layout props text)
   (markup?)
   (interpret-markup layout props
     (markup #:override '(font-name . "EB Garamond Italic") text )))

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn

    a'4 \hideNotes a a a   a a a   a a a   a a \unHideNotes a g a2 a  \cadenzaMeasure
    a4 \hideNotes a a a   a a a   a \unHideNotes a g a2 a4 a a2  \cadenzaMeasure
    a4 \hideNotes a a a   a a \unHideNotes a g a2 a  \cadenzaMeasure
    bes2 bes a1 \cadenzaMeasure \fine
    

    %a'4 a a a2 g4 a bes2 bes4 bes a2 \cadenzaMeasure \section


}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    f'4 \hideNotes f f f   f f f   f f f  f f \unHideNotes f d f2 f \cadenzaMeasure
    f4 \hideNotes f f f   f f f   f  \unHideNotes f d f2 f4 f f2 \cadenzaMeasure
    f4 \hideNotes f f f   f f \unHideNotes f d f2 f \cadenzaMeasure
    f2 e f1 \cadenzaMeasure \fine

    %f'4 f f f2 d4 f f2 e4 e f2 \cadenzaMeasure \section

}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    c'4 \hideNotes c c c   c c c   c c c   c c  \unHideNotes c bes c2 c \cadenzaMeasure 
    c4 \hideNotes c c c   c c c   c \unHideNotes c bes c2 c4 c c2 \cadenzaMeasure 
    c4 \hideNotes c c c   c c  \unHideNotes c bes c2 c \cadenzaMeasure
    d2 c c1 \cadenzaMeasure \fine


    %c'4 c c c2 bes4 c d2 c4 c c2 \cadenzaMeasure \section
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    f4 \hideNotes f f f   f f f   f f f   f f \unHideNotes f g f2 f \cadenzaMeasure
    f4 \hideNotes f f f   f f f   f  \unHideNotes f g f2 f4 f f2 \cadenzaMeasure
    f4 \hideNotes f f f   f f  \unHideNotes f g f2 f \cadenzaMeasure
    bes,2 c f1 \cadenzaMeasure \fine

    %f4 f f f2 g4 f bes,2 c4 c f2 \cadenzaMeasure \section
}

VerseOne = \lyricmode {
    Glo -- ry to the Father, and to the Son, and to the Ho -- ly Spi -- rit,
    both now and ever and unto the a -- ges of a -- ges. A -- men.
    Lord, have mercy. Lord, have mercy. Lord, have mer -- cy.
    Fa -- ther, bless!
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





