\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}


MelodyMusicOne = \relative c' { 
    \cadenzaOn
    \stemDown
    d2 e4 e\breve f4 e2 e4 d e d2 \caesura
    d2 e4 e c d2. c4 b2 \caesura
    d2 e4 e\breve f4 e2 e4 d e d2 \caesura
    d4 d2 e4 e\breve c4 \[ d2.( c4) \] b2 \caesura
    d2 \[ e4( f) \] e2 d4 e d2 \caesura
    e4 e \[ d( e)\] \[ b( c)\] d2 c b1 \section
}

MelodyMusicTwo = \relative c' { 
    \cadenzaOn
    \stemDown
    d4 d d2 \[e4( f)\] \[ e2( d4 e) \] d2 \caesura
    d4 d2 e4 c \[ d2.( c4)\] b2 \caesura
    d4 d2 \[ e4( f)\] e2 d4 e d2 \caesura
    d4 d d2 e4 d2. c4 b2 \caesura
    e4 e \[ d( e)\] \[ b( c)\] d2 c b1 \section

}



VerseOne = \lyricmode {
    Lord, I "have cried unto" Thee, hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I have "cried unto Thee," hear -- ken un -- to me;
    at -- tend to "the voice of my sup" -- pli -- ca -- tion,
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
        \context {
            \Score
            \override SpacingSpanner.strict-note-spacing = ##t
        }
    }
    \midi {
        \tempo 4 = 180
    }
}




