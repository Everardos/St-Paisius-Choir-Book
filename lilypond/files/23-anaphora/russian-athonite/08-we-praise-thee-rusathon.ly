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
    
    a'2.( g4 bes a g) f( e d8[ cis] e2) d2. \cadenzaMeasure
    a'2.( g4 bes a g f e) g( f8[ e] f4. e8) d2. \cadenzaMeasure
    c4 f( e) f( g) a g bes( a g) a8( bes4 a8) a2. \cadenzaMeasure
    a4 d d c c d4. c8 bes bes( a1) \cadenzaMeasure
    a8 a a4( g8) f4 g a4. \cadenzaMeasure
    bes2 g a2. \cadenzaMeasure
    d4 e f4.( e8 g2 f4 e d2 a4. g8) bes4( c) bes( a) g( f e) \cadenzaMeasure
    a2 a2 d,1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn

    d'1~ d2. d2( a2.) d \cadenzaMeasure
    d1.~ d2. a1 d2. \cadenzaMeasure
    c4 c2 c f4 f f2. f2 f2. \cadenzaMeasure
    f4 bes bes f f f4. f8 f f( f2 d2) \cadenzaMeasure
    d8 d d4. d4 d d4. \cadenzaMeasure
    bes'2 d, d2. \cadenzaMeasure
    d4 d d\breve( a'4. g8) g2 g g4( f e) \cadenzaMeasure
    a,2 a d1 \cadenzaMeasure \fine

}

VerseOne = \lyricmode {
    We __ praise __ Thee,
    we __ bless __ Thee,
    we give thanks un -- to Thee, __ O __ Lord;
    And we pray un -- to Thee, O our God.
    And we pray __ un -- to Thee,
    O our God.
    And we pray __ un -- to __ Thee, __
    O our God.
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





