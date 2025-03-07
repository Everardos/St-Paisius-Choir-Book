\version "2.24.4"

keyTime = { \key g \major}


cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

%{
SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    e'4 e e8([ fis] g4) fis2 \cadenzaMeasure
    fis4 \hideNotes fis fis fis fis \unHideNotes fis e dis2( cis4) dis e2. \cadenzaMeasure
    fis8([ g]) a2 g4 g g g g4.( fis8 e[ fis]) g4 fis2 \cadenzaMeasure
    fis4 \hideNotes fis fis fis \unHideNotes fis \break fis e dis2( cis4) dis e2 \cadenzaMeasure
    e4 e fis8([ g]) a2 g4 \hideNotes g \unHideNotes g g4.( fis8) e([ fis]) g4 \break fis2 \cadenzaMeasure
    fis4 e dis8([ e] fis4 e) dis e1 \cadenzaMeasure \fine
}
%}

SopMusic    = \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    g'4 \hideNotes g g g \unHideNotes g g8([ a] b4) a2 \cadenzaMeasure
    a4 g fis2 e4 fis g2. \cadenzaMeasure
    a8([ b]) \break c2 b4 \hideNotes b b \unHideNotes b  b4.( a8)  g([ a]) b4 a2 \cadenzaMeasure
    g4 fis2 e4 fis g2 \cadenzaMeasure
    g4 \break a8([ b]) c2 b4 \hideNotes b b b \unHideNotes b b4.( a8) g([ a]) b4 a2 \cadenzaMeasure
    a4 \hideNotes a a a \unHideNotes a \break b a a a g fis8([ g] a4) g fis g1 \cadenzaMeasure \fine
}


BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    e'4 \hideNotes e e e \unHideNotes e e8([ d] g4) d2 \cadenzaMeasure
    d4 e b2 b4 b e2. \cadenzaMeasure
    e4 a( fis) g \hideNotes g g \unHideNotes g g4.( d8) e([ d]) g4 d2 \cadenzaMeasure
    e4 b2 b4 b e2 \cadenzaMeasure
    e4 e a( fis) g \hideNotes g g g \unHideNotes g g4.( d8) e([ d]) g4 d2 \cadenzaMeasure
    d4 \hideNotes d d d \unHideNotes d g d d d e b2 b4 b e1 \cadenzaMeasure \fine
    
}


VerseOne = \lyricmode {
    Do not lament me, O Moth -- er,
    see -- ing me in the tomb,
    the __ Son __ con -- ceived in the womb __ with -- out seed,
    for I shall a -- rise
    and be __ glo -- ri -- fied with eter -- nal glo -- ry __ as God;
    I shall exalt all who mag -- ni -- fy thee in faith __ and in love.
    }



\score {
    \header {
        piece = \markup {\large \italic "Holy Saturday, Tone 6"}
    }
    \new Staff
    % \with {midiInstrument = "choir aahs"} 
    <<
        \clef "treble"
        \new Voice = "Sop"  { \voiceOne \keyTime \SopMusic}
        \new Voice = "Bass" { \voiceTwo \BassMusic }
        \new Lyrics \lyricsto "Sop" { \VerseOne }
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





