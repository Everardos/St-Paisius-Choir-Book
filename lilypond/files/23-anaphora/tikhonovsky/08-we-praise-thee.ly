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
    f'4( d) e2 f1 \cadenzaMeasure
    f4( g) a2( g4 a bes2) a1 \cadenzaMeasure
    a4 a d2( c4 bes a1) g4( a) a( g) f1 \cadenzaMeasure

    f2 d e2. e4 f1 \cadenzaMeasure
    f4( g) a2( g4 bes a g f2) g2 a \cadenzaMeasure
    a4 a bes( a g a bes c bes a g2 a g1 f) \cadenzaMeasure \fine
    
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn \arpeggioBracket
    d'2 c f1 \cadenzaMeasure
    d2 c( bes4 a g2) < f f'>1\arpeggio \cadenzaMeasure
    f'4 f <bes bes,>2( <a a,>4 <g g,> f1) g2 g f1 \cadenzaMeasure

    d2 d c2. c4 f1 \cadenzaMeasure
    f2 f( g1 f2) f f \cadenzaMeasure
    f4 f g\breve(~ g2 f g1 f) \cadenzaMeasure \fine
    

}

VerseOne = \lyricmode {
    We __ praise Thee,
    we __ bless __ Thee,
    we give thanks __ un -- to __ Thee,

    and we pray to Thee,
    we __ pray __ to Thee,
    O our God. __
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





