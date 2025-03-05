\version "2.24.4"

\header {
    title = "liturgy ending"
    subtitle = " "
    composer = "Novgorod Melody"
    tagline = " "
}

keyTime = { \key g \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1S" 
}

layoutVariable = \layout {
    ragged-last = ##t
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

midiVariable =  \midi {
        \tempo 4 = 180
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

#(define-markup-command (ebregular layout props text)
   (markup?)
   (interpret-markup layout props
     (markup #:override '(font-name . "EB Garamond") text )))

cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

SopMusicOne    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    a'4 a b2 a4( c) b2 a \cadenzaMeasure
    a4 a a a2 a4 a a b g2( fis4 g) a2 \cadenzaMeasure
    a4 b c2 b4( a) b2 g \cadenzaMeasure
    b4 b b b b b b a b( c) b2 a \cadenzaMeasure
    a4 g b( a2. g4 a2 g4) fis1 \cadenzaMeasure \fine 
}

AltoMusicOne   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    fis'4 fis g2 fis4( a) g2 fis \cadenzaMeasure
    fis4 fis fis fis2 fis4 fis fis g e2( d4 e) fis2 \cadenzaMeasure
    fis4 g g2 g4( fis) g2 d \cadenzaMeasure
    g4 g g g g g g fis g( a) g2 fis \cadenzaMeasure
    fis4 e g( fis2. e4 fis2 d4) d1 \cadenzaMeasure \fine
}

TenorMusicOne  = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    d'4 d d2 d d d \cadenzaMeasure
    d4 d d d2 d4 d d d d1 d2 \cadenzaMeasure
    d4 d e2 d d b \cadenzaMeasure
    d4 d d d d d d d d2 d d \cadenzaMeasure
    d4 d d( d1 d2 b4) a1 \cadenzaMeasure \fine
}

BassMusicOne   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    d4 d d2 d <g g,> d \cadenzaMeasure
    d4 d d d2 d4 d d d d1 d2 \cadenzaMeasure
    d4 d c2 g'4( d) <g g,>2 <g g,> \cadenzaMeasure
    g4 g g g g g g d <g g,>2 <g g,> d \cadenzaMeasure
    d4 d g( d1 d2 g4) d1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    We have seen the __ True Light, 
    we have re -- ceived the Hea -- ven -- ly Spi -- rit;
    we have found the __ True Faith,
    wor -- ship -- ping the un -- di -- vid -- ed Tri -- ni -- ty
    Who has saved __ us.
    }

SopMusicTwo    = \relative { 
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    a'2 a1 \cadenzaMeasure \section
    a4 b a a a a c b2 b a \cadenzaMeasure
    a4 a a a a b g2( fis4 g) a2 \cadenzaMeasure
    b4 c2 b4 a a b2.( g4) g1 \cadenzaMeasure
    b4 \hideNotes b b b   b b b   b b b \unHideNotes b a b( c) b2 a \cadenzaMeasure
    a4 a a b g2( fis4) g a2 \cadenzaMeasure
    a4 a b c2 c4 b a \hideNotes a a a \unHideNotes a b2. g4 g2 \cadenzaMeasure
    a4 a a a   a a a a   a g b( a2. g4 a2 g4) fis1 \cadenzaMeasure \fine
}

AltoMusicTwo   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    fis'2 fis1 \cadenzaMeasure \section
    fis4 g fis fis fis fis a g2 g fis \cadenzaMeasure
    fis4 fis fis fis fis g e2( d4 e) fis2 \cadenzaMeasure
    g4 g2 g4 fis fis g2.( d4) d1 \cadenzaMeasure
    g4 \hideNotes g g g  g g g  g g g \unHideNotes g fis g( a) g2 fis \cadenzaMeasure
    fis4 fis fis g e2( d4) e fis2 \cadenzaMeasure
    fis4 fis g g2 g4 g fis \hideNotes fis fis fis \unHideNotes fis g2. d4 d2 \cadenzaMeasure
    fis4 fis fis fis   fis fis fis fis   fis e g( fis2. e4 fis2 d4) d1 \cadenzaMeasure \fine

}

TenorMusicTwo  = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    d'2 d1 \cadenzaMeasure \section
    d4 d d d d d d d2 d d \cadenzaMeasure
    d4 d d d d d d1 d2 \cadenzaMeasure
    d4 e2 d4 d d d2.( b4) b1 \cadenzaMeasure
    d4 \hideNotes d d d   d d d   d d d \unHideNotes d d d2 d d \cadenzaMeasure
    d4 d d d d2. d4 d2 \cadenzaMeasure
    d4 d d e2 e4 d d \hideNotes d d d \unHideNotes d d2. b4 b2 \cadenzaMeasure
    d4 d d d  d d d d  d d d~( d1~ d2 b4) a1 \cadenzaMeasure \fine
}

BassMusicTwo   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    d2 d1 \cadenzaMeasure \section
    d4 d d d d d d <g g,>2 <g g,> d \cadenzaMeasure
    d4 d d d d d d1 d2 \cadenzaMeasure
    d4 c2 g'4 d d <g g,>1 <g g,> \cadenzaMeasure
    g4 \hideNotes g g g  g g g  g g g \unHideNotes g d <g g,>2 <g g,> d \cadenzaMeasure
    d4 d d d d2. d4 d2 \cadenzaMeasure
    d4 d d c2 c4 g' d \hideNotes d d d \unHideNotes d <g g,>2. <g g,>4 <g g,>2 \cadenzaMeasure
    d4 d d d  d d d d  d d g( d1~ d2 g4) d1 \cadenzaMeasure \fine
}

VerseTwo = \lyricmode {
    A -- men.
    Let our mouths be filled with Thy praise, O Lord,
    that we may sing of Thy glo -- ry;
    for Thou hast made us wor -- thy
    to partake of Thy holy, divine, immortal and life -- cre -- a -- ting mys -- ter -- ies.
    Keep us in Thy ho -- li -- ness,
    that all the day we may med -- i -- tate upon Thy right -- eous -- ness.
    Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia.
    }

\book{
    \markup \vspace #2
    \markup \wordwrap {\larger {  Priest: \ebregular{Save O God, Thy people and bless Thine inheritance.
    \footnote "*" \smaller "* During the Paschal season, we sing instead the Paschal troparion, followed by the \"Let our mouths.\""
    }}}
    \markup \vspace #1

    \score {
        \new StaffGroup <<
            \new Staff <<
                \clef "treble"
                \new Voice = "Sop"  { \voiceOne \keyTime \SopMusicOne}
                \new Voice = "Alto" { \voiceTwo \AltoMusicOne }
                \new Lyrics \lyricsto "Sop" { \VerseOne }
            >>
            \new Staff <<
                \clef "bass"
                \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusicOne}
                \new Voice = "Bass" { \voiceTwo \BassMusicOne} 
            >>
        >>
        \layoutVariable
        \midiVariable
    }

    \markup \wordwrap {\larger {  Priest: \ebregular{Always, now and ever, and unto the ages of ages.}}}
    \markup \vspace #1

    \score {
        \new StaffGroup <<
            \new Staff <<
                \clef "treble"
                \new Voice = "Sop"  { \voiceOne \keyTime \SopMusicTwo}
                \new Voice = "Alto" { \voiceTwo \AltoMusicTwo }
                \new Lyrics \lyricsto "Sop" { \VerseTwo }
            >>
            \new Staff <<
                \clef "bass"
                \new Voice = "Tenor" { \voiceOne \keyTime \TenorMusicTwo}
                \new Voice = "Bass" { \voiceTwo \BassMusicTwo} 
            >>
        >>
        \layoutVariable
        \midiVariable
    }

}


