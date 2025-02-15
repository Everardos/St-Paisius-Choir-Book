\version "2.24.4"




keyTime = { \key f \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    f'4( g a2 g4. f8 g4 a g f8[ e] f4) g a2 a \cadenzaMeasure
    g4( f8[ g] a4) g f4.( g8 f4) e4 f2 g a4.( g8 a4 bes) \cadenzaMeasure
    c2.( d4 c8[ bes] a4 bes2) bes8([ a]) g4 a2 \cadenzaMeasure
    a8([ bes] c4 bes a) g4.( a8 g4 f8[ e] f2) g4 g a2 a \cadenzaMeasure

    a2 g4 fis g a bes4.( a8 bes4 a8[ g] a4) a \cadenzaMeasure
    g4( a) g4( f e) f g a g1 f1 \cadenzaMeasure
    f4( g a2 g4. f8 g4 a g f8[ e]) f4 g a1 \cadenzaMeasure
    g2 a4 g f4.( g8 f4 e f2) g a4.( g8 a4 bes c2) \allowBreak
    
    c4 d c8([ bes] a4 bes2) bes8([ a]) g4 a2 \cadenzaMeasure
    a8([ bes] c4 bes) a g4.( a8 g4 f8[ e] f2) g4 g a1 \cadenzaMeasure
    a2 g4 fis g a bes4.( a8 bes4 a8[ g] a4) a \cadenzaMeasure
    g4( a) g( f e) f g a g1 f \cadenzaMeasure \section
    
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    f'1( c~ c2.) c4 f2 f \cadenzaMeasure
    c2( f4) c4 d2. d4 d2 c f1 \cadenzaMeasure
    f1(~ f2 bes,) bes4 d f2 \cadenzaMeasure
    f1 c( f2) f4 f f2 f \cadenzaMeasure

    f2 g4 d g f bes,4.( f'8 bes,4 c8[ d] f4) f \cadenzaMeasure
    c2 c2. c4 c c c1 f1 \cadenzaMeasure
    d1(~ d~ d2) d4 d d1 \cadenzaMeasure
    g2 d4 d d1( d2) c f1( f2)

    f4 f f2( bes,) bes4 d f2 \cadenzaMeasure
    f2( f4) f c1( f2) f4 f f1 \cadenzaMeasure
    f2 g4 d g f bes,4.( f'8 bes,4 c8[ d] f4) f \cadenzaMeasure
    c2 c2. c4 c c c1 f \cadenzaMeasure \section

}

VerseOne = \lyricmode {
    Ho -- ly, Ho -- ly, 
    Ho -- ly, Lord __ of Sa -- ba -- oth: __
    heav -- en __ and earth
    are __ full __ of Thy glo -- ry.

    Ho -- san -- na in the high -- est,
    Ho -- san -- na in the high -- est.
    Bless -- ed is He,
    bless -- ed is He __ that comes __

    in the Name __ of the Lord,
    in __ the name __ of the Lord.
    Ho -- san -- na in the high -- est,
    Ho -- san -- na in the high -- est.
    }


\score {
    \new Staff \with {midiInstrument = "choir aahs"} <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass"  { \voiceTwo \keyTime \BassMusic}

        \new Lyrics \lyricsto "Sop" { \VerseOne }
    >>
    \layout {
    \context {
        \Score
            \omit BarNumber
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)
    }
    \context {
        \Staff
            \remove Time_signature_engraver
    }
    \context {
        \Lyrics
            \override LyricSpace.minimum-distance = #1.0
    }
    }
    \midi {
        \tempo 4 = 120
    }
}





