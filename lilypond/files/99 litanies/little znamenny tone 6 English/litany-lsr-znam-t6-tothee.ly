\version "2.24.4"


\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}

keyTime = { \key f \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn

}

SopMusic    = \relative { 
    \cadenzaOn
    g'4( a) bes2( a2.) g4 a2( g f) \cadenzaMeasure \section
}

BassMusic   = \relative {
    \cadenzaOn
    g'4( f) bes,2( f'2.) c4 f2( c d) \cadenzaMeasure \section
}



VerseOne = \lyricmode {
    To Thee, __ O Lord. __
    }

VerseTwo = \lyricmode {
    \override LyricText.font-size = #'-1
    
    Те --
    \set ignoreMelismata = ##t
    бе, Гос -- 
    \set ignoreMelismata = ##f по -- ди. __
    }
VerseThree = \lyricmode {
    \override LyricText.font-name = #"EB Garamond, Semi-Bold Italic"
    \override LyricText.font-size = #'-1
    Tye -- 
    \set ignoreMelismata = ##t
    bye, Gos -- 
    \set ignoreMelismata = ##f
    po -- di. __
}


\score {
    \new Staff <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass" { \voiceTwo \BassMusic }
        \new Lyrics \lyricsto "Sop" { \VerseOne }
        \new Lyrics \lyricsto "Sop" { \VerseTwo }
        \new Lyrics \lyricsto "Sop" { \VerseThree }
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





