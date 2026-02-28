\version "2.24.4"

\header {
    title = "praise the lord"
    subtitle = "Communion Hymn for Sundays"
    composer = "Obikhod"
    tagline = " "
}

bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1Q" 
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
    f'4 \hideNotes f f \unHideNotes f e f2 f \cadenzaMeasure
    f4 f f e f2 f \cadenzaMeasure \section
    f4 \hideNotes f f f f f f \unHideNotes f e f f2 e f1 \cadenzaMeasure \section
    
}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    c'4 \hideNotes c c \unHideNotes c c c2 c \cadenzaMeasure
    c4 c c c c2 c \cadenzaMeasure \section
    c4 \hideNotes c c c c c c \unHideNotes c c c d2 c c1 \cadenzaMeasure \section
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = #all-visible
    \cadenzaOn
    f4 \hideNotes f f \unHideNotes f c f2 f \cadenzaMeasure
    f4 f f c f2 f \cadenzaMeasure \section
    f4 \hideNotes f f f f f f \unHideNotes f c f bes,2 <c g'> f1 \cadenzaMeasure
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

\markup {
    \column {
    \left-align {
        \line {"1. Who maketh His angels spirits * and His ministers a flame of fire." {\italic "Alleluia..."}}
        \line {"2. In everlasting remembrance shall the righteous be, * he shall not be afraid of evil tidings." {\italic "Alleluia..."}}
        \line {"3. I will take the cup of salvation * and I will call upon the name of the Lord." {\italic "Alleluia..."}}
        \line {"4. Their sound hath gone forth into all the earth * and their words unto the end of the world." {\italic "Alleluia..."}}
        \line {"5. Thou hast wrought salvaton in the midst of the earth, O God."  {\italic "Alleluia..."}}
        \line {"6. Rejoice in the lord, O ye righteous; * praise is meet for the upright" {\italic "Alleluia..."}}
        \line {"7. Blessed are they whom Thou hast chosen and hast taken to Thyself, O Lord; * their memory is from generation to generation." {\italic "Alleluia..."}}
        \line {"8. Out of the mouths of babes and sucklings hast Thou perfected praise." {\italic "Alleluia..."}}
        \line {"9. Blessed is He that cometh in the name of the Lord. * God is the Lord and hath appeared unto us." {\italic "Alleluia..."}}
        \line {"10. The light of Thy countenance, O Lord, hath been signed upon us." {\italic "Alleluia..."}}
        \line {"11. The Lord hath sent redemption unto His people." {\italic "Alleluia..."}}
        \line {"12. The grace of God that bringeth salvation hath appeared to all men." {\italic "Alleluia..."}}
        \line {"13. The Lord hath elected Zion, * He hath chosen her to be a habitation for Himself." {\italic "Alleluia..."}}
        \line { "14. Receive the Body of Christ; * taste the fountain of immortality." {\italic "Alleluia..."}}
        \line {"15. Praise the Lord, O Jerusalem, * praise thy God, O Zion." {\italic "Alleluia..."}}
        \line {"16. He that eateth my flesh, and drinketh my blood, dwelleth in me, and I in him." {\italic "Alleluia..."}}
        \line {"17. God is gone up in jubilation, * the Lord with the voice of the trumpet." {\italic "Alleluia..."}}
        \line {"18. Thy good Spirit shall lead me in the land of uprightness." {\italic "Alleluia..."}}
        \line {"19. O Lord, in the light of Thy face shall they walk, and in Thy name shall they rejoice all the day long." {\italic "Alleluia..."}}
        
    }
  }

}


