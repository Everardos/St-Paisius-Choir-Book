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
    \cadenzaOn
    g'4 g f4 g a( g f g) a2 \cadenzaMeasure \section
}

BassMusic   = \relative {
    \cadenzaOn
    c'4 c d4 c f( c d c ) f2 \cadenzaMeasure \section
}



VerseOne = \lyricmode {
    Гос -- по -- ди по -- ми -- луй.
    }

VerseTwo = \lyricmode {
    Gos -- po -- di po -- mi -- luy.
    }
VerseThree = \lyricmode {
    \override LyricText.font-name = #"EB Garamond, Semi-Bold Italic"
    \override LyricText.font-size = #'-1
    Lord, _ _ have mer -- cy.

}


\score {
    \new Staff <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass" { \voiceTwo \BassMusic }
        \new Lyrics \lyricsto "Sop" { \VerseOne }
        \new Lyrics \lyricsto "Sop" { \VerseTwo }
        \new Lyrics \lyricsto "Sop" { \VerseThree }
    >>

    \layout {
        \context {
            \Score
                \omit BarNumber
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)

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





