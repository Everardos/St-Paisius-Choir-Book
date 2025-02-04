\version "2.24.4"

\header {
    title = "достойно есть"
    subtitle = "Megalynarion for the Liturgy of St. John Chrysostom"
    composer = "Special Melody: Joy of the Heavenly Hosts"
    tagline = " "
}

keyTime = { \key g \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1P" 
     }

subTitleFont = \markup {\fill-line {
                \fontsize #1 \override #'(font-name . "EB Garamond Italic")
                \fromproperty #'header:subtitle
                }}

titleFont = \markup {\fill-line {
                \fontsize #8 \caps
                \override #'(font-name . "EB Garamond")
                \fromproperty #'header:title
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

    e'4 g2 g4 \hideNotes g g \unHideNotes g e a4.( b8 g4) fis e2 \cadenzaMeasure
    g4 a \hideNotes a a \unHideNotes a fis g( b a) g fis( g2) \cadenzaMeasure
    e4 e e g2 g4 \hideNotes g g g \unHideNotes g e a4.( b8 g4) fis e2 \cadenzaMeasure
    g4 a a a fis g( b a) g fis( g2) \cadenzaMeasure    
    e4 g2 g4 e a4.( b8 g4) fis e2 \cadenzaMeasure
    g4 a \hideNotes a a a a a a \unHideNotes a fis g( b a) g fis( g2) \cadenzaMeasure
    e4 e g2 g4 \hideNotes g g g \unHideNotes g e a4.( b8 g4) fis e2 \cadenzaMeasure
    a4 \hideNotes a a a a a a \unHideNotes a a2 a4 b a2( g) fis1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn

    e'4 e2 e4 \hideNotes e e \unHideNotes e e a,2( b) e \cadenzaMeasure
    e4 d \hideNotes d d \unHideNotes d d g g g g d( g2) \cadenzaMeasure
    e4 e e e2 e4 \hideNotes e e e \unHideNotes e e a,2( b4) b e2 \cadenzaMeasure
    e4 d d d d g2. g4 d( g2) \cadenzaMeasure    
    e4 e2 e4 e a,2( b4) b e2 \cadenzaMeasure
    e4 d \hideNotes d d d d d d \unHideNotes d d g2. g4 d( g2) \cadenzaMeasure
    e4 e e2 e4 \hideNotes e e e \unHideNotes e e a,2( b4) b e2 \cadenzaMeasure
    d4 \hideNotes d d d d d d \unHideNotes d d2 d4 g fis2( g4 b,) d1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    Дос -- той -- но есть, я -- ко во -- ис -- ти -- ну, 
    бла -- жи -- ти Тя, Бо -- го -- ро -- ди -- цу, 
    При -- сно -- бла -- жен -- ну -- ю и Пре -- не -- по -- роч -- ну -- ю 
    и Ма -- терь Бо -- га на -- ше -- го,
    Чест -- ней -- шу -- ю Не -- ру -- вим,
    и слав -- ней -- шу -- ю без срав -- не -- ни -- я Се -- ра -- фим, 
    без ис -- тле -- ни -- я Бо -- га Сло -- ва рожд -- шу -- ю, 
    су -- щу -- ю Бо -- го -- ро -- ди --  цу Тя ве -- ли -- ча -- ем.
    }


VerseTwo = \lyricmode {
    Dos -- toy -- no yest, ya -- ko vo -- is -- ti -- nu, 
    bla -- zhi -- ti Tya, Bo -- go -- ro -- di -- tsu, 
    Pri -- sno -- bla -- zhen -- ni -- yu i Pre -- ne -- po -- roch -- nu -- yu 
    i Ma -- ter Bo -- ga na -- she -- go,
    Chest -- ney -- shu -- yu He -- ru -- vim,
    i slav -- ney -- shu -- yu bez srav -- nye -- ni -- ya Sye -- ra -- fim, 
    bez is -- tlye -- ni -- ya Bo -- ga Slo -- va rozhd -- shu -- yu, 
    su -- shu -- yu Bo -- go -- ro -- di --  tsu Tya vye -- li -- cha -- yem.
    }



\score {
    \new Staff \with {midiInstrument = "choir aahs"} <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass"  { \voiceTwo \keyTime \BassMusic}

        \new Lyrics \lyricsto "Sop" { \VerseOne }
        \new Lyrics \lyricsto "Sop" { \VerseTwo }

    >>
    \layout {
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





