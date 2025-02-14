\version "2.24.4"

keyTime = { \key g \major}


cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    a'2( g4 a) g fis( g) e1 \cadenzaMeasure
    g4( fis8[ g] a2 g4 a) g fis( g) e1 \cadenzaMeasure
    fis4( g) a2( fis4 g2) fis e1 \cadenzaMeasure
    e4( d e fis) g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    e'1 e4 e2 e1 \cadenzaMeasure
    e1. e4 e2 e1 \cadenzaMeasure
    e2 e2.~ e2 e2 e1 \cadenzaMeasure
    e1 e \cadenzaMeasure \fine
    
}

VerseOne = \lyricmode {
    Lord, __ have mer -- cy.
    Lord, __ have mer -- cy.
    To Thee, O Lord. __ 
    A -- men.
    }



\score {
    \new Staff
    % \with {midiInstrument = "choir aahs"} 
    <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass" { \voiceTwo \BassMusic }
        \new Lyrics \lyricsto "Sop" { \VerseOne }
    >>
        
    \layout {
        ragged-last = ##t
        \context {
            \Staff
                \remove Time_signature_engraver
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)


        }
        \context {
            \Lyrics
                \override LyricSpace.minimum-distance = #2.0
                \override LyricText.font-size = #1.5
        }
    }
    \midi {
        \tempo 4 = 180
    }
}





