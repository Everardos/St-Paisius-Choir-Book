\version "2.24.4"

keyTime = { \key g \major}


cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

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

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    e'4 e e8([ d] g4) d2 \cadenzaMeasure
    d4 \hideNotes d d d d \unHideNotes d e b2. b4 e2. \cadenzaMeasure
    e4 a( fis) g g g g g4.( d8 e[ d]) g4 d2 \cadenzaMeasure
    d4 \hideNotes d d d \unHideNotes d d e b2. b4 e2 \cadenzaMeasure
    e4 e e a( fis) g \hideNotes g \unHideNotes g g4.( d8) e([ d]) g4 d2 \cadenzaMeasure
    d4 e b2. b4 e1 \cadenzaMeasure \fine
    
}

VerseOne = \lyricmode {
    Come, O faith -- ful,
    let us enjoy the Master's hos -- pi -- tal -- i -- ty:
    the __ ban -- quet of im -- mor -- tal -- i -- ty
    in the upper cham -- ber with up -- lift -- ed minds.
    Let us re -- ceive __ the exalt -- ed words __ of __ the Word,
    whom we mag -- ni - fy.
    }



\score {
    \header {
        piece = \markup {\large \italic "Palm Sunday, Tone 4"}
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





