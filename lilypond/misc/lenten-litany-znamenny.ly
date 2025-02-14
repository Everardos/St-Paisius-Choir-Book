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
    g'2( a4) g4 fis2 e1 \cadenzaMeasure
    g4( fis8[ g] a4.) g8 fis2 e1 \cadenzaMeasure
    g2 a4 g fis2( e1) \cadenzaMeasure
    e4( fis) g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    e'2( d4) d d2 e1 \cadenzaMeasure
    e2( d4.) d8 b2 e1 \cadenzaMeasure
    e2 d4 d b2( e1) \cadenzaMeasure
    e2 e1 \cadenzaMeasure \fine
    
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





