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

A-Kyrie-S = {a2( g4) bes a8([ f] g4) f2\fermata \cadenzaSection}
A-Kyrie-A = {f2. f4  f4( e4) c2 \cadenzaSection}
A-Kyrie-T = {c2( d4) d c8([ a] bes4) a2\fermata \cadenzaSection} 
A-Kyrie-B = {f2(bes,4) bes c2 <<f2 f,2>> \cadenzaSection}
A-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy. }

B-Kyrie-S ={a2( bes4) a g8( a g4) f2\fermata \cadenzaSection}
B-Kyrie-A ={f2. f4 e2 c2 \cadenzaSection}
B-Kyrie-T ={c2( d4) c4 c( bes) a2\fermata  \cadenzaSection}
B-Kyrie-B ={f'2( bes,4) c4 c2 <<f2 f,2>> \cadenzaSection}
B-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

C-Kyrie-S = {a2( bes4 g c2) a8([ f]) g4 f2\fermata \cadenzaSection}
C-Kyrie-A = {f1~ f2 f4 e f2 \cadenzaSection}
C-Kyrie-T = {c2( d4 bes a2) c8([ a]) bes4 a2\fermata \cadenzaSection}
C-Kyrie-B = {f'1~ f2 f4 c <<f2 f,2>> \cadenzaSection}
C-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

D-Kyrie-S = {a4( c d2 c) a8([ f]) g4 f2\fermata \cadenzaSection}
D-Kyrie-A = {f1~ f2 f4 e c2 \cadenzaSection}
D-Kyrie-T = {c4( a bes2 a) c8([ a]) bes4 c2\fermata \cadenzaSection}
D-Kyrie-B = {f'2( bes,2 f') f4 c <<f2 f,2>> \cadenzaSection}
D-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

E-Kyrie-S = {f4( a bes) c d2 c\fermata \cadenzaSection}
E-Kyrie-A = {f2( g4) f4 f2 f \cadenzaSection}
E-Kyrie-T = {a4( c bes) a bes2 a\fermata \cadenzaSection}
E-Kyrie-B = {f'2. f4 bes,2 <<f2 f'2>> \cadenzaSection}
E-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

F-Kyrie-S = {c2( d4) f e8([ c] d4) c2\fermata \cadenzaSection}
F-Kyrie-A = {f2. f4 f2 f \cadenzaSection}
F-Kyrie-T = {a4( c bes) d d( bes) a2\fermata \cadenzaSection}
F-Kyrie-B = {f4( a bes) <<bes bes,>> <<bes'2 bes,2>> <<f' f,>> \cadenzaSection}
F-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

G-Kyrie-S = {c4( a8[ f] bes2) a8([ f]) g4 f2\fermata \cadenzaSection}
G-Kyrie-A = {f1 f4 e c2 \cadenzaSection}
G-Kyrie-T = {a4( c8[ a] d2) c8([ a]) bes4 a2\fermata \cadenzaSection}
G-Kyrie-B = {f'2 bes,2 c4 c <<f2 f,2>> \cadenzaSection}
G-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

H-Kyrie-S = {f'4( d8[ f] c[ d] c4 f,8[ a c d] c2) \cadenzaMeasure c8([ bes c a]) bes([ g a bes] a[ f] g4) f2\fermata \cadenzaSection }
H-Kyrie-A = {a'4( bes a8[ bes] a4 f a8[ bes] g2) \cadenzaMeasure a8([ g a f]) f2.( e4) c2 \cadenzaSection}
H-Kyrie-T = {c4( bes8[ d] c[ bes] c4 a8[ c] f4 e2) \cadenzaMeasure f2 d( c8[ a] bes4) a2\fermata \cadenzaSection}
H-Kyrie-B = {f'1~( f4. bes,8 c2) \cadenzaMeasure f2 bes,( c) <<f f,>> \cadenzaSection}
H-Kyrie-Lyrics = \lyricmode {Lord __ have __ mer -- cy.}

I-Kyrie-S = {f4( a c) a (bes) g c2\fermata \cadenzaSection}
I-Kyrie-A = {f2. f4 f2 f \cadenzaSection}
I-Kyrie-T = {a4( c a) c d( bes) a2\fermata \cadenzaSection}
I-Kyrie-B = {f'2. f4 f2 <<f2 f,2>> \cadenzaSection}
I-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

J-Kyrie-S = {c2( d4) f e8([ c] d4) c2\fermata \cadenzaSection}
J-Kyrie-A = {f2. f4 f2 f \cadenzaSection}
J-Kyrie-T = {a4( c bes) d d( bes) a2\fermata \cadenzaSection}
J-Kyrie-B = {f'4( a bes) bes bes2 <<f f,>> \cadenzaSection}
J-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

K-Kyrie-S = {c4( a8[ f] bes2) a8([ f]) g4 f2\fermata \cadenzaSection}
K-Kyrie-A = {f1 f4 e c2 \cadenzaSection}
K-Kyrie-T = {a4( c8[ a] d2) c8([ a]) bes4 a2\fermata \cadenzaSection}
K-Kyrie-B = {f'2( bes,) c4 c <<f2 f,2>> \cadenzaSection}
K-Kyrie-Lyrics = \lyricmode {Lord __ have mer -- cy.}

ToThee-S = {f'4( e8[ d]) c4( a d8[ c]) a([ bes]) c2\fermata \cadenzaSection}
ToThee-A = {a'4.( f8) f2. f4 e2 \cadenzaSection}
ToThee-T = {c4.( bes8) c2( bes8[ c]) c([ bes]) g2\fermata \cadenzaSection}
ToThee-B = {f'4( a8[ bes]) a4( f bes8[ a]) f([ d]) c2 \cadenzaSection}
ToThee-Lyrics = \lyricmode {To __ Thee __ O __ Lord.}

B-Amen-S = {c4( a8[ f] g4 f f' e8[ c] d4 c a8[ bes c f,] g2) f2\fermata \fine}
B-Amen-A = {f2( e4 f a2 bes4 g f8[ g a f] e2 c) \fine}
B-Amen-T = {a4( c8[ a] bes4 a d f2 e4 f4. c8~ c2) a2\fermata \fine}
B-Amen-B = {f2( c4 f d c bes c f4. a8 c4 c,) <<f2 f,2>> \fine}
B-Amen-Lyrics = \lyricmode {A -- men.}





SopMusic    = \relative { \numberBreak \cadenzaOn
    \A-Amen-S
    \A-Kyrie-S
    \B-Kyrie-S
    \C-Kyrie-S
    \D-Kyrie-S
    \E-Kyrie-S
    \F-Kyrie-S
    \G-Kyrie-S
    \H-Kyrie-S
    \I-Kyrie-S
    \J-Kyrie-S
    \K-Kyrie-S
    \ToThee-S
    \B-Amen-S
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
    \H-Kyrie-A
    \I-Kyrie-A
    \J-Kyrie-A
    \K-Kyrie-A
    \ToThee-A
    \B-Amen-A
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
    \H-Kyrie-T
    \I-Kyrie-T
    \J-Kyrie-T
    \K-Kyrie-T
    \ToThee-T
    \B-Amen-T

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
    \H-Kyrie-B
    \I-Kyrie-B
    \J-Kyrie-B
    \K-Kyrie-B
    \ToThee-B
    \B-Amen-B
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
    \H-Kyrie-Lyrics
    \I-Kyrie-Lyrics
    \J-Kyrie-Lyrics
    \K-Kyrie-Lyrics
    \ToThee-Lyrics
    \B-Amen-Lyrics

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
