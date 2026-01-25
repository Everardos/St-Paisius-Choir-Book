\version "2.24.4"

keyTime = { \key g \major}


cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

SopMusic    =   \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \cadenzaOn
    g'4 a b2( c) a4 \hideNotes a1 \unHideNotes a4 b g2( fis4 a g fis) e1 \cadenzaMeasure \section
}


BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \cadenzaOn
    g'4 g g2( c,) d4 \hideNotes d1 \unHideNotes d4 d g2( d2. b4) e1 \cadenzaMeasure
    
}

VerseOne = \lyricmode {
    Al -- le -- lu -- ia, Alleluia, Al -- le -- lu -- ia.
}


\score {
    \new Staff
    \with {midiInstrument = "choir aahs"} 
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
        \context {
            \Score
            forbidBreakBetweenBarLines = ##f
        }
    }
    \midi {
        \tempo 4 = 180
    }
}





