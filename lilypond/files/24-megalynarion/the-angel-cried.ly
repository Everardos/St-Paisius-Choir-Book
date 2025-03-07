\version "2.24.4"

\header {
    title = "the angel cried"
    subtitle = "Megalynarion for Pascha"
    composer = "Valaam Chant"
    tagline = " "
}

keyTime = { \key d \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#2p" 
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
    
    a'4 \cadenzaMeasure a2( fis g) a b4( a b g a2) b4 cis d2 cis \break b2. b4 a2.
    a4 \cadenzaMeasure a1( e2) fis g fis4 fis e1 d2. \break
    fis4 \cadenzaMeasure a2. fis4 g2 a b4( a b g a2.)
    a4 \cadenzaMeasure a2. a4 e2 fis \break g fis e d4( fis) e2 e d1 b'2\rest

    a4 a \cadenzaMeasure b( a b g) \break a2 b4( cis) d2( cis) b2. b4 a2. 
    a4 \cadenzaMeasure a2. fis4 g2 fis4 \break fis e1 d \cadenzaMeasure \section
    a'2( fis g a) b4( a b g a1) \cadenzaMeasure \break
    a2( b4 cis) d2( cis) b a d4( cis) b2 a2.

    a4 \cadenzaMeasure a2. fis4 g2 \break a b4( a b g a2.)
    a4 \cadenzaMeasure a2.( fis4 g2 fis e) e d2. \break
    a'4 \cadenzaMeasure a2( b4 cis) d2 cis b1( a) \cadenzaMeasure
    a1 e2( fis) g2 fis \break e1 d2.

    a'4 \cadenzaMeasure b( a b) g a1 a2( b4 cis) d2( cis) \break b2 a d4( cis b2) a1 \cadenzaMeasure
    a2. fis4 g2 a b4( a b g) a2.
    a4 \cadenzaMeasure \break a2. fis4 g2 fis e2. e4 d1 \cadenzaMeasure \fine
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
    d'4 \cadenzaMeasure d1. d2 d1. d4 d d2 fis g2. g4 d2.
    d4 \cadenzaMeasure a1. a2 a a4 a a1 d2.
    d4 \cadenzaMeasure d2. d4 d2 d d1( d2.) 
    d4 \cadenzaMeasure a2. a4 a2 a a2 a a a a a d1 s2
    
    d4 d \cadenzaMeasure d1 d2 d d( fis) g2. g4 d2.
    d4 \cadenzaMeasure d2. d4 a2 a4 a a1 d1 \cadenzaMeasure \section
    d1~ d d~ d \cadenzaMeasure
    d1 d2( fis) g d d d d2.

    d4 \cadenzaMeasure d2. d4 d2 d d1( d2.)
    d4 \cadenzaMeasure d1( a1.) a2 d2.
    d4 \cadenzaMeasure d1 d2 fis g1( d) \cadenzaMeasure
    a1 a a2 a a1 d2. 

    d4 \cadenzaMeasure d2. d4 d1 d d2( fis) g d d1 d \cadenzaMeasure
    d2. d4 d2 d d1 d2.
    d4 \cadenzaMeasure d2. d4 a2 a a2. a4 d1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    The an -- gel cried __ to the La -- dy Full of Grace:
    Re -- joice, __ re -- joice, O pure Vir -- gin!
    A -- gain I say: Re -- joice! __
    Thy Son is ris -- en from His three days __ in the tomb.

    With Him -- self __ He has __ raised __ all the dead.
    Re -- joice, re -- joice O ye peo -- ple!
    Shine, __ shine, __
    shine, __ O __ New Je -- ru -- sa -- lem:
    
    the glo -- ry of the Lord __ 
    has shone __ on thee.
    Ex -- ult __ now, ex -- ult __
    and be __ glad, O Zi -- on.
    
    Be ra -- di -- ant, O __ pure __ The -- o -- to -- kos,
    in the Res -- ur -- rec -- tion, 
    the Res -- ur -- rec -- tion of thy Son.
    }



\score {
    \new Staff
    \with {midiInstrument = "choir aahs"} <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass" { \voiceTwo \BassMusic }
        \new Lyrics \lyricsto "Sop" { \VerseOne }
    >>
        
    \layout {
        ragged-last = ##t
        \context {
            \Score
                \omit BarNumber
        }
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





