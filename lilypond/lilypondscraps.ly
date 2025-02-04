keyTime = { \key f \major}

SopMusic    = \relative {a'4 a4 a2 a1}
AltoMusic   = \relative {f'4 f4 f2 f1}
TenorMusic  = \relative {c'4  c4 c2 c1}
BassMusic   = \relative {f4  f4 f2 f1}

VerseOne = \lyricmode {
    Lord have mer -- cy
    }
VerseTwo = \lyricmode {
    Господи по -- ми -- луй
    }
VerseThree = \lyricmode {
    Gospodi po -- mi -- luy
}

\score {
    \new StaffGroup <<
        \new Staff <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic \bar "||"}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
            \new Lyrics \lyricsto "Sop" { \VerseTwo }
            \new Lyrics \lyricsto "Sop" { \VerseThree }
        >>
        \new Staff <<
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
}
