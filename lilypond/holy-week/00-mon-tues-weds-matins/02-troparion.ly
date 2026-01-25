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
    g'4( a) b2( c) a4 \hideNotes a a \unHideNotes a b g2( fis4 a g fis) e2 \cadenzaMeasure
    fis4( g) a \hideNotes a a a a a a \unHideNotes a b g2( fis4 a g fis) e2 \cadenzaMeasure
    fis4 g a \hideNotes a a a a a a \unHideNotes a b g2( fis4 a g fis) e2 \cadenzaMeasure
    
    b'4 b2( c) a4 \hideNotes a a a a a a \unHideNotes a b g2( fis4 a g) fis e2 \cadenzaMeasure
    fis4 fis g a \hideNotes a a a a   a a a a   a a \unHideNotes a b g2( fis4 a g fis) e2 \cadenzaMeasure
    fis4 fis g a \hideNotes a a a a \unHideNotes a b g2( fis4 a) g fis e2 \cadenzaMeasure

    fis4 g a a a a b g2( fis4 a) g fis e1 \cadenzaMeasure
    g4 \hideNotes g g g g g g g g g g g g \unHideNotes g g2 g1 \cadenzaMeasure
    g4 \hideNotes g g g g g g \unHideNotes g g2 g4 g g1 \cadenzaMeasure

}


BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \cadenzaOn
    g'2 g( c,) d4 \hideNotes d d \unHideNotes d d g2( d2. b4) e2 \cadenzaMeasure
    d2 d4 \hideNotes d d d d d d \unHideNotes d d g2( d2. b4) e2 \cadenzaMeasure
    d4 d d \hideNotes d d d d d d \unHideNotes d d g2( d2. b4) e2 \cadenzaMeasure

    g4 g2( c,) d4 \hideNotes d d d d d d \unHideNotes d d g2( d2.) b4 e2 \cadenzaMeasure
    d4 d d d \hideNotes d d d d  d d d d  d d \unHideNotes d d g2( d2. b4) e2 \cadenzaMeasure
    d4 d d d \hideNotes d d d d \unHideNotes d d g2( d) d4 b e2 \cadenzaMeasure

    d4 d d d d d d g2( d) d4 b e1 \cadenzaMeasure
    g4 \hideNotes g g g g g g g g g g g g \unHideNotes g g2 g1 \cadenzaMeasure
    g4 \hideNotes g g g g g g \unHideNotes g g2 g4 g g1 \cadenzaMeasure
}

VerseOne = \lyricmode {
    Be -- hold, __ the Bridegroom com -- eth at mid -- night,
    and bless -- ed is the servant whom He shall find watch -- ing,
    and a -- gain unworthy is the servant whom he shall find heed -- less.

    Be -- ware, there -- fore, O my soul, do not be weighed down __ with sleep, 
    lest thou be giv -- en up to death and lest thou be shut out of the King -- dom.
    But rouse thy -- self crying: Holy, Holy, Ho -- ly art Thou, __ O our God.

    Through the The -- o -- to -- kos have mer -- cy on us.
    Glo -- ry to the Father, and to the Son, and to the Ho -- ly Spi -- rit.
    Both now and ever, and unto ages of a -- ges. A -- men.
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





