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
    f'4( d) e c2( e4) d2 \cadenzaMeasure
    f4 g a a d2 c4( bes) a2 \cadenzaMeasure
    c2( bes4) a2 g4( a) bes2( a4 g2) \cadenzaMeasure
    g4 d'2 c4 bes8([ a]) c4( bes) a2 \cadenzaMeasure

    a4( bes) a( g) f( e) f g a2 a \cadenzaMeasure
    bes4( c) bes a g2 \cadenzaMeasure
    bes4( c) d( c) bes a c2 c4 bes4 a1 \cadenzaMeasure
    g4( a) bes bes a f g2( f4 g a2) f1 \cadenzaMeasure \section
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    d'2 e4 c2. d2 \cadenzaMeasure
    d4 e f f bes,2 d f \cadenzaMeasure
    f2. f2 g g2.~ g2 \cadenzaMeasure
    g4 bes2 a4 g f2 f \cadenzaMeasure
    
    d2 d d d4 e f2 f \cadenzaMeasure
    g2 g4 g g2 \cadenzaMeasure
    g2 bes, d4 d f2 f4 c f1 \cadenzaMeasure
    g2 g4 g f f bes,2( a4 g d' e) f1 \cadenzaMeasure \section
}

VerseOne = \lyricmode {
    Ho -- ly, Ho -- ly, 
    Ho -- ly, Lord of Sa -- ba -- oth:
    hea -- ven and __ earth __
    are full of Thy __ glo -- ry.

    Ho -- sa -- na in the high -- est.
    Bless -- ed is He
    that comes in the Name of the Lord.
    Ho -- sa -- na in the high -- est.
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





