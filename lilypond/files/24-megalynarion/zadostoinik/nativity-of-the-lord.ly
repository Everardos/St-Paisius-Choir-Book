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
    a'2 a4 a g a bes2 \cadenzaMeasure
    a4 a bes c \hideNotes c c c \unHideNotes c a \break bes2 bes4 bes2 \cadenzaMeasure
    a4 bes a2 g f1 \cadenzaMeasure
    f4 a2 a4 a a( f) \break g a bes2 bes4 bes bes bes2. \cadenzaMeasure
    bes4 c2 a4 bes2 bes2. \cadenzaMeasure
    a4 a2 a4 \break a a( g) a bes a g f1 \cadenzaMeasure
    a4( bes) c2 c4 a bes2 \cadenzaMeasure
    a4 bes \break c \hideNotes c c c c \unHideNotes c d c2 a4 bes1 \cadenzaMeasure
    a2 a4 a a( g) a( bes) a2 g f1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'2 f4 f g f bes,2 \cadenzaMeasure
    f'4 f f f \hideNotes f f f \unHideNotes f f bes,2 bes4 bes2 \cadenzaMeasure
    f'4 bes, c2 c f1 \cadenzaMeasure
    f4 f2 f4 f f2 f4 f bes,2 bes4 bes bes bes2. \cadenzaMeasure
    bes4 f'2 f4 bes,2 bes2. \cadenzaMeasure
    f'4 f2 f4 f f2 f4 bes, c c f1 \cadenzaMeasure
    f2 f f4 f bes,2 \cadenzaMeasure
    f'4 f f \hideNotes f f f f \unHideNotes f f f2 f4 bes,1 \cadenzaMeasure
    f'2 f4 f f2 f4( bes,) c2 c f1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    Mag -- ni -- fy, O my soul,
    her who is great -- er in honor and more glor -- i -- ous
    than the hosts on high.
    A strange and most won -- der -- ful mys -- t'ry do I see:
    the cave is heav -- en;
    the Vir -- gin the throne of the Cher -- u -- bim;
    the __ man -- ger a room,
    in which Christ, the God whom nothing can con -- tain, is laid.
    Him do we praise __ and __ mag -- ni -- fy.
    }



\score {
    \header {
        piece = \markup {\large \italic "Dec. 25: Nativity of the Lord, Tone 1"}
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





