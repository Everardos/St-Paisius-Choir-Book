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
    fis'4 \hideNotes fis fis \unHideNotes fis g a4.( b8 a4 g) fis2. \cadenzaMeasure
    fis4 fis fis g a4.( b8 a4 g) \break fis2. \cadenzaMeasure
    g4 \hideNotes g g g g g \unHideNotes g a b fis g a2 g fis1 \cadenzaMeasure \section
    a4 a a2 b4 b c b2 b4 a b a2. \cadenzaMeasure
    a4 a2 b4 \hideNotes b b \unHideNotes b g \break a2( g4) fis1 \cadenzaMeasure
    a4 a a2 b4 c b2 a4 b a2 \cadenzaMeasure
    b4 g a2 a4 \break a g fis1 \cadenzaMeasure
    a2 b4 \hideNotes b b b \unHideNotes b c b2 a4( b) a2 \cadenzaMeasure
    a4 a2 \break b4 \hideNotes b b b \unHideNotes b g a2( g4) fis2. \cadenzaMeasure
    b4 \hideNotes b b b \unHideNotes b \break a b fis g a2 g fis1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    d'4 \hideNotes d d \unHideNotes d d d2.( e4) b2. \cadenzaMeasure
    b4 b b e d2.( e4) b2. \cadenzaMeasure
    g'4 \hideNotes g g g g g \unHideNotes g d d d d d2 a2 d1 \cadenzaMeasure
    d4 d d2 g4 g g g2 g4 d g d2. \cadenzaMeasure
    d4 d2 g4 \hideNotes g g \unHideNotes g g d2( a4) d1 \cadenzaMeasure
    d4 d d2 g4 g g2 d4 g d2 \cadenzaMeasure
    g4 g d2 d4 d a d1 \cadenzaMeasure
    d2 g4 \hideNotes g g g \unHideNotes g g g2 d4( g) d2 \cadenzaMeasure
    d4 d2 g4 \hideNotes g g g \unHideNotes g g d2( a4) d2. \cadenzaMeasure
    g4 \hideNotes g g g \unHideNotes g d d d d d2 a d1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    O Vir -- gin The -- o -- to -- kos,
    thou hope of all Chris -- tians,
    pro -- tect, watch over, and guard all those who put their hope in thee.
    In the shad -- ow and the let -- ter of the Law,
    let us, the faithful, dis -- cern a fig -- ure:
    ev -- ery male child that o -- pens the womb
    shall be sanc -- ti -- fied to God.
    There -- fore do we magni -- fy the first -- born Word
    and Son of the Father with -- out be -- gin -- ning,
    the firstborn child of a Moth -- er who had not known man.
    }



\score {
    \header {
        piece = \markup {\large \italic "Feb. 2: Meeting of the Lord, Tone 3"}
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





