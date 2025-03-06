\version "2.24.4"

\header {
    title = "the eyes of all"
    subtitle = "A Koinonikon for All Times"
    composer = "Monk Martin"
    tagline = " "
}

keyTime = { \key g \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#2Q" 
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
    e'4 b'( c b) a b2 \cadenzaMeasure
    b4 c d( c b) g a2 \cadenzaMeasure
    a4 b g( fis e) d e2 \cadenzaMeasure
    e4 a2 a4 g fis4.( g8 fis4 e) e1 \cadenzaMeasure

    e4 g( fis e) fis g a a2. \cadenzaMeasure
    a4 a( g fis) a4 b c b a g2 \cadenzaMeasure
    e4 g fis4.( g8 fis4 e) e1 \cadenzaMeasure \section

    e4 e g( fis e fis g a) a2. \cadenzaMeasure
    a4( g fis) a b( c b a) g2 \cadenzaMeasure
    e4 g fis4.( g8 fis4 e) e1 \cadenzaMeasure \fine

}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    e'4 e2. e4 d2 \cadenzaMeasure
    d4 d b2( e4) e d2 \cadenzaMeasure
    d4 d e2. d4 c2 \cadenzaMeasure
    a4 a2 c4 c d2.( e4) e1 \cadenzaMeasure

    e4 e2. e4 e e d2. \cadenzaMeasure
    d4 d2. d4 g, g g g c2 \cadenzaMeasure
    c4 c d2.( e4) e1 \cadenzaMeasure

    e4 e e1~ e2 d2. \cadenzaMeasure
    d2. d4 g,1 c2 \cadenzaMeasure
    c4 c d2.( e4) e1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    The eyes __ of all
    look to Thee __ with hope,
    and Thou gav -- est them 
    their food in due sea -- son.

    Thou o -- pen -- est Thy hand
    and fil -- est ev -- 'ry liv -- ing thing
    with thy fa -- vor.

    Al -- le -- lu -- ia,
    Al -- le -- lu -- ia,
    Al -- le -- lu -- ia.
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
        \context {
            \Staff
                \remove Time_signature_engraver
                \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)


        }
        \context {
            \Score
            \override SpacingSpanner.spacing-increment = 2
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

\markup \vspace #3


\markup {
    \column {
    \left-align {
        "1. The Lord is nigh unto all that call upon Him, to all that call upon Him in truth."
        "2. He will fulfill the desire of them that fear Him; He also will hear their cry and will save them."
        "3. The Lord preserveth all that love Him, but all the wicked will He destroy."
        "4. My mouth shall speak the praise of the Lord, and let all flesh bless His holy name, for ever, yea, for ever and ever."
        "5. Glory to the Father, and to the Son, and to the Holy Spirit, both now and ever, and unto the ages of ages. Amen."
    }
  }

}