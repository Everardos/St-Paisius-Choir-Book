\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}


MelodyMusicOne = \relative c' { 
    \cadenzaOn
    \[g'2( a) \] g4 g\breve e4 f2 f4 f e d2 \caesura
    f4 f f e f2 g e \caesura
    g2 g4 g\breve f2 f4 f f e2 \caesura
    f4 f f f e2 f4 f f f \[ g2( f) \] e \caesura
    \[ g2( a) \] \[ g4( e)\] f2 f4 e d2 \caesura
    g4 g g g f2 e d\longa \section

    % More correct cadence below:
    % g4 g f e \[ f( g2) \] f4 \[ e2( d4 c)  d\longa \] \section
}

MelodyMusicTwo = \relative c' { 
    \cadenzaOn
    \[g'2( a) \] g4 g e \[ f( e ) \] d2 \caesura
    f4 f f e \[ f2( g) \] e \caesura
    g4 g2 g4 f2 f4 f e2 \caesura
    f4 f e2 f g f e \caesura
    g4 g g g f2 e d\longa \section
}



VerseOne = \lyricmode {
    Lord, I "have cried unto" Thee, hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I "have cried unto Thee," hear -- ken un -- to me;
    at -- tend to the voice of my sup -- pli -- ca -- tion,
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




