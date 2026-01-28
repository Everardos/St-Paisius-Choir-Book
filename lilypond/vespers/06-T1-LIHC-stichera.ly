\version "2.24.4"

\header {
    title = "stichera on 'lord i have cried'"
    subtitle = "Tone I"
    composer = "Znamenny"
    tagline = " "
}

keyTime = { \key f \major}


bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "" 
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



% = = = = = = = = = = = = = 
% = = = S T I C H O I = = =
% = = = = = = = = = = = = = 

% Stichos 1
% =========

StichosASop    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 f g \hideNotes g g g \unHideNotes g \cadenzaMeasure \bar "!"
    g4 g g8([ f]) g([ a]) bes2( a8[ g]) a4 g2 \cadenzaMeasure \fine
}

StichosABass   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    s4 s s   s s s   s \cadenzaMeasure
    g'4 g g8([ f]) f4 f2. f4 f2 \cadenzaMeasure
    
}

StichosAText = \lyricmode { 
    Bring my soul out of pri -- son,
    that I may con -- fess __ Thy name.
}

% Stichos 2
% =========

StichosBSop    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosBBass   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosBText = \lyricmode { 
    
}

% Stichos 3
% =========

StichosCSop    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosCBass   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosCText = \lyricmode { 
    
}

% Stichos 4
% =========

StichosDSop    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosDBass   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosDText = \lyricmode { 
    
}

% Stichos 5
% =========

StichosESop    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosEBass   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosEText = \lyricmode { 
    
}

% Stichos 6
% =========

StichosFSop    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosFBass   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosFText = \lyricmode { 
    
}

% Stichos 7
% =========

StichosGSop    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosGBass   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosGText = \lyricmode { 
    
}

% Stichos 8
% =========

StichosHSop    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosHBass   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosHText = \lyricmode { 
    
}

% Stichos 9
% =========

StichosISop    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosIBass   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosIText = \lyricmode { 
    
}

% Stichos 10
% =========+

StichosJSop    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn

    
}

StichosJBass   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

StichosJText = \lyricmode { 
    
}


% = = = = = = = = = = = = = =
% = = = S T I C H E R A = = =
% = = = = = = = = = = = = = =


% Stichera 1
% ==========

SticheraASop = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    a'8([ g]) a4( bes8[ c]) a4 bes8([ a]) g4 a g f8([ e]) f([ g]) a([ g]) a2 \cadenzaMeasure
}

SticheraABass  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 f2 f4 f d d c c d d f2 \cadenzaMeasure 
    
}

SticheraAText = \lyricmode { 
    Ac -- cept Thou our eve -- ning prayer, O ho -- ly Lord,
    and grant un -- to us re -- mis -- sion of sins,
    for Thou a -- lone art He Who hath shown forth the res -- ur -- rec -- tion in the world.
}

% Stichera 2
% ==========

SticheraBSop = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraBBass  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraBText = \lyricmode { 
    
}

% Stichera 3
% ==========

SticheraCSop = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraCBass  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraCText = \lyricmode { 
    
}

% Stichera 4
% ==========

SticheraDSop = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraDBass  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraDText = \lyricmode { 
    
}

% Stichera 5
% ==========

SticheraESop = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraEBass  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraEText = \lyricmode { 
    
}

% Stichera 6
% ==========

SticheraFSop = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraFBass  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraFText = \lyricmode { 
    
}

% Stichera 7
% ==========

SticheraGSop = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraGBass  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraGText = \lyricmode { 
    
}

% Stichera 8
% ==========

SticheraHSop = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraHBass  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraHText = \lyricmode { 
    
}

% Stichera 9
% ==========

SticheraISop = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraIBass  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraIText = \lyricmode { 
    
}

% Stichera 10
% ===========

SticheraJSop = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraJBass  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    
}

SticheraJText = \lyricmode { 
    
}




\score {
    \new Staff
    \with {midiInstrument = "choir aahs"} <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \StichosASop}
        \new Voice = "Bass" { \voiceTwo \StichosABass }
        \new Lyrics \lyricsto "Sop" { \StichosAText }
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

\score {
    \new Staff
    \with {midiInstrument = "choir aahs"} <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SticheraASop}
        \new Voice = "Bass" { \voiceTwo \SticheraABass }
        \new Lyrics \lyricsto "Sop" { \SticheraAText }
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