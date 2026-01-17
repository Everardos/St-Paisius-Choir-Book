\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}


MelodyMusicOne = \relative c' { 
    \cadenzaOn
    d2 d4 d\breve c4 d e2 c4 c c c2 \caesura
    e4 e e d e2 e d \caesura
    d2 d4 d\breve b4 c d c b a2 \caesura
    d4 d2 d4 d\breve c4 d e2 c \caesura
    e4 d e2 e4 e d2 \caesura
    e2 d c4 c b2 \[ c4( b) \] a \section
}

MelodyMusicTwo = \relative c' { 
    \cadenzaOn
    

    

}



VerseOne = \lyricmode {
    Lord, I "have cried un" -- to Thee, hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I "have cried unto" Thee, hear -- ken un -- to me;
    at -- tend to "the voice of my" sup -- pli -- ca -- tion,
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




