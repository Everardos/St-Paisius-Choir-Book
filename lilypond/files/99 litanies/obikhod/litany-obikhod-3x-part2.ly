\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}


keyTime = { \key f \major}

SopMusic    = \relative {a'\breve a4 bes2 a1}
AltoMusic   = \relative {f'\breve f4 e2 f1}
TenorMusic  = \relative {c'\breve  c4 c2 c1}
BassMusic   = \relative {f\breve f4 <<c2 g'2>> f1}

VerseOne = \lyricmode {
    \once \override LyricText.self-alignment-X = #-1
    "Lord have mercy, Lord have mercy, Lord" have mer -- cy
    }


\score {
    \new StaffGroup <<
        \new Staff \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic \bar "|"}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
        >>
        \new Staff \with {midiInstrument = "choir aahs"} <<
            \clef "bass"
            \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusic \bar "|"}
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
