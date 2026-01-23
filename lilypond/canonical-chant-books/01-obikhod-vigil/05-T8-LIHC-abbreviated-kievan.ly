\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}


MelodyMusicOne = \relative c' { 
    \cadenzaOn
    f2 e4 e\breve f2 f4 f e d2 \caesura
    f4 f f e f2 \[ g4( f) \] e2 \caesura
    f4 f\breve e2 \[ d4( f)\] e2 d c \caesura
    e4 e\breve \[ f2.( e4) \] d2 \caesura
    f4 e f2 g4 f e2 \caesura
    g4 g\breve f2 e d\longa \section

}

MelodyMusicTwo = \relative c' { 
    \cadenzaOn
    d4 e f2 e4 \[ f2.( e4) \] d2 \caesura
    f4 f f e \[ f2( g4 f) \] e2 \caesura
    f4 f f \[ e2( d4 f e2) \] d4 d c2 \caesura
    e4 e\breve f2. e4 d2 \caesura
    g4 g\breve f2 e d\longa \section

}



VerseOne = \lyricmode {
    Lord, I "have cried unto Thee," hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, "I have cried un -- to Thee," hear -- ken un -- to me;
    at -- "tend to the voice of my suppli" -- ca -- tion,
    when I cry un -- to Thee.
    Hear -- "ken unto" me, O Lord.

    }

VerseTwo = \lyricmode {
    Let my prayer be set forth
    as in -- cense be -- fore Thee,
    the lift -- ing up of my hands
    as "an evening" sac -- ri -- fice.
    Hear -- "ken unto" me, O Lord.
}


\score {
    \new KievanStaff
    <<
        \new KievanVoice = "melody" \MelodyMusicOne
        \new Lyrics \lyricsto "melody" \VerseOne
    >>
    \layout {
        ragged-last = ##t
        \context {
            \Score
            \override SpacingSpanner.strict-note-spacing = ##t
        }
    }
    \midi {
        \tempo 4 = 180
    }
}

\score {
    \new KievanStaff
    <<
        \new KievanVoice = "melody" \MelodyMusicTwo
        \new Lyrics \lyricsto "melody" \VerseTwo
    >>
    \layout {
        ragged-last = ##t
    }
    \midi {
        \tempo 4 = 180
    }
}




