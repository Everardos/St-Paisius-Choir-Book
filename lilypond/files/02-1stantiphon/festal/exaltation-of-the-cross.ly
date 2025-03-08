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
    f'4 g a a bes2 bes a \cadenzaMeasure
    f4 g a f g2 g f \cadenzaMeasure \bar "."

    \textMark \markup { \italic \small "Refrain" }
    f4 g a2 a4 a g a bes2 a4( bes) a( g) f2 g a( g) f1 \cadenzaMeasure \bar"."

    \textMark "2."
    f4 g a a g a bes2 bes a \cadenzaMeasure
    f4 g a a f g2 f \cadenzaMeasure \section

    \stub \refrain

    \textMark "3."
    f4 g a \hideNotes a a a   a a \unHideNotes a g a bes2 a \cadenzaMeasure
    f4 g a f g2 g f \cadenzaMeasure \section

    \refrain

    \textMark "4."
    f4 a a g a \break bes2 bes4 bes4 a2 \cadenzaMeasure
    f4 a f g2 g f \cadenzaMeasure \section

    \refrain

    \textMark "5."
    f4 f f g \break a \hideNotes a a a   a a a   a \unHideNotes a g a bes2 a \cadenzaMeasure \noBreak
    f4 f g a a a \break a \hideNotes a a a \unHideNotes a f g2 g4 g f2 \cadenzaMeasure \section


}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn

    f'4 f f f bes,2 d f \cadenzaMeasure
    f4 f f f c2 c f \cadenzaMeasure

    f4 f f2 f4 f f f bes,2 f' f f d c1 f \cadenzaMeasure

    f4 f f f f f bes,2 d f \cadenzaMeasure
    f4 f f f f c2 f \cadenzaMeasure

    \stub
    \refrainBlank

    f4 f f \hideNotes f f f f f \unHideNotes f f f bes,2 f' \cadenzaMeasure
    f4 f f f c2 c f \cadenzaMeasure

    \refrainBlank

    f4 f f f f bes,2 bes4 d f2 \cadenzaMeasure
    f4 f f c2 c f \cadenzaMeasure

    \refrainBlank

    f4 f f f f \hideNotes f f f   f f f   f \unHideNotes f f f bes,2 f'2 \cadenzaMeasure
    f4 f f f f f f \hideNotes f f f \unHideNotes f f c2 c4 c f2\cadenzaMeasure 
    
}

VerseOne = \lyricmode {
    God, my God, at -- tend to me!
    Why hast Thou for -- sak -- en me?

    Through the prayers of the The -- o -- to -- kos, __ O __ Sav -- ior, save __ us.

    Why art Thou so far from help -- ing me,
    from the words of my groan -- ing?

    O my God, I cry by day, but Thou dost not an -- swer;
    and by night, but find no rest.

    Thou dwell -- est in the sanc -- tu -- ar -- y,
    the praise of Is -- ra -- el.

    Glo -- ry to the Fa -- ther and to the Son and to the Ho -- ly Spir -- it,
    both now and ever and un -- to the ag -- es of ag -- es. A -- men.
    }



\score {
    \header {
        piece = \markup {\large \italic "Sept. 14: Exaltation of the Cross"}
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





