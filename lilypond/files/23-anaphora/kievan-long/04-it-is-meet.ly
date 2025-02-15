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
    f'4( g) a2 g2.( a4 g f8[ e] f4) g a1 \cadenzaMeasure
    g4( f8[ g] a4) g f4.( g8 f4 e f2) g a4.( g8 a4) bes \cadenzaMeasure
    c2.( d4 c8[ bes] a4 bes2 bes8[ a] g4 a2) a \cadenzaMeasure
    a8([ bes] c4 bes a) g4.( a8 g4 f8[ e] f2 g a) a \cadenzaMeasure

    g4( fis) g( a) bes4.( a8 bes4 a8[ g] a2) \cadenzaMeasure
    g4 a g( f e f g) a g2 f1 \cadenzaMeasure
    f4( g a2) g4.( f8 g4 a g f8[ e] f4 g a2) a4 a \cadenzaMeasure
    g4( f8[ g] a4) g f4.( g8 f4 e f2) g \cadenzaMeasure

    a4.( g8 a4 bes) c2 c4( d) c8([ bes] a4 bes2 bes8[ a] g4 a2) a \cadenzaMeasure
    a8([ bes] c4) bes a g4.( a8 g4 f8[ e] f2 g a) a4 \cadenzaMeasure
    a4 g( fis) g a bes4.( a8 bes4) a8([ g]) a4 a \cadenzaMeasure
    g4( a g f) e( f g) a g1 f \cadenzaMeasure \section
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    f'2 f c1(~ c2 f4) f f1 \cadenzaMeasure
    c2( f4) c d2~ d1 c2 f2. f4 \cadenzaMeasure
    f1(~ f2 bes,2. d4 f2) f \cadenzaMeasure
    f1 c( f~ f2) f \cadenzaMeasure

    g4( d) g( f) bes,4.( f'8 bes,4 c8[ d] f2) \cadenzaMeasure
    c4 c c1( c4) c c2 f1 \cadenzaMeasure
    d1 d2(~ d~ d1~ d2) d4 d \cadenzaMeasure
    g4( d2) d4 d1( d2) c \cadenzaMeasure

    f1 f2 f f( bes,2. d4 f2) f \cadenzaMeasure
    f2 f4 f c1( f~ f2) f4 \cadenzaMeasure
    f4 g( d) g f bes,4.( f'8 bes,4) c8([ d]) f4 f \cadenzaMeasure
    c1 c2. c4 c1 f \cadenzaMeasure \section
}

VerseOne = \lyricmode {
    It __ is meet __ and right,
    it __ is meet __ and right __ to
    wor -- ship
    the __ Fa -- ther,

    and __ the __ Son, __
    and the Ho -- ly Spi -- rit:
    the __ Trin -- i -- ty,
    one __ in es -- sence,

    and __ un -- di -- vid -- ed,
    and __ un -- di -- vid -- ed,
    the Trin -- i -- ty one __ in __ es -- sence,
    and __ un -- di -- vid -- ed.

    }


\score {
    \new Staff % \with {midiInstrument = "choir aahs"} 
    <<
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





