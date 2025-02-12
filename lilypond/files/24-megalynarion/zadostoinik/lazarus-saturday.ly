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
    a'2 g4( a) b( a) g2 \cadenzaMeasure
    a4 b c \hideNotes c c c c c \unHideNotes c b c( b) \break a2 \cadenzaMeasure
    fis4 g a \hideNotes a \unHideNotes a a2 g4 a b( a) g2 \cadenzaMeasure
    b4 c b \break c b a2. \cadenzaMeasure
    c4 \hideNotes c c c c \unHideNotes c b2 a4( g) a2 a g1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    d'2 g g g \cadenzaMeasure
    g4 g c, \hideNotes c c c c c \unHideNotes c g' c,( g') a2 \cadenzaMeasure
    d,4 d d \hideNotes d \unHideNotes d d2 d4 d g2 g \cadenzaMeasure
    g4 c, g' c, g' a2. \cadenzaMeasure
    c,4 \hideNotes c c c c \unHideNotes c g'2 fis4( g) d2 d g1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    With all __ peo -- ples
    let us hon -- or and glorify the pure The -- o -- to -- kos,
    who con -- ceived within her womb the di -- vine __ Fire
    and yet was not con -- sumed;
    and let us magnify her in nev -- er -- si -- lent hymns.
    }



\score {
    \header {
        piece = \markup {\large \italic "Lazarus Saturday, Tone 8"}
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





