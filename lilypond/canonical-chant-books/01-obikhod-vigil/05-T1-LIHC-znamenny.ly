\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}


MelodyMusic = \relative c' { 
    \cadenzaOn
    \[ e2( f4 g) \] e4 e\breve \[ f4( e)\] d2 e4 e \[ e(d1) \] \caesura
    \[ c4( d)\] e2 e4 d c2 d2. \[ b4( c2 b2 a\longa) \] \section \break
    c2 c4 c\breve
    c4 d  \[ e2. ( d4) \] \[c(d)\] e2 \[ e4( d2.) \] \caesura
    \[ c4( d)\] e2 e4 d c2 d2. \[ b4( c2 b2 a\longa) \] \section
}

MelodyMusicTwo = \relative c' {
    \cadenzaOn
    a4 b c c\breve \caesura
    d4 d \[e4( d)\] \[c( d)\] e2 e4 d2. \caesura
    \[ c4( d)\] e2 e4 d c2 d2. \[ b4( c2 b2 a\longa) \] \section
}


VerseOne = \lyricmode {
    Lord, I "have cried unto Thee," hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I "have cried unto Thee, hearken unto me; attend to the voice of my supplication,"
    when I cry un -- to Thee.
    Hear -- ken un -- to me, O Lord.
    }

VerseTwo = \lyricmode {
    Let my prayer "be set forth as incense before Thee, the lifting up of my hands"
    as an eve -- ning sac -- ri -- fice.
    Heark -- en un -- to me, O Lord.
}


\score {
    \new KievanStaff
    <<
        \new KievanVoice = "melody" \MelodyMusic
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




