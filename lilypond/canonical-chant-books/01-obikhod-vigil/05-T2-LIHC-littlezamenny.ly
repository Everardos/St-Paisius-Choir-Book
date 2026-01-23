\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}



MelodyMusic = \relative c' { 
    \cadenzaOn
    c\breve \bar "!" \[ d4( e)\] d\breve c4 \[ d( e) \] \[ e( d2.) \] \caesura
    e\breve d2 \[ c4( b)\] c2 \caesura

}

MelodyMusicTwo = \relative c' {
    \cadenzaOn
    \[ d4( e)\] d d\breve c4 \[d( e)\] \[e( d2.)\] \caesura
    e4 e e e d2 \[ c4( b)\] c2 \caesura
}


VerseOne = \lyricmode {
    
    }

VerseTwo = \lyricmode {
    Lord, I "have cried unto Thee, hearken" un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I have cried un -- to Thee, hear -- ken un --to me; 
    at -- tend to the voice of my sup -- pli -- ca -- tion,
    when I cry un -- to Thee.
    Hear -- ken un -- to me, O Lord.

    Let my prayer be set forth
    as in -- cense be -- fore Thee,
    the lift -- ing up of my hands
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




