\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}

% Note: technically the C is sharp in the modern obikhod way of doing this. However, in the original abbreviated Kievan, it is natural. There is nowhere on the white keys where this can be played without a flat or sharp sign, and so I will leave it as it is written in the obikhod book.

MelodyMusicOne = \relative c' { 
    \cadenzaOn
    d4 d\breve c2 c4 c c d2 \caesura
    e4 e e e e2 d e \caesura
    f2 f4 f\breve e4 f e d c2 \caesura
    d4 \breve c2 d \caesura
    e4 e e2 d4 d c2 \caesura
    f2 f4 f e d2 c d\longa \section
}

MelodyMusicTwo = \relative c' { 
    \cadenzaOn
    d4 d\breve c2 d \caesura
    e4 e\breve \[ e2( d) \] e \caesura
    f4 f f \[ e( f) \] e d c2 \caesura
    d4 d\breve c4 c d2 \caesura
    f2 f4 f e d2 c d\longa \section

}



VerseOne = \lyricmode {
    Lord, "I have cried unto Thee," hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I "have cried unto Thee," hear -- ken un -- to me;
    at -- "tend to the voice of my suppli" -- ca -- tion,
    when I cry un -- to Thee.
    Hear -- ken un -- to me, O Lord.

    }

VerseTwo = \lyricmode {
    Let "my prayer be" set forth
    as "incense be" -- fore Thee,
    the lift -- ing up of my hands
    as "an evening" sac -- ri -- fice.
    Heark -- en un -- to me, O Lord.
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




