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
    fis'4( g) a \hideNotes a a a a \unHideNotes a g a b a g2. \cadenzaMeasure
    b4 c \hideNotes c c \unHideNotes c \break c c b c( b) a2 \cadenzaMeasure \noBreak
    fis4 g a \hideNotes a a \unHideNotes a g a b b b a g2 \cadenzaMeasure
    a4 b c c c b c c c b a2 \cadenzaMeasure
    c4 c b2 b4 a g \break a1 g \cadenzaMeasure \fine
}


BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    d'2 d4 \hideNotes d d d d \unHideNotes d d d g g g2. \cadenzaMeasure
    g4 c, \hideNotes c c \unHideNotes c c c g' c,( g') a2 \cadenzaMeasure
    d,4 d d \hideNotes d d \unHideNotes d d d g g g g g2 \cadenzaMeasure
    g4 g c, c c g' c, c c g' a2 \cadenzaMeasure
    c,4 c g'2 g4 fis g d1 g \cadenzaMeasure
}


VerseOne = \lyricmode {
    Vir -- gin -- i -- ty is a -- li -- en to moth -- er -- hood,
    and child -- bearing is a thing strange to vir -- gins:
    yet in thee, O The -- o -- to -- kos, both are to be found.
    There -- fore we and all the na -- tions of the earth
    with -- out ceas -- ing call the bless -- ed.
    }



\score {
    \header {
        piece = \markup {\large \italic "Mid-Pentecost, Tone 8"}
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





