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

SopMusic    = \relative {a'2 a1}
AltoMusic   = \relative {f'2 f1}
TenorMusic  = \relative {c'2 c1}
BassMusic   = \relative {f2 f1}

VerseOne = \lyricmode {
    A -- men
    }
VerseTwo = \lyricmode {
    \override LyricText.font-size = #'-1
    А -- минь
    }
VerseThree = \lyricmode {
    \override LyricText.font-name = #"EB Garamond, Semi-Bold Italic"
    \override LyricText.font-size = #'-1
    A -- min
}

\score {
    \new StaffGroup <<
        \new Staff \with {midiInstrument = "choir aahs"} <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic \bar "||"}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
            %\new Lyrics \lyricsto "Sop" { \VerseTwo }
            %\new Lyrics \lyricsto "Sop" { \VerseThree }
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
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/64)

        }
        \context {
            \Score
            \override SpacingSpanner.spacing-increment = 5
        }
        \context {
            \Lyrics
                \override LyricSpace.minimum-distance = #10.0
        }
    }
    \midi {
        \tempo 4 = 120
    }
}
