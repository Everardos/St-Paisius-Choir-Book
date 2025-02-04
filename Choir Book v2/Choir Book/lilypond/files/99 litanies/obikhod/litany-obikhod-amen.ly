\version "2.24.4"


keyTime = { \key f \major}

SopMusic    = \relative {a'2 a1}
AltoMusic   = \relative {f'2 f1}
TenorMusic  = \relative {c'2 c1}
BassMusic   = \relative {f2 f1}

VerseOne = \lyricmode {
    A -- men
    }
VerseTwo = \lyricmode {
    \override LyricText.font-size = #'-2
    А -- минь
    }
VerseThree = \lyricmode {
    \override LyricText.font-shape = #'italic
    \override LyricText.font-size = #'-2
    A -- min
}

\score {
    \new StaffGroup <<
        \new Staff \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic \bar "||"}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
            \new Lyrics \lyricsto "Sop" { \VerseTwo }
            \new Lyrics \lyricsto "Sop" { \VerseThree }
        >>
        \new Staff \with {midiInstrument = "choir aahs"} <<
            \clef "bass"
            \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusic \bar "||"}
            \new Voice = "Bass" { \voiceTwo \BassMusic} 
        >>
    >>
    \layout {
        \context {
            \Staff
                \remove Time_signature_engraver
                measureBarType = #'()
                forbidBreakBetweenBarLines = ##f
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
