\version "2.24.4"

keyTime = { \key f \major}


cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

stub = {
    \hideNotes r4 \unHideNotes \cadenzaMeasure \section
}

refrain = {
    \stopStaff
     \hideNotes bes8\rest \unHideNotes
    \once \override Rest.stencil =
          #(lambda (grob)
             (grob-interpret-markup grob #{
               \markup  \italic \small "Refrain"
               #}))
    f1\rest
    % \hideNotes bes1\rest \unHideNotes
    \cadenzaMeasure
    \startStaff
    \section
}

refrainBlank = {
    \hideNotes r8 r1 \unHideNotes
    \cadenzaMeasure
}

refrainEnd = {
    \stopStaff
     \hideNotes bes8\rest \unHideNotes
    \once \override Rest.stencil =
          #(lambda (grob)
             (grob-interpret-markup grob #{
               \markup  \italic \small "Refrain"
               #}))
    f1\rest
    % \hideNotes bes1\rest \unHideNotes
    \cadenzaMeasure
}

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn

    \textMark "1."
    f'4 g a \hideNotes a a \unHideNotes a g a bes1 a2 \cadenzaMeasure
    f4 g a a f \break g2 g f \cadenzaMeasure \bar "."

    \textMark \markup { \italic \small "Refrain" }
    f4 g a2 a4 a g a bes2 a4( bes) a( g) f2 g \break a( g) f1 \cadenzaMeasure \bar"."

    \textMark "2."
    f4 f g a \hideNotes a a a a a a \unHideNotes a g a bes1 a2 \cadenzaMeasure
    a2 a4 f g2 g4 g f2 \cadenzaMeasure \section

    \refrain

    \textMark "3."
    a4 a bes1 a2 \cadenzaMeasure
    f4 a \hideNotes a \unHideNotes a \break a f g2 g f \cadenzaMeasure \section

    \refrain

    \textMark "4."
    f4 f g  a a g a bes2 bes a2 \cadenzaMeasure
    f4 g a \hideNotes a a \unHideNotes a f g2 f \cadenzaMeasure \section

    \refrain

    \textMark "5."
    f4 f f g \break a \hideNotes a a a   a a a   a \unHideNotes a g a bes1 a2 \cadenzaMeasure \noBreak
    f4 f g a a a \break a \hideNotes a a a \unHideNotes a f g2 g4 g f2 \cadenzaMeasure \section

    \refrainEnd


}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn

    %1
    f'4 f f \hideNotes f f \unHideNotes f f f bes,2( d) f \cadenzaMeasure
    f4 f f f f c2 c f \cadenzaMeasure

    %Refrain
    f4 f f2 f4 f f f bes,2 f' f f d c1 f \cadenzaMeasure

    %2
    f4 f f f \hideNotes f f f f f f \unHideNotes f f f bes,2( d) f \cadenzaMeasure
    f2 f4 f c2 c4 c f2 \cadenzaMeasure

    \refrainBlank

    %3
    f4 f bes,2( d) f \cadenzaMeasure
    f4 f \hideNotes f \unHideNotes f f f c2 c f \cadenzaMeasure

    \refrainBlank

    %4
    f4 f f  f f f  f bes,2 d f2 \cadenzaMeasure
    f4 f f \hideNotes f f \unHideNotes f f c2 f \cadenzaMeasure

    \refrainBlank

    %5
    f4 f f f f \hideNotes f f f   f f f   f \unHideNotes f f f bes,2( d) f2 \cadenzaMeasure
    f4 f f f f f f \hideNotes f f f \unHideNotes f f c2 c4 c f2\cadenzaMeasure 

    \refrainBlank
    
}

VerseOne = \lyricmode {
    I will praise Thee, O Lord, with my whole __ heart;
    I will make all Thy won -- ders known.

    Through the prayers of the The -- o -- to -- kos, __ O __ Sav -- ior, save __ us.

    In the as -- sem -- bly of the upright and in the con -- gre ga -- tion,
    great are the works of the Lord.

    They are sought __ out
    ac -- cord -- ing to all His pur -- pos -- es.

    His work is hon -- 'ra -- ble and glo -- ri -- ous,
    and His righ -- teousness en -- dures for -- ev -- er.

    Glo -- ry to the Fa -- ther and to the Son and to the Ho -- ly Spir -- it,
    both now and ev -- er and un -- to the ag -- es of ag -- es. A -- men.
    }



\score {
    \header {
        piece = \markup {\large \italic "Dec. 25: Nativity of the Lord"}
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
            \Score
            \omit BarNumber
        }
        \context {
            \Lyrics
                \override LyricSpace.minimum-distance = #1.0
                \override LyricText.font-size = #1.5
        }
    }
    \midi {
        \tempo 4 = 180
    }
}





