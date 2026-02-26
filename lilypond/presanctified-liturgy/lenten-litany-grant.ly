\version "2.24.4"

% This version has the melody in alto. Soprano is harmony.
% For melody in soprano, see alternative file.

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
    bes'2.( a4) bes2 a g1 \cadenzaMeasure
}

AltoMusic = \relative { 
    \cadenzaOn
    g'2.( f4) g2 f e1 \cadenzaMeasure
}

TenorMusic = \relative { 
    \cadenzaOn
    c'1 c2 c c1 \cadenzaMeasure
}


BassMusic   = \relative {
    \cadenzaOn
    c1 e2 f c1 \cadenzaMeasure \section
}



VerseOne = \lyricmode {
    Grant this, O Lord.
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





