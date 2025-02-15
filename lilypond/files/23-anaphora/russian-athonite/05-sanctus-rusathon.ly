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
    
    d'4. d8 f4. f8 g4 g a g f g a2 \cadenzaMeasure
    a4( bes) c d8([ e] f[ e]) d2. \cadenzaMeasure


    a4 bes( a) g f g( f) e2. \cadenzaMeasure
    e4 g( f8) e f4 g a8( bes4 a8) a2 \cadenzaMeasure
    a4 a a d d c4. c8 d4 c bes( a) g8( bes4) a8 a2. \cadenzaMeasure
    d4( e) f2( e) d2. \cadenzaMeasure
    e2 d4 cis2 d2. \cadenzaMeasure \section
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn

    d'4. d8 d4. d8 d4 d d d d d d2 \cadenzaMeasure
    d4( f) a bes2 d,2. \cadenzaMeasure
    d4 d2 d4 d d2 a2. \cadenzaMeasure
    a4 a4. a8 a4 a d2 d \cadenzaMeasure
    d4 d d bes' bes f4. f8 f4 f f2 f4. f8 f2. \cadenzaMeasure
    d2 d1 d2. \cadenzaMeasure
    e2 e4 cis2 d2. \cadenzaMeasure \section
}

VerseOne = \lyricmode {
    Ho -- ly, Ho -- ly, Ho -- ly, Lord of Sa -- ba -- oth:
    hea -- ven and __ earth
    are full __ of Thy glo -- ry.
    Ho -- san -- na in the high -- est.
    Bless -- ed is He that com -- eth in the Name of the Lord.
    Ho -- san -- na 
    in the high -- est.
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





