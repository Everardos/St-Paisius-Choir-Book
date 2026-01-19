\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}

% The "f"s around the g in the second phrase (either before and after, or only after, depending on the phrase) are, in the canonical book, an e. F sounds better.

MelodyMusicOne = \relative c' { 
    \cadenzaOn
    e2 d4 e e e d e f2 f4 f f e2 \caesura
    \[ g4( e)\] e e e d2 d4 c2 \caesura
    e2 d4 e e e d e f2 f4 f f e2 \caesura
    f4 \[ g( e) \] e e\breve d2 c \caesura
    e2 d4 f2 f4 f e2 \caesura
    g2 g4 g f e2 \[ f4( e)\] d\longa \section
}

MelodyMusicTwo = \relative c' { 
    \cadenzaOn
    c4 d e2 e4 f2 e \caesura
    f4 \[ g( f)\] e e d2 c \caesura
    c4 e2 e4 f2 f4 f e2 \caesura
    e4 f \[ g( f)\] e d2 d4 c2 \caesura
    g2 g4 g f e2 \[ f4( e)\] d\longa \section
}



VerseOne = \lyricmode {
    Lord, I have cried un -- to Thee, hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I have cried un -- to Thee, hear -- ken un -- to me;
    at -- tend to "the voice of my suppli" -- ca -- tion,
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




