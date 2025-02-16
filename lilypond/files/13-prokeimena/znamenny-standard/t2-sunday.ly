\version "2.24.4"




keyTime = { \key g \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    g'4 \hideNotes g g \unHideNotes g a a a a \cadenzaMeasure \bar "!"
    a a a a a( g fis g) a2 \break
    a2 g1( fis2 g2. fis4 e g fis2. e4) e1 \cadenzaMeasure \fine
    
}

BassMusic   = \relative {
    \cadenzaOn
    d'4 \hideNotes d d \unHideNotes d d d d d \cadenzaMeasure \bar "!"
    d4 d d d d1 d2
    d2 g1( d2 g2. d4 e d d2. e4) e1 \cadenzaMeasure \fine
}



VerseOne = \lyricmode {
    The Lord is my strength and my song,
    and he is be -- come __ my
    sal -- va -- tion.
    }


\score {
    \new Staff % \with {midiInstrument = "choir aahs"} 
    <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass" { \voiceTwo \BassMusic }
        \new Lyrics \lyricsto "Sop" { \VerseOne }
    >>

    \layout {
        ragged-last = ##t
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





