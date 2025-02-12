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
    a'2 a4 g( b) b a g2 \cadenzaMeasure
    c4 c b2 a4( g) a2 a4 a \break g1 \cadenzaMeasure \section
    fis4 fis g a \hideNotes a a a a \unHideNotes a g a b a g2 \cadenzaMeasure
    a4 b c b c b a2 \cadenzaMeasure
    fis4 g a \hideNotes a a a \unHideNotes a \break a g a b2 b4 a g2 \cadenzaMeasure
    a4 b c c c b c c c b \break a2. \cadenzaMeasure
    b4 c \hideNotes c c \unHideNotes c b2 a4 g a2 a g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    d'2 d4 g2 g4 g g2 \cadenzaMeasure
    c,4 c g'2 fis4( g) d2 d4 d4 g1 \cadenzaMeasure
    d4 d d d \hideNotes d d d d \unHideNotes d d d g g g2 \cadenzaMeasure
    g4 g c, g' c, g' a2 \cadenzaMeasure
    d,4 d d \hideNotes d d d \unHideNotes d d d d g2 g4 g g2 \cadenzaMeasure
    g4 g c, c c g' c, c c g' a2. \cadenzaMeasure
    g4 c, \hideNotes c c \unHideNotes c g'2 fis4 g d2 d g1 \cadenzaMeasure \fine

    
}

VerseOne = \lyricmode {
    Mag -- ni -- fy, __ O my soul,
    the most pre -- cious __ Cross of the Lord.
    O The -- o -- to -- kos, thou art a mys -- ti -- cal par -- a dise,
    who un -- tilled hast brought forth Christ.
    He has plant -- ed upon earth the life -- giv -- ing tree of the Cross:
    there -- fore at its ex -- al -- ta -- tion on this day,
    we wor -- ship Him, and thee do we mag -- ni -- fy.
    }



\score {
    \header {
        piece = \markup {\large \italic "Sept. 14: Exaltation of the Cross, Tone 8"}
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





