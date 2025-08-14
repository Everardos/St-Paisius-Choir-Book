\version "2.24.4"

% This version is minor, unlike the usual version.
\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}

keyTime = { \key g \minor}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    bes'2. a4 bes2( a) g1 \cadenzaMeasure \section
    bes2.( a4) bes2 a g1 \cadenzaMeasure \section
    bes2 bes4( a bes c bes2) a g1 \cadenzaMeasure \section
    g2 a1 \fine
}

AltoMusic = \relative { 
    \cadenzaOn
    g'2. g4 f1 d \cadenzaMeasure \section
    g1 f2 f d1 \cadenzaMeasure \section
    g2 g1( f2) f e1 \cadenzaMeasure \section
    e2 f1 \fine
}

TenorMusic = \relative { 
    \cadenzaOn
    d'2. c4 d2( c) bes1 \cadenzaMeasure \section
    d2.( c4) d2 c bes1 \cadenzaMeasure \section
    d2 d4( c d ees d2) c2 c1 \cadenzaMeasure \section
    c2 c1 \fine
}


BassMusic   = \relative {
    \cadenzaOn
    g2. g4 d2( f) g1 \cadenzaMeasure \section
    g1 d2 f d1 \cadenzaMeasure \section
    g2 g1( d2) f c1 \cadenzaMeasure
    c2 f1 \fine
    
}



VerseOne = \lyricmode {
    Lord, have mer -- cy.
    Grant this, O Lord.
    To Thee, __ O Lord.
    A -- men.
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
        \tempo 4 = 120
    }
}





