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
    f'4 \hideNotes f f f f \unHideNotes f e f( e) d2. \cadenzaMeasure
    f4 \hideNotes f f \unHideNotes f \break g2 f4 f e1 \cadenzaMeasure \section

    f4 f e f( e) d2 \cadenzaMeasure
    g4 g g g f2 \break e f2. \cadenzaMeasure
    g4 g g g2 f4 g a2 f \cadenzaMeasure
    f4 f f e f( e) d2 \cadenzaMeasure
    d4 g \hideNotes g g g g \unHideNotes g f e f2 f \cadenzaMeasure
    g4 g g2. g4 a2 f1 \cadenzaMeasure
    f2 f4 \hideNotes f f f f f f \unHideNotes f g2 f e1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 \hideNotes f f f f \unHideNotes f c f( c) d2. \cadenzaMeasure
    f4 \hideNotes f f \unHideNotes f e2 f4 f c1 \cadenzaMeasure

    f4 f c f( c) d2 \cadenzaMeasure
    c4 c c c f2 c f2. \cadenzaMeasure
    c4 c c c2 c4 c f2 f \cadenzaMeasure
    f4 f f c f( c) d2 \cadenzaMeasure
    d4 c \hideNotes c c c c \unHideNotes c c c f2 f \cadenzaMeasure
    c4 c c2. c4 f2 f1 \cadenzaMeasure
    f2 f4 \hideNotes f f f f f f \unHideNotes f e2 f c1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    O earth, announce good tid -- ings of great joy:
    ye heavens, praise the glo -- ry of God.
    Let no pro -- fane __ hand
    touch the liv -- ing Ark of God
    but let the lips of the faith -- ful,
    sing -- ing with -- out ceas -- ing the words of the Angel to the The -- o -- to kos,
    cry a -- loud in great joy:
    Hail! Thou blessed and ever "- Virgin" who gav -- est birth to God.
    }



\score {
    \header {
        piece = \markup {\large \italic "Mar. 25: Annunciation, Tone 4"}
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





