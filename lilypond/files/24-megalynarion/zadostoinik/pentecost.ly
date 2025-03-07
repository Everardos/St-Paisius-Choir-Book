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
    f'4( e) f2 e d \cadenzaMeasure
    d4 d d g2 f4 e f2 f2. \cadenzaMeasure
    g4 g2 \break g4 g g f g a2 f2. \cadenzaMeasure
    f4 \hideNotes f f f \unHideNotes f e f e d2 \cadenzaMeasure
    d4 d g2 g4 f2 e f1 \cadenzaMeasure
    g2 f4( g) a2 f4 f1 \cadenzaMeasure
    f4 f f \break f f f g2 f4 f e1 \cadenzaMeasure \fine
}


BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4( c) f2 c d \cadenzaMeasure
    d4 d d c2 c4 c f2 f2. \cadenzaMeasure
    c4 c2 c4 c c c c f2 f2. \cadenzaMeasure
    f4 \hideNotes f f f \unHideNotes f c f c d2 \cadenzaMeasure
    d4 d c2 c4 f2 c f1 \cadenzaMeasure
    c2 c f f4 f1 \cadenzaMeasure
    f4 f f f f f e2 f4 f c1 \cadenzaMeasure
}


VerseOne = \lyricmode {
    Re -- joice, O Queem, 
    glo -- ry of moth -- ers and vir -- gins.
    No mouth, how -- ev -- er sweet or flu -- ent,
    is eloquent enough to praise the wor -- thi -- ly.
    Ev -- ery mind is o -- ver -- awed
    by thy __ child -- bear -- ing.
    There -- fore with one voice we glo -- ri -- fy thee.
    }



\score {
    \header {
        piece = \markup {\large \italic "Pentecost, Tone 4"}
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





