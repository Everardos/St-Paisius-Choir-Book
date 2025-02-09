\version "2.24.4"

\header {
    title = "kontakion of st. paisius"
    subtitle = "Eighth Tone"
    composer = "Obikhod"
    tagline = " "

}

keyTime = { \key g \major}

bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1B" 
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
    g'4 a b c c c b \hideNotes b b b b b b b \unHideNotes b a2 a g \cadenzaMeasure
    g4 a b c b \hideNotes b b b b b \unHideNotes b \allowBreak b \hideNotes b b b b b b b b \unHideNotes b a2 g \cadenzaMeasure
    g4 a b c b \hideNotes b b b b b \unHideNotes b a2 a g \cadenzaMeasure
    g4 a b c c b \hideNotes b b b b b b \unHideNotes b a2 a g \cadenzaMeasure \fine



}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    d'4 fis g g g g g \hideNotes g g g g g g g \unHideNotes g fis2 fis d \cadenzaMeasure
    d4 fis g g g  \hideNotes g g g g g \unHideNotes g \allowBreak g \hideNotes g g g g g g g g \unHideNotes g fis2 d \cadenzaMeasure
    d4 fis g g g \hideNotes g g g g g \unHideNotes g fis2 fis d \cadenzaMeasure
    d4 fis g g g g \hideNotes g g g g g g \unHideNotes g fis2 fis d \cadenzaMeasure
}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    b4 d d e e e d \hideNotes d d d d d d d \unHideNotes d c2 c b \cadenzaMeasure
    b4 d d e d \hideNotes d d d d d \unHideNotes d \allowBreak d \hideNotes d d d d d d d d \unHideNotes d c2 b \cadenzaMeasure
    b4 d d e d \hideNotes d d d d d \unHideNotes d c2 c b \cadenzaMeasure
    b4 d d e e d \hideNotes d d d d d d \unHideNotes d c2 c b \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    g4 d g c, c e g \hideNotes g g g g g g g \unHideNotes g d2 d g \cadenzaMeasure
    g4 d g c, g' \hideNotes g g g g g \unHideNotes g \allowBreak g \hideNotes g g g g g g g g \unHideNotes g d2 g \cadenzaMeasure
    g4 d g c, g' \hideNotes g g g g g \unHideNotes g d2 d g \cadenzaMeasure
    g4 d g c, e g \hideNotes g g g g g g \unHideNotes g d2 d g \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    Like a much la -- bor -- ing bee, you were an elect zealot of the mon -- as -- tic life,
    sup -- ply -- ing our souls with the writings of the Fathers, through which you guide us on the path of sal -- va -- tion.
    There -- fore we cry out to you: Hail, truly wise Pa -- i -- si -- us,
    for through you the tra -- di -- tion of spiritual Elders has been re -- stored to us.
    }


\score {
    \new ChoirStaff <<
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
            \Lyrics
                \override LyricSpace.minimum-distance = #2.0
                \override LyricText.font-size = #1.5
        }
    }
    \midi {
        \tempo 4 = 180
    }
}

