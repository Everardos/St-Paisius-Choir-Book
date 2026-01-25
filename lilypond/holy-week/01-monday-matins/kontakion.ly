\version "2.24.4"

keyTime = { \key f \major}

% An attempt at Greek chant. I will have to go back over it. Here's one source: https://www.seraphim6.com/shop/p-04-heirmoi-for-the-kanon-of-pascha-ledkovsky-arrangement/

cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}

SopMusic    =   \relative { 
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \cadenzaOn
    a'4 a bes c c bes c( bes8[ a]) g([ a] bes4) a4( g) f2 \cadenzaMeasure
    a4 a a bes c c c c c bes c c bes c( bes8[ a]) g([ a] bes4) a g f2 \cadenzaMeasure
    g8([ a]) bes4 bes bes bes8([ a]) g4 a bes c2 \cadenzaMeasure
    bes4 c a bes c bes c( bes8[ a]) g([ a]) bes4 a( g) f2 \cadenzaMeasure
    g4 g8([ a]) bes4 bes bes bes bes bes bes bes bes8([ a]) g4 a bes c2 \cadenzaMeasure
    c4 d ees d c c bes8([ a]) g([ f]) g8([ a] bes4) a2 g4 g f1
}


BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \cadenzaOn
    
}

VerseOne = \lyricmode {
    Jac -- ob la -- men -- ted the loss of Jo -- seph,
    but his no -- ble son was seat -- ed on a char -- iot and hon -- ored as a king.
    For when he re -- fused to be en -- slaved
    by the plea -- sures of the E -- gyp -- tian wo -- man,
    he was glo -- ri -- fied by the Lord who be -- holds the hearts of men,
    and bes -- tows up -- on them an in -- cor -- rup -- ti -- ble crown.

}


\score {
    \new Staff
    \with {midiInstrument = "choir aahs"} 
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
        \context {
            \Score
            forbidBreakBetweenBarLines = ##f
        }
    }
    \midi {
        \tempo 4 = 180
    }
}





