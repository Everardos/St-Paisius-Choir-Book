\version "2.24.4"


MelodyMusic = \relative c' { 
    \cadenzaOn
    f2 f1 \caesura
    f4 f \[g( f e f g) \] \[g( f)\] e \hideNotes r \unHideNotes f8([ e] d2)  \section
    \[ f4( e f2 e4) \] \[ e( d)\] \[ e( f) \] \[ g1( f4 e f g2 a4 g f2) \] \[ f2.( f4) \] \[ f4( g1 f4 g e f g2 f4 g a2 g1 f4 e f\longa) \]
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




