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
    b'2 a4 a a( g) fis( g) a2 \cadenzaMeasure
    a4 \hideNotes a a a a a \unHideNotes a g a \break b2 a g1 \cadenzaMeasure \section
    g4 a b2 a4 \hideNotes a a a a \unHideNotes a g fis g a1 \cadenzaMeasure
    g4 g a b2 a4 g \hideNotes g g g \unHideNotes g fis g a( g fis) g a1 \cadenzaMeasure
    b4 \hideNotes b b b b b b b \unHideNotes b a b( c b2) a1 \cadenzaMeasure
    a4 a \break a a a2 fis4 g( a g) fis e1 \cadenzaMeasure
    a4 a a a2 a4 a a \break a( g fis) g a2. \cadenzaMeasure
    a4 \hideNotes a a a a a a \unHideNotes a g a \break b2 a4 a g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    g'2 d4 d d2 d d \cadenzaMeasure
    d4 \hideNotes d d d d d \unHideNotes d d d g2 d g1 \cadenzaMeasure
    g4 g g2 d4 \hideNotes d d d d \unHideNotes d d d d d1 \cadenzaMeasure
    g4 g g g2 d4 g \hideNotes g g g \unHideNotes g d d d2. d4 d1 \cadenzaMeasure
    g4 \hideNotes g g g g g g g \unHideNotes g g g1 d \cadenzaMeasure
    d4 d d d d2 d4 g( fis g) d e1 \cadenzaMeasure
    d4 d d d2 d4 d d d2. d4 d2. \cadenzaMeasure
    d4 \hideNotes d d d d d d \unHideNotes d d d g2 d4 d g1 \cadenzaMeasure
}

VerseOne = \lyricmode {
    Mag -- ni -- fy, O __ my __ soul,
    her who is greater in hon -- or than the hosts on high.
    Ev -- ery tongue is at a loss to praise thee as is due:
    e -- ven a spir -- it from the world above is filled with diz -- zi -- ness,
    when it seeks to sing thy praises, O The -- o -- to -- kos.
    But since thou art good, ac -- cept __ our faith:
    Thou know -- est well our love in -- spired __ by God,
    for thou art the Protrectress of Chris -- tians and we mag -- ni -- fy thee.
    }



\score {
    \header {
        piece = \markup {\large \italic "Jan. 6: Theophany, Tone 2"}
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





