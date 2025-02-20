\version "2.24.4"

\header {
    title = "in thee, o full of grace"
    subtitle = "Megalynarion for the Liturgy of St. Basil"
    composer = "Greek Chant, Tone 8"
    tagline = " "
}

keyTime = { \key d \major}


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
    
    fis'4( g) a2 a4 a8([ b a g] fis[ e]) fis([ g]) a2 \allowBreak
    a4 g a( g8[ fis]) e([ fis]) \allowBreak g4 fis( e) d1 \cadenzaMeasure
    fis4 g a8([ b a g]) fis([ e]) 
    fis([ g]) a4 g8([ fis]) e([ fis]) g4 \allowBreak fis4 e d1 \cadenzaMeasure

    fis4( g) a8([ b]) a([ g]) fis4( g) a8([ b g a]) a2 \allowBreak
    g4 a( g8[ fis]) \allowBreak e([ fis]) g4 fis e d1 \cadenzaMeasure
    fis8([ g]) a4( g8[ fis]) e([ fis]) g4 fis( e) d1 \cadenzaMeasure
    fis4 \allowBreak g a4.( g8) fis4 g a8([ b g a]) a2 \cadenzaMeasure

    a8([ b]) a([ g]) fis([ e]) fis([ g]) a2 \cadenzaMeasure
    g4 a g8([ fis]) e([ fis]) g4 fis( e) d1 \cadenzaMeasure
    fis4 fis g a8([ b]) a([ g]) fis([ e]) fis g \allowBreak a2 \cadenzaMeasure
    a8([ b a g]) fis([ e fis a]) a2 \allowBreak a4 a g a g8([ fis]) e([ fis]) g4 \allowBreak
    fis4( e) d1 \cadenzaMeasure

    fis4( g) a2 a4 a8([ b a g] fis[ e]) fis([ g]) a2 \allowBreak
    a4 b \allowBreak c( b) a a b( a8[ g] fis[ e]) fis([ g]) a2( g8[ fis] e[ fis] g4) fis e d1 \cadenzaMeasure \fine

}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
    d'2 d d4 d2. d4 d2 
    d4 d d2 a4 a a2 d1 \cadenzaMeasure
    d4 d d2 d4 d d d
    a a a a d1 \cadenzaMeasure

    d2 d4 d d2 d d
    d4 d2 a4 a a a d1 \cadenzaMeasure
    d4 d2 a4 a a2 d1 \cadenzaMeasure
    d4 d d2 d4 d d2 d \cadenzaMeasure
    
    d4 d d d d2 \cadenzaMeasure
    d4 d d a a a2 d1 \cadenzaMeasure
    d4 d d d d d d8 d d2 \cadenzaMeasure
    d2 d d d4 d d d d a a a2 d1 \cadenzaMeasure

    d2 d d4 d2. d4 d2
    d4 d d2 d4 d d2. d4 d2( a~ a4) a a d1 \cadenzaMeasure \fine
}

VerseOne = \lyricmode {
    In __ thee, O Full __ of __ Grace, 
        all cre -- a -- tion __ re -- joic -- es;
    the as -- sem -- bly __ of __ an -- gels 
        and the race of men.
    
    O __ sanc -- ti -- fied __ Tem -- ple
        and spir -- i -- tual Par -- a -- dise,
    the __ glo -- ry __ of vir -- gins
    from whom God __ was in -- car -- nate

    and __ be -- came __ a __ child,
    our God be -- fore the ag -- es.
    He made thy bod -- y __ in -- to a throne
    and __ thy __ womb He made more spa -- cious than the heav -- ens.

    In __ thee, O Full __ of Grace, 
        all cre -- a -- tion re -- joic -- es: __ 
        glo -- ry to thee.
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
            \Lyrics
                \override LyricSpace.minimum-distance = #2.0
                \override LyricText.font-size = #1.5
        }
    }
    \midi {
        \tempo 4 = 180
    }
}





