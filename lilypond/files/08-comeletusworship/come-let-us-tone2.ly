\version "2.24.4"

\header {
    title = "come let us worship"
    subtitle = "At the Little Entrance"
    composer = \markup \column {
      \right-align {
        \bold "Obikhod"
        \raise #1 \fontsize #-1 "(Lvov-Bakhmetev, Tone 2)"
      }
    }
    tagline = " "

}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1F" 
     }

titleFont = \markup {\fill-line {
                \fontsize #8 \caps
                \override #'(font-name . "EB Garamond")
                \fromproperty #'header:title
                }}
subTitleFont = \markup {\fill-line {
                \fontsize #2 \override #'(font-name . "EB Garamond Italic")
                \fromproperty #'header:subtitle
                }}

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
    bookTitleMarkup = \markup \null
    oddHeaderMarkup = \markup {
        \override #'(baseline-skip . 3.5) \fill-line {
            \if \on-first-page  %version 2.23.4
            % \raise #8 \fromproperty #'header:dedication % to ajust and uncomment for dedication
            \if \on-first-page %version 2.23.4
            \raise #3 % to ajust
            \column {
                \titleFont
                \subTitleFont
                \fill-line {
                \smaller \bold
                \fromproperty #'header:subsubtitle
                }
                \fill-line {
                \large \override #'(font-name . "EB Garamond")
                \fromproperty #'header:poet
                { \large \bold \fromproperty #'header:instrument }
                \override #'(font-name . "EB Garamond Medium") \fromproperty #'header:composer
                }
                \fill-line {
                \fromproperty #'header:meter
                \fromproperty #'header:arranger
                }
            }
            \if \on-first-page
                \right-align \bindernumber

        }
        \raise #5
        \if \should-print-page-number %version 2.23.4
        % \if \should-print-page-number  %version 2.23.3
        \fromproperty #'page:page-number-string
    }
    evenHeaderMarkup = \oddHeaderMarkup

}

cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    bes'4 \hideNotes bes bes bes bes bes bes bes \unHideNotes bes \cadenzaMeasure \section
    bes a2 a4 a4 bes2 \cadenzaMeasure
    bes4 \hideNotes bes bes bes bes \unHideNotes bes g a2 a4 a2 \cadenzaMeasure
    a4 \hideNotes a \unHideNotes a bes2( a) g1 \cadenzaOff \fine

}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    g'4 \hideNotes g g g g g g g \unHideNotes g \cadenzaMeasure \section
    g fis2 fis4 fis g2 \cadenzaMeasure
    g4 \hideNotes g g g g \unHideNotes g e f2 f4 f2 \cadenzaMeasure
    f4 \hideNotes f \unHideNotes f g2( f2) e1 \cadenzaOff \fine

}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    d'4 \hideNotes d d d d d d d \unHideNotes d \cadenzaMeasure \section
    d d2 d4 d d2 \cadenzaMeasure
    d4 \hideNotes d d d d \unHideNotes d c c2 c4 c2 \cadenzaMeasure
    c4 \hideNotes c \unHideNotes c c1 c \cadenzaOff \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    g4 \hideNotes g g g g g g g \unHideNotes g \cadenzaMeasure \section
    g d2 d4 d g2 \cadenzaMeasure
    g4 \hideNotes g g g g \unHideNotes g c, f2 f4 f2 \cadenzaMeasure
    f4 \hideNotes f \unHideNotes f e2( f) c1 \cadenzaOff \fine
}

VerseOne = \lyricmode {
    Come, let us worship and fall down before Christ
    "1. [Who" rose from the "dead.]"
    O Son of God, save us who sing to Thee:
    \once \override LyricText.self-alignment-X = #-1
    "Alleluia, alleluia," al -- le -- lu -- ia.

    }


\score {
    \new StaffGroup <<
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
            \Score
                \omit BarNumber
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

\markup {
  \fill-line {
    ""
    {
      \column {
        \left-align {
            "2. [Who art wondrous in Thy saints.]"
            "3. [through the prayers of the Theotokos]"
            "4. [through the prayers of the Forerunner]"
            \line {"5." \italic Cross: "[Who wast crucified in the flesh.]"}
            \line {"6." \italic Christmas: "[Who wast born of the Virgin]"}
        }
      }
    }
    ""
    {
      \column {
        \left-align {
            \line {"7." \italic "Jan. 1:" "[Who wast circumcised in the flesh.]"}
            \line {"8." \italic Theophany: "[Who wast baptized in the Jordan.]"}
            \line {"9." \italic Ascension: "[Who hast ascended in glory.]"}
            \line {"10." \italic Transfiguration: "[Who wast"}
            \line {\hspace #12 "transfigured on the mount.]"}
        }
      }
    }
    ""
  }

}




