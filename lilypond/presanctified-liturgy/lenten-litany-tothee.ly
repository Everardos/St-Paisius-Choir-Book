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
    bes'2 bes4( a bes c bes2) a g1 \cadenzaMeasure \section
}

AltoMusic = \relative { 
    \cadenzaOn
    g'2 g4( f g a g2) f e1 \cadenzaMeasure \section
}

TenorMusic = \relative { 
    \cadenzaOn
    c'2 c1. c2 c1 \cadenzaMeasure \section
}


BassMusic   = \relative {
    \cadenzaOn
    c2 c1( e2) f c1 \cadenzaMeasure \section    
}



VerseOne = \lyricmode {
    To Thee, __ O Lord.
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





