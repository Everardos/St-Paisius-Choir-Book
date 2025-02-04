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
    a'4 \hideNotes a a \unHideNotes a g a2 a \cadenzaMeasure
    a4 a a g a2 a \cadenzaMeasure \section
    a4 \hideNotes a a a a a a \unHideNotes a g a bes2 bes a1 \cadenzaMeasure \section
}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    f'4 \hideNotes f f \unHideNotes f d f2 f \cadenzaMeasure
    f4 f f d f2 f \cadenzaMeasure \section
    f4 \hideNotes f f f f f f \unHideNotes f d f f2 e f1 \cadenzaMeasure \section
    
}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    c'4 \hideNotes c c \unHideNotes c bes c2 c \cadenzaMeasure
    c4 c c bes c2 c \cadenzaMeasure \section
    c4 \hideNotes c c c c c c \unHideNotes c bes c d2 c c1 \cadenzaMeasure \section
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    f4 \hideNotes f f \unHideNotes f g f2 f \cadenzaMeasure
    f4 f f g f2 f \cadenzaMeasure \section
    f4 \hideNotes f f f f f f \unHideNotes f g f bes,2 <c g'> f1 \cadenzaMeasure
}

VerseOne = \lyricmode {
    Praise the Lord from the Hea -- vens,
    praise Him in the High -- est.
    Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- i -- a.
    }


\score {
    \new StaffGroup <<
        \new Staff <<
            \clef "treble"
            \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
            \new Voice = "Alto" { \voiceTwo \AltoMusic }
            \new Lyrics \lyricsto "Sop" { \VerseOne }
        >>
        \new Staff <<
            \clef "bass"
            \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusic}
            \new Voice = "Bass" { \voiceTwo \BassMusic} 
        >>
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
        \tempo 4 = 180
    }
}





