\version "2.24.4"

\header {
    title = "troparion of st. paisius"
    subtitle = "Second Tone"
    composer = "Obikhod"
    tagline = " "

}

keyTime = { \key f \major}

bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1g" 
}

titleFont = \markup {\fill-line {
                \fontsize #6 \caps
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
    a'4 a a a bes c2 bes4 bes a2 \cadenzaMeasure
    a4 \hideNotes a a a a a a a \unHideNotes a g2 g f2. \cadenzaMeasure
    g4 a2 a4 \hideNotes a a a \unHideNotes a bes c2 bes a \cadenzaMeasure
    a4 \hideNotes a a a a \unHideNotes a g2 g f2. \cadenzaMeasure
    a4 \hideNotes a a a a a a a \unHideNotes a g bes a2( g) f1 \cadenzaMeasure \fine
}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 f f f f f2 f4 f f2 \cadenzaMeasure
    f4 \hideNotes f f f f f f f \unHideNotes f e2 e c2. \cadenzaMeasure
    e4 f2 f4 \hideNotes f f f \unHideNotes f f f2 f f \cadenzaMeasure
    f4 \hideNotes f f f f \unHideNotes f e2 e c2. \cadenzaMeasure
    f4 \hideNotes f f f f f f f \unHideNotes f d f f2( e) c1 \cadenzaMeasure \fine

}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    c'4 c c c d ees2 d4 d c2 \cadenzaMeasure
    c4 \hideNotes c c c c c c c \unHideNotes c bes2 bes a2. \cadenzaMeasure
    bes4 c2 c4 \hideNotes c c c \unHideNotes c d ees2 d c \cadenzaMeasure
    c4 \hideNotes c c c c \unHideNotes c bes2 bes a2. \cadenzaMeasure
    c4 \hideNotes c c c c c c c \unHideNotes c bes d c2( bes) a1 \cadenzaMeasure \fine

}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f4 f f f <bes bes,> <a a,>2 <bes bes,>4 <bes bes,> f2 \cadenzaMeasure
    f4 \hideNotes f f f f f f f \unHideNotes f c2 c f2. \cadenzaMeasure
    c4 f2 f4 \hideNotes f f f \unHideNotes f <bes bes,> <a a,>2 <bes bes,> f \cadenzaMeasure
    f4 \hideNotes f f f f \unHideNotes f c2 c f2. \cadenzaMeasure
    f4 \hideNotes f f f f f f f \unHideNotes f g bes, c2 c <f f,>1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    Hav -- ing be -- come a strang -- er on earth,
    you reached the heavenly homeland, O venerable father Pa -- i -- si us.
    You taught the faithful to lift up their minds to God,
    Cry -- ing out to Him with all their hearts:
    Lord Jesus Christ, Son of God have mercy on me a sin -- ner.
    }


\score {
    \new ChoirStaff <<
        \new Staff \with {instrumentName = \markup {
            \right-column {
                \line { "S" }
                \line { "A" }
            }
        }}
        % \with {midiInstrument = "choir aahs"} 
        <<
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
        % \with {midiInstrument = "choir aahs"} 
        <<          
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
            \Lyrics
                \override LyricSpace.minimum-distance = #2.0
                \override LyricText.font-size = #1.5
        }
    }
    \midi {
        \tempo 4 = 180
    }
}

