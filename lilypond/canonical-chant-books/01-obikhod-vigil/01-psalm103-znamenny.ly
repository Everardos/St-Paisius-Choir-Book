\version "2.24.4"


MelodyMusic = \relative c' { 
    \cadenzaOn
    f2 f1 \caesura
    f4 f4 g2 \[ f2( e4 f g2.) \] \[ f4( g f2 e4) \] \[ e4( d e f g1) \]
}



VerseOne = \lyricmode {
    A -- men.
    Bless the Lord, O my soul;
    Bles -- sed art Thou, O Lord.
    }



\score {
    \new KievanStaff
    <<
        \new KievanVoice = "melody" \MelodyMusic
        \new Lyrics \lyricsto "melody" \VerseOne
    >>
    \layout {

    }
    \midi {
        \tempo 4 = 180
    }
}




