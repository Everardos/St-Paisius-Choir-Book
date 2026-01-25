\version "2.24.4"

keyTime = { \key f \major}


cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

SopMusic    =   \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \cadenzaOn
    f'4 g a2 g4( f) e( f) g2 \cadenzaMeasure
    f4 f g a2 g4 f \hideNotes f f f f f f \unHideNotes f g( f) e f g2 \cadenzaMeasure
    a4 \hideNotes a a a a a \unHideNotes a g a( bes) a2 g2 \cadenzaMeasure
    g4 \hideNotes g \unHideNotes g f g a2 g f1 \cadenzaMeasure \fine

}


BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \cadenzaOn
    
    f'4 f f2 c c c \cadenzaMeasure
    f4 f f f2 f4 f \hideNotes f f f f f f \unHideNotes f c2 c4 c c2 \cadenzaMeasure
    f4 \hideNotes f f f f f \unHideNotes f f f2 f c \cadenzaMeasure
    c4 \hideNotes c \unHideNotes c f f f2 c f1 \cadenzaMeasure
}

VerseOne = \lyricmode {
    Let us sing to __ the __ Lord!
    By His di -- vine com -- mand He dried up the raging and im -- pas -- si -- ble sea,
    and led the people of Is -- ra -- el through on foot,
    for gloriously hath He been glo -- ri -- fied.
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





