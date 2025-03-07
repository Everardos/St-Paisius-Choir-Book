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
    a'4( f) g a bes2 bes \cadenzaMeasure
    a4 bes c2 bes2. \cadenzaMeasure
    a4 a a g bes a2( g) \break f1 \cadenzaMeasure \section

    f4 f g a2 a4 f g( a) bes2. \cadenzaMeasure
    a4 a bes c2 c4 c \break c a bes2. \cadenzaMeasure
    a4 a2 a4 f g( a) bes2 bes2. \cadenzaMeasure
    a4 a2 g4 bes a g \break f2. \cadenzaMeasure %life

    a4 a bes c2 bes \cadenzaMeasure
    a4 a a bes c \hideNotes c \unHideNotes c d c2 c4 a \break bes1 \cadenzaMeasure
    a4 \hideNotes a a \unHideNotes a a2 g4 bes a2 g f1 \cadenzaMeasure \fine
}


BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'2 f4 f bes,2 bes \cadenzaMeasure
    f'4 f f2 bes,2. \cadenzaMeasure
    f'4 f f f bes, c1 f \cadenzaMeasure \section

    f4 f f f2 f4 f f2 bes,2. \cadenzaMeasure
    f'4 f f f2 f4 f f f bes,2. \cadenzaMeasure
    f'4 f2 f4 f f2 bes,2 bes2. \cadenzaMeasure
    f'4 f2 f4 bes, c c f2. \cadenzaMeasure

    f4 f f f2 bes, \cadenzaMeasure
    f'4 f f f f \hideNotes f \unHideNotes f f f2 f4 f bes,1 \cadenzaMeasure
    f'4 \hideNotes f f \unHideNotes f f2 f4 bes, c2 c f1 \cadenzaMeasure \fine
}


VerseOne = \lyricmode {
    All __ gen -- er -- a -- tions
    call thee bless -- ed,
    O on -- ly The -- o -- to -- kos.
    In thee, O Vir -- gin with -- out __ spot,
    the bounds of na -- ture are o -- ver -- come:
    for child -- birth re -- mains vir -- gin
    and death is be -- trothed to life.
    O The -- o -- to -- kos, 
    Vir -- gin af -- ter child -- bearing and a -- live af -- ter death,
    do thou ev -- er save thine in -- her -- i -- tance.
    }



\score {
    \header {
        piece = \markup {\large \italic "Aug. 15: Dormition, Tone 1"}
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





