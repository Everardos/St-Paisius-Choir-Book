\version "2.24.4"

% Still OCA translation

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

refrainLineEnd = {
    \stopStaff
     \hideNotes bes8\rest \unHideNotes
    \once \override Rest.stencil =
          #(lambda (grob)
             (grob-interpret-markup grob #{
               \markup  \italic \small "Refrain"
               #}))
    f1\rest
    % \hideNotes bes1\rest \unHideNotes
    \cadenzaMeasure \break
    \once \override Score.BarLine.stencil = ##f
    \startStaff
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
    f'4 f g a g a bes2 bes a \cadenzaMeasure
    f4 a a a \break a f g2 f \cadenzaMeasure \bar "."

    \textMark \markup { \italic \small "Refrain" }
    f4 g a2 a4 a g a bes2 \break a4( bes) a( g) f2 g a( g) f1 \cadenzaMeasure \bar"."

    \textMark "2."
    f4 a a a g a \break bes2 bes a \cadenzaMeasure
    a4 \hideNotes a a a a a \unHideNotes a f g2 g4 g f2 \cadenzaMeasure \section \noBreak

    \refrainLineEnd

    \textMark "3."
    f4 a a g a bes2 bes a \cadenzaMeasure
    f4 a a a f \break g2 g f \cadenzaMeasure \section

    \refrain

    \textMark "4."
    f4 a a a g a bes1 a2 \cadenzaMeasure
    f4 g a a f g2 g4 g f2 \cadenzaMeasure \section 

    \refrain

    \textMark "5."
    f4 g a g \break a bes2 bes4 bes bes a2 \cadenzaMeasure
    f4 g a a f g2 f \cadenzaMeasure \section 

    \refrainLineEnd

    \textMark "6."
    f4 f f g a \hideNotes a a a   a a a   a \unHideNotes a g a bes1 a2 \cadenzaMeasure
    f4 f g a a a a \hideNotes a a a \unHideNotes a f g2 g4 g f2 \cadenzaMeasure \section

    \refrainEnd


}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn

    %1
    f'4 f f f f f bes,2 d f \cadenzaMeasure
    f4 f f f f f c2 f \cadenzaMeasure

    %Refrain
    f4 f f2 f4 f f f bes,2 f' f f d c1 f \cadenzaMeasure

    %2
    f4 f f f f f   bes,2 d f \cadenzaMeasure
    f4 \hideNotes f f f f f \unHideNotes f f c2 c4 c f2 \cadenzaMeasure

    \refrainBlank

    %3
    f4 f f f f bes,2 d f \cadenzaMeasure
    f4 f f f f  c2 c f \cadenzaMeasure

    \refrainBlank

    %4
    f4 f f f f f bes,2( d) f \cadenzaMeasure
    f4 f f f f c2 c4 c f2 \cadenzaMeasure

    \refrainBlank

    %5
    f4 f f f   f bes,2 bes4 bes d f2 \cadenzaMeasure
    f4 f f f f c2 f \cadenzaMeasure

    \refrainBlank

    %6
    f4 f f f f \hideNotes f f f   f f f   f \unHideNotes f f f bes,2( d) f2 \cadenzaMeasure
    f4 f f f f f f \hideNotes f f f \unHideNotes f f c2 c4 c f2\cadenzaMeasure 

    \refrainBlank
    
}

VerseOne = \lyricmode {
    I love the Lord be -- cause He hath heard
    the voice of my sup -- li -- ca -- tion.

    Through the prayers of the The -- o -- to -- kos, __ O __ Sav -- ior, save __ us.

    Be -- cause He in -- clined His ear to me,
    there -- fore I will call on Him as long as I live.

    The snares of death en -- com -- passed me,
    the pangs of hell laid hold on me.

    I suf -- fered dis -- tress and an -- guish,
    so I called on the name of the Lord.

    I will walk in the pres -- ence of the Lord,
    in the land of the liv -- ing.

    Glo -- ry to the Fa -- ther and to the Son and to the Ho -- ly Spir -- it,
    both now and ev -- er and un -- to the ag -- es of ag -- es. A -- men.
    }



\score {
    \header {
        piece = \markup {\large \italic "Palm Sunday"}
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





