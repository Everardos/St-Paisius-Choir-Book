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
    b2. a4 g2 fis4 g a1 \cadenzaMeasure
    b2 b4 c \break d2( c) b2. \cadenzaMeasure
    b4 a2 g  fis( g4 fis) e1 \cadenzaMeasure \section

    g4 a b2 a4 a a a \break a a a( g) fis g a2 \cadenzaMeasure
    g4 a b2( a4) g g g fis g a( g fis g) \break a1 \cadenzaMeasure
    b4 \hideNotes b b \unHideNotes b a2 g4 g fis2( g4) fis e1 \cadenzaMeasure \fine
}


BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    g'2 d4 d d2 d d \cadenzaMeasure
    g2. d4 g2 d4 d d1 \cadenzaMeasure
    g2 g4 g g1 g2. \cadenzaMeasure
    g4 fis2 g d( b4 d) e1 \cadenzaMeasure

    g4 g g2 d4 d d d d d d2 d4 d d2 \cadenzaMeasure
    g4 g g2( d4) g g g d d d1 d \cadenzaMeasure
    g4 \hideNotes g g \unHideNotes g fis2 g4 g d2( b4) d e1 \cadenzaMeasure \fine
}


VerseOne = \lyricmode {
    Mag -- ni -- fy, O __ my __ soul,
    Christ the Giv -- er of Life,
    Who has as -- cend -- ed from earth to heav -- en.
    We the faith -- ful mag -- ni -- fy thee,
    the Moth -- er of God,
    who be -- yond __ rea -- son and un -- der -- stand -- ing,
    gav -- est birth in time to the time -- less One.
    }



\score {
    \header {
        piece = \markup {\large \italic "Ascension, Tone 5"}
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





