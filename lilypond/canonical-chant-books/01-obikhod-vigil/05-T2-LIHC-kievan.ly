\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}

% NOTE: This follows tone tutor. There is a more correct melody.

MelodyMusicOne = \relative c' { 
    \cadenzaOn
    \[ d2( e) \] d4 d\breve c4 \[ d( e)\] e e e \[ e( d2) \] \caesura
    c4 c c c c2 d d \caesura
    f2 e4 d d\breve d2 d4 d d c2 \caesura
    c4 c\breve \[ c2( d) \] d \caesura
    f2 e4 d2 d4 d c2 \caesura
    e4 e e f e2 d \[ c( d c b\longa)\] \section
}

MelodyMusicTwo = \relative c' { 
    \cadenzaOn
    \[ d2( e) \] d4 d c \[ d( e)\] \[ e( d2) \] \caesura
    c4 c c c \[ c2( d) \] d \caesura
    e4 f2 e4 d2 d4 d c2 \caesura
    c4 c\breve c2 d d \caesura
    e4 e e f e2 d \[ c( d c b\longa)\] \section

}



VerseOne = \lyricmode {
    Lord, I "have cried unto" Thee, hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I have "cried unto Thee," hear -- ken un -- to me;
    at -- "tend to the voice of my suppli" -- ca -- tion,
    when I cry un -- to Thee.
    Hear -- ken un -- to me, O Lord.

    }

VerseTwo = \lyricmode {
    Let my prayer be set forth
    as in -- cense be -- fore Thee,
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
        \context {
            \Score
            \override SpacingSpanner.strict-note-spacing = ##t
        }
    }
    \midi {
        \tempo 4 = 180
    }
}




