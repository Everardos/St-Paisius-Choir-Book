\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}


MelodyMusicOne = \relative c' { 
    \cadenzaOn
    b4 b\breve c2 c4 c c c2 \caesura
    d4 d d d d2 d c \caesura
    e2 d4 c c c b c d2 d4 d d c2 \caesura
    c4 c\breve d4 \[ b2( c) \] d \caesura
    c2 d4 e d c b2 \caesura
    d4 d c b c2 b a\longa \section
}

MelodyMusicTwo = \relative c' { 
    \cadenzaOn
    b4 b b b c2 c \caesura
    d4 d d c d2 c \caesura
    d4 e2 c4 d2 d4 d c2 \caesura
    c4 c c d b2 c d \caesura
    d4 d c b c2 b a\longa \section

    

}



VerseOne = \lyricmode {
    Lord, "I have cried unto Thee," hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I have cried un -- to Thee, hear -- ken un -- to me;
    at -- "tend to the voice of my sup" -- pli -- ca -- tion,
    when I cry un -- to Thee.
    Hear -- ken un -- to me, O Lord.

    }

VerseTwo = \lyricmode {
    Let my prayer be set forth
    as in -- cense be -- fore Thee,
    the lift -- ing up of my hands
    as an eve -- ning sac -- ri -- fice.
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




