\version "2.24.4"

keyTime = { \key f \major}


cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

SopMusic    =   \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \cadenzaOn
    g'2( a) g4 \hideNotes g g \unHideNotes g e4 f2 f4 f e d2 \cadenzaMeasure
    f4 f f e f2 g e \cadenzaMeasure
    g2 g4 \hideNotes g g g \unHideNotes g f2 f4 f f e2 \cadenzaMeasure
    f4 f f f e2 f4 f f f  g2( f) e \cadenzaMeasure
    g2( a) g4( e) f2 f4 e d2 \cadenzaMeasure
    g4 g g g f2 e d1 \cadenzaMeasure \bar "|."

    \stopStaff

    \repeat unfold 1 {
          s1
          \bar ""
        }

    \startStaff

    \once \override Staff.KeySignature.break-visibility = #end-of-line-invisible
    \once \override Staff.Clef.break-visibility = #end-of-line-invisible


    g2( a) g4 g e f( e ) d2 \cadenzaMeasure
    f4 f f e f2( g) e \cadenzaMeasure
    g4 g2 g4 f2 f4 f e2 \cadenzaMeasure
    f4 f e2 f g f e \cadenzaMeasure
    g4 g g g f2 e d1 \cadenzaMeasure \bar "|." 
    
    \once \override Score.Clef.break-visibility = ##(#f #f #f)
    \once \override Score.KeySignature.break-visibility = ##(#f #f #f)

    \break

    \stopStaff

    \once \override TextScript.extra-offset = #'( 0 . -3.0 )
        \once \override TextScript.word-space = #1.5
        <>^\markup { \center-column { "Bring my soul out of prison: "}}


    s1 s s s s  \bar ""

    \startStaff

    \once \override Staff.KeySignature.break-visibility = #end-of-line-invisible
    \once \override Staff.Clef.break-visibility = #end-of-line-invisible
 
    g4 f e2 e4( f) g1( f4 e) f( g) e1 \cadenzaMeasure \bar "|."



}


BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \cadenzaOn
    %d'1 d4 \hideNotes d d \unHideNotes d c4 c2 c4 c c d2 \cadenzaMeasure
    %c4 c c c c2 c c \cadenzaMeasure
    %d2 d4 \hideNotes d d d \unHideNotes d c2 c4 c c c2 \cadenzaMeasure
    %c4 c c c c2 c4 c c c c1 c2 \cadenzaMeasure
    %d1 d4( c) c2 c4 c c2 \cadenzaMeasure
    %d4 d d d c2 c d1 \cadenzaMeasure
    
}

VerseOne = \lyricmode {
    Lord, __ I have cried unto Thee, hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I have cried unto Thee, hear -- ken un -- to me;
    at -- tend to the voice of my sup -- pli -- ca -- tion,
    when __ I __ cry un -- to Thee.
    Hear -- ken un -- to me, O Lord.

    Let __ my prayer be set __ forth
    as in -- cense be -- fore __ Thee,
    the lift -- ing up of my hands
    as an eve -- ning sac -- ri -- fice.
    Heark -- en un -- to me, O Lord.

    That I may con -- fess __ Thy __ name.

    Ac -- cent __ Thou our evening prayers, O Ho -- ly Lord,
    and grant us re -- mis -- sion of sins,
    as Thou art He who hath shown forth
    the Re -- sur -- rec -- tion in the world.

    Until Thou shalt re -- ward __ me.

    En -- cir -- cle Sion and em -- brace -- it, O ye peo -- ple,
    and therein give glory unto Him who hath ri -- sen from the dead;
    for He is our God who hath de -- li -- vered us
    from our i -- ni -- qui -- ties.

    O __ Lord, __ hear __ my __ voice.

    Come, __ ye peo -- ple, let us hymn and wor -- ship Christ.
    glo -- rifying His res -- ur -- rec -- tion from the dead;
    for He is our God, who hath de -- liv -- ered the world
    from the deception of the en -- e -- my.

    To the voic of my sup -- pli -- ca -- tion.

    Make mer -- ry, O ye heav -- ens!
    Trum -- pet forth, ye foun -- da -- tions of the earth!
    Cry a -- loud in gladness O ye moun -- tains!
    For, lo! Emmanu -- el hath nailed our sins to the Cross;
    He hath slain death, __ grant -- ing us life, having raised up Ad -- am,
    in that He lov -- eth man -- kind.
}


\score {
    \new Staff
    \with {midiInstrument = "choir aahs"} 
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
        \context {
            \Score
            forbidBreakBetweenBarLines = ##f
        }
    }
    \midi {
        \tempo 4 = 180
    }
}





