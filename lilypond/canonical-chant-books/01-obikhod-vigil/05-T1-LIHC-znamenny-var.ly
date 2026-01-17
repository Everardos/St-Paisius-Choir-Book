\version "2.24.4"

\paper {
    #(define fonts
        (set-global-fonts
            #:roman "EB Garamond SemiBold"
    ))
}

% This is the version from the OCA Diocese of the West
% reset in Kievan square note notation
% Note durations doubled, might need to change

MelodyMusic = \relative c' { 
    \cadenzaOn
    \[e2( f4 g)\] e2 \[e4( d)\] \[f2( e d4 c)\] \[d4( e)\] f2 \[e( d4 e d1)\] \caesura
    g2 g \[f4( e)\] f2 e1 \caesura
    \[c4( d e2)\] e2 \[e4( d)\] c2 \[d2.( b4 c2)\] b2 a\longa \section
}

MelodyMusicTwo = \relative c' {
    \cadenzaOn
    
}


VerseOne = \lyricmode {
    Lord, I have cried un -- to Thee, hear -- ken un -- to me.
    Hear -- ken un -- to me, O Lord.
    Lord, I have cried un -- to Thee, hear -- ken un --to me; 
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




