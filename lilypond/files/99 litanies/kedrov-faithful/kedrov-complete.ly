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
    a'2( f g) a bes4( a g2) a1 \cadenzaMeasure
    a4 a bes1 a \cadenzaMeasure \section
    a2 a1 \cadenzaMeasure
    a2( f g a bes4 a g2) a1 \fine
}

AltoMusic = \relative { 
    \cadenzaOn
    f'1. f2 f1 f \cadenzaMeasure
    f4 f f1 f \cadenzaMeasure \section
    f2 f1 \cadenzaMeasure
    f\breve~ f1 f1 \fine
}

TenorMusic = \relative { 
    \cadenzaOn
    c'2( a bes) c2 d4( c bes2) c1 \cadenzaMeasure
    c4 c d1 c \cadenzaMeasure \section
    c2 c1 \cadenzaMeasure
    c2( a bes c d4 c bes2) c1 \fine
}


BassMusic   = \relative {
    \cadenzaOn
    f1. f2 f1 f \cadenzaMeasure
    f4 f f1 f \cadenzaMeasure \section
    f2 f1 \cadenzaMeasure
    f\breve~ f1 f1 \fine
    
}



VerseOne = \lyricmode {
    Lord, __ have mer -- cy.
    Lord, have mer -- cy.
    A -- men. A -- men.
    }



\score {
    \new ChoirStaff <<
        \new Staff
        \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
        >>
        \new Staff
        \with {midiInstrument = "choir aahs"} <<          
            \clef "bass"
            \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusic}
            \new Voice = "Bass" { \voiceTwo \BassMusic} 
        >>
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
        \tempo 4 = 60
    }
}





