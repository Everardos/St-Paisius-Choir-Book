\version "2.24.4"

keyTime = { \key f \major}



cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

cadenzaSection = {
    \cadenzaMeasure
    \section
}

numberBreak = {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
}

A-Amen-S = {c''2( a4 f g1) f2\fermata \cadenzaSection}
A-Amen-A = {f'1( e) c2 \cadenzaSection}
A-Amen-T = {a2( c~ c1) a2\fermata \cadenzaSection}
A-Amen-B = {f2.( a4 c2 bes,2) << f2 f'2>> \cadenzaSection}
A-Amen-Lyrics = \lyricmode {A -- men.}

A-Kyrie-S = {a2( g4 bes a8) f g4 f2\fermata \cadenzaMeasure}
A-Kyrie-A = {f1~ f8 f e4 c2 \cadenzaMeasure}
A-Kyrie-T = {c2( d c8) a bes4 a2\fermata \cadenzaMeasure} 
A-Kyrie-B = {f2(bes,2 c8) c c4 <<f2 f,2>> \cadenzaMeasure}
A-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy. }

B-Kyrie-S ={a2( bes4 a g8) a g4 f2\fermata \cadenzaMeasure}
B-Kyrie-A ={f1( e8) e e4 c2 \cadenzaMeasure}
B-Kyrie-T ={c2( d4 c4.) c8 bes4 a2\fermata  \cadenzaMeasure}
B-Kyrie-B ={f'2( bes,4 c4.) c8 c4 <<f2 f,2>> \cadenzaMeasure}
B-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

C-Kyrie-S = {a2( bes4 g c2) a8([ f]) g4 f2\fermata \cadenzaMeasure}
C-Kyrie-A = {f1~ f2 f4 e f2 \cadenzaMeasure}
C-Kyrie-T = {c2( d4 bes a2) c8([ a]) bes4 a2\fermata \cadenzaMeasure}
C-Kyrie-B = {f'1~ f2 f4 c <<f2 f,2>> \cadenzaMeasure}
C-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

D-Kyrie-S = {a4( c d2 c) a8([ f]) g4 f2\fermata \cadenzaMeasure}
D-Kyrie-A = {f1~ f2 f4 e c2 \cadenzaMeasure}
D-Kyrie-T = {c4( a bes2 a) c8([ a]) bes4 c2\fermata \cadenzaMeasure}
D-Kyrie-B = {f'2( bes,2 f') f4 c <<f2 f,2>> \cadenzaMeasure}
D-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

E-Kyrie-S = {f4( a bes) c d2 c\fermata \cadenzaMeasure}
E-Kyrie-A = {f2( g4) f4 f2 f \cadenzaMeasure}
E-Kyrie-T = {a4( c bes) a bes2 a\fermata \cadenzaMeasure}
E-Kyrie-B = {f'2. f4 bes,2 <<f2 f'2>> \cadenzaMeasure}
E-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

F-Kyrie-S = {c2( d4) f e8([ c] d4) c2\fermata \cadenzaMeasure}
F-Kyrie-A = {f2. f4 f2 f \cadenzaMeasure}
F-Kyrie-T = {a4( c bes) d d( bes) a2\fermata \cadenzaMeasure}
F-Kyrie-B = {f4( a bes) <<bes bes,>> <<bes'2 bes,2>> <<f' f,>> \cadenzaMeasure}
F-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

G-Kyrie-S = {c4( a8[ f] bes2) a8([ f]) g4 f2\fermata \cadenzaMeasure}
G-Kyrie-A = {f1 f4 e c2 \cadenzaMeasure}
G-Kyrie-T = {a4( c8[ a] d2) c8([ a]) bes4 a2\fermata \cadenzaMeasure}
G-Kyrie-B = {f'2 bes,2 c4 c <<f2 f,2>> \cadenzaMeasure}
G-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}




SopMusic    = \relative { \numberBreak \cadenzaOn
    \A-Amen-S
    \A-Kyrie-S
    \B-Kyrie-S
    \C-Kyrie-S
    \D-Kyrie-S
    \E-Kyrie-S
    \F-Kyrie-S
    \G-Kyrie-S

}

AltoMusic   = \relative { \numberBreak \cadenzaOn
    \A-Amen-A
    \A-Kyrie-A
    \B-Kyrie-A
    \C-Kyrie-A
    \D-Kyrie-A
    \E-Kyrie-A
    \F-Kyrie-A
    \G-Kyrie-A

}

TenorMusic  = \relative { \numberBreak \cadenzaOn
    \A-Amen-T
    \A-Kyrie-T
    \B-Kyrie-T
    \C-Kyrie-T
    \D-Kyrie-T
    \E-Kyrie-T
    \F-Kyrie-T
    \G-Kyrie-T

}

BassMusic   = \relative { \numberBreak \cadenzaOn
    \A-Amen-B
    \A-Kyrie-B
    \B-Kyrie-B
    \C-Kyrie-B
    \D-Kyrie-B
    \E-Kyrie-B
    \F-Kyrie-B
    \G-Kyrie-B
}

VerseOne = {
    \A-Amen-Lyrics
    \A-Kyrie-Lyrics
    \B-Kyrie-Lyrics
    \C-Kyrie-Lyrics
    \D-Kyrie-Lyrics
    \E-Kyrie-Lyrics
    \F-Kyrie-Lyrics
    \G-Kyrie-Lyrics

}



\score {
    \new ChoirStaff <<
        \new Staff \with {instrumentName = \markup {
            \right-column {
                \line { "S" }
                \line { "A" }
            }
        }}
        \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
        >>
        \new Staff \with {instrumentName = \markup {
            \right-column {
                \line { "T" }
                \line { "B" }
            }
        }}
        \with {midiInstrument = "choir aahs"} <<          
            \clef "bass"
            \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusic}
            \new Voice = "Bass" { \voiceTwo \BassMusic} 
        >>
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
    }
    \midi {
        \tempo 4 = 180
    }
}
