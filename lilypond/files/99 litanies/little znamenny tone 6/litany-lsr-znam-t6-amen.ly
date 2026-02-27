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
    a'2.( g4) f2( g a1)\cadenzaMeasure \fine
}

BassMusic   = \relative {
    \cadenzaOn
    f'2.( c4) d2( c f1) \cadenzaMeasure \fine
}



VerseOne = \lyricmode {
    А -- минь. __
    }

VerseTwo = \lyricmode {
    A -- min. __
    }
VerseThree = \lyricmode {
    \override LyricText.font-name = #"EB Garamond, Semi-Bold Italic"
    \override LyricText.font-size = #'-1
    A -- men. __
    
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





