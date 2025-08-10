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

APhraseS = {b'8\rest f8 f g( a4 g8) a([ bes a g]) a([ g f g]) g2\fermata \cadenzaMeasure}
APhraseA = {s8 c'8 c d2 e2 d2 d2 \cadenzaMeasure}
APhraseT = {d8\rest a'8 a bes2 c2 bes4( a8[ bes]) bes2\fermata \cadenzaMeasure}
APhraseB = {s8 <<f8 f,8>> <<f' f,>> <<f'2 f,2>> <<f'2 f,2>> <<f'4( f,4>> <<d'4) d,4>> <<g'2 g,2>> \cadenzaMeasure}
APhraseLyrics = \lyricmode {Bless the Lord, __ O __ my __ soul.}

BPhraseS = {b8\rest f8 f g( a4 g8) a([ bes a g]) a([ g f g]) g2\fermata \cadenzaMeasure}
BPhraseA = {s8 d8 d d2 e2 d2 d2 \cadenzaMeasure}
BPhraseT = {d8\rest a8 a bes2 a2 g4( a8[ bes]) bes2\fermata \cadenzaMeasure}
BPhraseB = {s8 <<d'8 d,8>> <<d' d,>> <<d'2 d,2>> <<c'2 c,2>> <<bes'4( bes,4>> <<d'4) d,4>> <<g'2 g,2>> \cadenzaMeasure}
BPhraseLyrics = \lyricmode {Bless -- ed art __ Thou, __ O __ Lord.}

CPhraseS = {b8\rest f8 f g( a4 g8) a([ bes a g]) a([ g f g]) g2\fermata \cadenzaMeasure}
CPhraseA = {s8 d8 d d2 e2 d2 d2 \cadenzaMeasure}
CPhraseT = {d8\rest a8 a bes2 c2 bes2 bes2\fermata \cadenzaMeasure}
CPhraseB = {s8 <<d'8 d,8>> <<d' d,>> <<d'2 d,2>> <<d'2 d,2>> <<d'4( d,4>> bes'8[ g]) g2 \cadenzaMeasure}
CPhraseLyrics = \lyricmode {Bless the Lord, __ O __ my __ soul.}

DPhraseS = {f8 f g([ f]) g([ a]) a f g([ f d c]) g'([ a g f]) f2\fermata \cadenzaMeasure}
DPhraseA = {d8 d d4 d c8 c c2 d2 d2 \cadenzaMeasure}
DPhraseT = {f8 f f4 f f8 f f2 g2 a2 \cadenzaMeasure}
DPhraseB = {bes8 bes bes4 bes <<c8 f,8>> <<c' f,>> <<c'2 f,2>> <<bes2 bes,2>> <<d'2 d,2>> \cadenzaMeasure}
DPhraseLyrics = \lyricmode {And for -- get not all His ben -- e -- fits}


EPhraseS = {f4( g8[ f]) g([ a]) a([ f g f d c]) \tuplet 3/2 {g'8([ a g])} \tuplet 3/2 {f8([d f])} f2\fermata \cadenzaMeasure}
EPhraseA = {d2 d4 c2. d4 d4 c2 \cadenzaMeasure}
EPhraseT = {bes2 bes4 a2. bes4 <<bes4 g4>> a2\fermata \cadenzaMeasure}
EPhraseB = {<<f'2 bes,2>> <<f'4 bes,4>> <<e2. a,2.>> <<f'4 bes,4>> <<f'4 f,4>> <<f'2 f,2>> \cadenzaMeasure}
EPhraseLyrics = \lyricmode {Bless the Lord, O my soul.}







SopMusic    = \relative { \numberBreak \cadenzaOn
    \APhraseS
    \BPhraseS
    \CPhraseS
    \DPhraseS
    \EPhraseS
}

AltoMusic   = \relative { \numberBreak \cadenzaOn
    \APhraseA
    \BPhraseA
    \CPhraseA
    \DPhraseA
    \EPhraseA
}

TenorMusic  = \relative { \numberBreak \cadenzaOn
    \APhraseT
    \BPhraseT
    \CPhraseT
    \DPhraseT
    \EPhraseT
}

BassMusic   = \relative { \numberBreak \cadenzaOn
    \APhraseB
    \BPhraseB
    \CPhraseB
    \DPhraseB
    \EPhraseB
}

VerseOne = {
    \APhraseLyrics
    \BPhraseLyrics
    \CPhraseLyrics
    \DPhraseLyrics
    \EPhraseLyrics
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
        \tempo 4 = 30
    }
}
