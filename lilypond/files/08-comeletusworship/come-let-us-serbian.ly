\version "2.24.4"

\header {
    title = "come let us worship"
    subtitle = "At the Little Entrance"
    composer = "Serbian"
    tagline = " "

}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#2F" 
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

#(define-markup-command (ebItalic layout props text)
   (markup?)
   (interpret-markup layout props
     (markup #:override '(font-name . "EB Garamond Italic") text )))

SopMusic    = \relative { 
    \numericTimeSignature
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \time 4/4
    a'4( bes a g8 a | f2)
    g4 a | bes2 a4 f |

    \time 2/4
    g4( a) |

    \time 4/4
    bes4. bes8 a4( g) | f2
    b4\rest a4 | a8( bes a4) g f |
    f4.( g8 a4 bes | a2 )
    g4( a) | bes a g2( |

    \time 5/4
    f2) a4 a a8.( bes16)

    \time 4/4
    c4 bes a8.( g16 f4)
    g4 a bes( a)
    g2~( g8 a bes4) 
    a1\fermata \fine
}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)

    \time 4/4
    f'1( | f2) f4 f | f2 f4 f |

    \time 2/4
    f2 |

    \time 4/4
    f4. f8 e2 | d2 s4 f4 | f2 e4 d | d4.( e8 f2 | f)
    f2 | f4 f d2( |
    
    \time 5/4
    d2) f4 f f | 

    \time 4/4
    f4 f f2 | f4 f f2 | d2(~ d8 f f4) | f1


}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    
}

VerseOne = \lyricmode {
    Come, __ let us wor -- ship 
    and fall __ down be -- fore __ Christ
    Who rose __ from the dead. __
    O __ Son of God, __
    save us who sing to Thee:
    Al -- le -- lu -- i -- a.

    }

\markup {\larger { "Deacon:" \hspace #5 "Wisdom! Aright!"}}
\markup \vspace #2
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
            \line {"5." \ebItalic{Cross:} "[Who wast crucified in the flesh.]"}
            \line {"6." \ebItalic Christmas: "[Who wast born of the Virgin]"}
        }
      }
    }
    ""
    {
      \column {
        \left-align {
            \line {"7." \ebItalic "Jan. 1:" "[Who wast circumcised in the flesh.]"}
            \line {"8." \ebItalic Theophany: "[Who wast baptized in the Jordan.]"}
            \line {"9." \ebItalic Ascension: "[Who hast ascended in glory.]"}
            \line {"10." \ebItalic Transfiguration: "[Who wast"}
            \line {\hspace #12 "transfigured on the mount.]"}
        }
      }
    }
    ""
  }

}




