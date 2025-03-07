\version "2.24.4"

keyTime = { \key f \major}


cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'2 f4 e f e d2. \cadenzaMeasure
    f4 \hideNotes f f f f \unHideNotes f g2( f) e1 \cadenzaMeasure \section

    f4 \hideNotes f \unHideNotes f e f e d2 \cadenzaMeasure
    g4 g f2 e4 e f1 \cadenzaMeasure
    g4 \break g g g2( f4) g a2 f4 f f2. \cadenzaMeasure
    f4 f e f f f e \break d1 \cadenzaMeasure
    f4 \hideNotes f f f   f f f   f \unHideNotes f g2( f) e1 \cadenzaMeasure \fine
}


BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'2 f4 c f c d2. \cadenzaMeasure
    f4 \hideNotes f f f f \unHideNotes f e2( f) c1 \cadenzaMeasure

    f4 \hideNotes f \unHideNotes f c f c d2 \cadenzaMeasure
    c4 c f2 c4 c f1 \cadenzaMeasure
    c4 c c c2. c4 f2 f4 f f2. \cadenzaMeasure
    f4 f c f f f c d1 \cadenzaMeasure
    f4 \hideNotes f f f  f f f  f \unHideNotes f e2( f) c1 \cadenzaMeasure \fine
}


VerseOne = \lyricmode {
    Mag -- ni -- fy, O my soul,
    the Lord Who was transfigured on Ta -- bor.
    Thy birthgiv -- ing was un -- de -- filed:
    God came forth from thy womb,
    and He ap -- peared __ on earth wear -- ing flesh
    and made His dwell -- ing a -- mong men;
    there -- fore we all magnify thee, O The -- o -- to -- kos.
    }



\score {
    \header {
        piece = \markup {\large \italic "Aug. 6: Transfiguration, Tone 4"}
    }
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





