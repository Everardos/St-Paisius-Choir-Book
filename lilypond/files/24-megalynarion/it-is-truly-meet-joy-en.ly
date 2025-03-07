

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    e'4 e g2 g4 \hideNotes g g g g g \unHideNotes g e a4.( b8 g4 fis) e2 \cadenzaMeasure
    g4 g a \hideNotes a a a a \unHideNotes a fis g b a g fis( g2) \cadenzaMeasure
    e4 g2 g4 g g e a4.( b8 g4) fis e2 \cadenzaMeasure
    g4 g a \hideNotes a a a a a a \unHideNotes a fis g( b a) g fis( g2) \cadenzaMeasure
    e4 e e g2 g4 \hideNotes g g g \unHideNotes g e a4.( b8 g4) fis e2 \cadenzaMeasure
    a4 \hideNotes a a a \unHideNotes a b a2 g4 g fis1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
    e'4 e e2 e4 \hideNotes e e e e e \unHideNotes e e a,2( b) e \cadenzaMeasure
    e4 e d \hideNotes d d d d \unHideNotes d d g g g g d( g2) \cadenzaMeasure
    e4 e2 e4 e e e a,2( b4) b e2 \cadenzaMeasure
    e4 e d \hideNotes d d d d d d \unHideNotes d d g2. g4 d( g2) \cadenzaMeasure
    e4 e e e2 e4 \hideNotes e e e \unHideNotes e e a,2( b4) b e2 \cadenzaMeasure
    d4 \hideNotes d d d \unHideNotes d g fis2 g4 b, d1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    It is tru -- ly meet to bless thee, O The -- o -- to -- kos,
    ev -- er bles -- sed and most pure and the Mo -- ther of our God.
    More hon -- 'ra -- ble than the Che -- ru -- bim,
    and more glo -- ri -- ous be -- yond com -- pare than the Se -- ra -- phim:
    with -- out cor -- rup -- tion thou gav -- est birth to God the Word:
    True The -- o -- to -- kos we mag -- ni -- fy thee!
    }



\score {
    \new Staff
    \with {midiInstrument = "choir aahs"} <<
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





