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

SopMusic    = \relative {a'4 bes4 bes4 a1}
AltoMusic   = \relative {f'4 f4 e4 f1}
TenorMusic  = \relative {c'4  d4 c4 c1}
BassMusic   = \relative {f4  <<bes4 bes,4>> <<c4 g'4>> f1}

VerseOne = \lyricmode {
    Grant this, O Lord
    }
VerseTwo = \lyricmode {
    \override LyricText.font-size = #'-1
    Подай, Гос -- по -- ди
    }
VerseThree = \lyricmode {
    \override LyricText.font-name = #"EB Garamond, Semi-Bold Italic"
    \override LyricText.font-size = #'-1
    Poday, Gos -- po -- di
}

\score {
    \new StaffGroup <<
        \new Staff \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic \bar "|"}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
            %\new Lyrics \lyricsto "Sop" { \VerseTwo }
            %\new Lyrics \lyricsto "Sop" { \VerseThree }
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
            \Score
            \override SpacingSpanner spacing-increment = 4
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
