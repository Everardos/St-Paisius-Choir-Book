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
    f'4 \hideNotes f f f f \unHideNotes f e f f f e d2 \cadenzaMeasure
    g4 g g g \break f2 e f f1 \cadenzaMeasure
    g2 g4 g f g a2 f \cadenzaMeasure
    f4 \hideNotes f f \unHideNotes f \break f \hideNotes f \unHideNotes f e f( e) d2 \cadenzaMeasure
    d4 g g f2 e f1 \cadenzaMeasure
    g2 f4 g \break a2. g4 f1 \cadenzaMeasure
    f4 \hideNotes f f f f f \unHideNotes f g2( f) e1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 \hideNotes f f f f \unHideNotes f c f f f c d2 \cadenzaMeasure
    c4 c c c f2 c f f1 \cadenzaMeasure
    c2 c4 c c c f2 f \cadenzaMeasure
    f4 \hideNotes f f \unHideNotes f f \hideNotes f \unHideNotes f c f( c) d2 \cadenzaMeasure
    d4 c c f2 c f1 \cadenzaMeasure
    c2 c4 c f2. f4 f1 \cadenzaMeasure
    f4 \hideNotes f f f f f \unHideNotes f e2( f) c1 \cadenzaMeasure
}

VerseOne = \lyricmode {
    The Lord is God and has re -- vealed Him -- self to us;
    let us keep the feast to -- geth -- er.
    Come, and with great re -- joic -- ing
    let us magni -- fy Christ with palms and branch -- es,
    and let us cry a -- loud:
    Bless -- ed is He that comes
    in the name of the Lord our Sav -- ior.
    }



\score {
    \header {
        piece = \markup {\large \italic "Palm Sunday, Tone 4"}
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





