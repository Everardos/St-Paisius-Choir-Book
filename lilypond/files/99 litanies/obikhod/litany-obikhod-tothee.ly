\version "2.24.4"

\paper {
    #(set-paper-size "letter")
    page-breaking = #ly:optimal-breaking
    ragged-last-bottom = ##t
    right-margin = 17\mm
    left-margin = 17\mm
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}

keyTime = { \key f \major}

SopMusic    = \relative {a'4 bes2 bes2 a1}
AltoMusic   = \relative {f'4 f2 e2 f1}
TenorMusic  = \relative {c'4  d2 c2 c1}
BassMusic   = \relative {f4  <<bes2 bes,2>> <<c2 g'2>> f1}

VerseOne = \lyricmode {
    To Thee, O Lord
    }
VerseTwo = \lyricmode {
    \override LyricText.font-size = #'-2
    Те -- бе, Господи
    }
VerseThree = \lyricmode {
    \override LyricText.font-shape = #'italic
    \override LyricText.font-size = #'-2
    Tye -- bye, Gospodi
}

\score {
    \new StaffGroup <<
        \new Staff \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic \bar "|"}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
            \new Lyrics \lyricsto "Sop" { \VerseTwo }
            \new Lyrics \lyricsto "Sop" { \VerseThree }
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
