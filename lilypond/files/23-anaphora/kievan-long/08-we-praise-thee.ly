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
    f'4( g a2) g4.( f8 g4 a g f8[ e] f4 g) a1 \cadenzaMeasure
    g2( a4 g) f4.( g8 f4 e f2 g) a4.( g8 a4 bes) \cadenzaMeasure
    c2.( d4) c8([ bes] a4) bes2 bes8([ a]) g4 a2 \cadenzaMeasure
    a8([ bes] c4) bes a g4.( a8 g4 f8[ e] f2) g a1 \cadenzaMeasure

    g4( fis) g( a) bes4.( a8 bes4 a8[ g] a2) \cadenzaMeasure
    g4( a) g f e( f g a g2.) g4 f1 \cadenzaMeasure
    f4( g) a2 g4.( f8 g4 a g f8[ e]) f4 g a1 \cadenzaMeasure
    g2 a4 g f4.( g8 f4 e f2) g4 g a4.( g8 a4 bes) \cadenzaMeasure

    c2 c4( d) c8([ bes] a4 bes2) bes8([ a]) g4 a2 \cadenzaMeasure
    a8([ bes] c4) bes4 a g4.( a8 g4 f8[ e] f2) g4 g a1 \cadenzaMeasure
    a4 a g( fis) g a bes4.( a8 bes4 a8[ g] a2) \cadenzaMeasure
    g4( a) g f e( f g a g2) g4 g f1 \cadenzaMeasure

}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn

    f'1 c~ c f \cadenzaMeasure
    c1 d(~ d2 c) f1 \cadenzaMeasure
    f1 f2 bes, bes4 d f2 \cadenzaMeasure
    f2 f4 f c1( f2) f f1 \cadenzaMeasure

    g4( d) g( f) bes,4.( f'8 bes,4 c8[ d] f2) \cadenzaMeasure
    c2 c4 c c1( c2.) c4 f1 \cadenzaMeasure
    d2 d d1( d2) d4 d d1 \cadenzaMeasure
    g2 d4 d d1( d2) c4 c f1 \cadenzaMeasure

    f2 f f( bes,) bes4 d f2 \cadenzaMeasure
    f2 f4 f c1( f2) f4 f f1 \cadenzaMeasure
    f4 f g( d) g f bes,4.( f'8 bes,4 c8[ d] f2) \cadenzaMeasure
    c2 c4 c c1( c2) c4 c f1 \cadenzaMeasure

}

VerseOne = \lyricmode {
    We __ praise __ Thee,
    we __ bless __ Thee, __
    we __ give __ thanks un -- to Thee, 
    thanks __ un -- to Thee, __ O __ Lord,

    we __ give __ thanks, __
    thanks __ un -- to Thee, __ O Lord,
    and __ we pray __ un -- to Thee,
    pray un -- to Thee, __ O our God, __

    and we __ pray __ un -- to Thee,
    pray __ un -- to Thee, __ O our God,
    and we pray __ un -- to Thee, __
    pray __ un -- to Thee, __ O our God.
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





