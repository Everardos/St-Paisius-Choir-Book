\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}


MelodyMusic = \relative c' { 
    \cadenzaOn
    \[ e2( f4 g) \] e4 e\breve d4 e2 e4 d e d2 \caesura
    c4 d e e d2 c d \caesura
    c4 d e e\breve d4 e f2 f4 e d e1 \caesura
    f4 f \[ g2( f4) \] e2 d e \caesura %wrong line
    e4
}



VerseOne = \lyricmode {
    Lord, I "have cried unto" Thee, hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I have "cried un" -- to Thee, hear -- ken un -- to me;
    at -- tend to the voice of my sup -- pli -- ca -- tion,
    when I cry un -- to Thee.
    Hear -- ken un -- to me, O Lord.
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




