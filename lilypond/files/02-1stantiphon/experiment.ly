\version "2.24.4"

\header {
    title = "first typical antiphon"
    subtitle = "Psalm 102"
    composer = "Greek Chant, Tone 1"
    tagline = " "

}

bindernumber = \markup {
    \override #'(font-name . "Goudy Old Style Bold")

    \fontsize #14 "#1B" 
     }

\include "C:/Users/Zhao/Choir Book/lilypond/ly/choirbook-variables.ly"
\include "C:/Users/Zhao/Choir Book/lilypond/ly/choirbook-paper.ly"


keyTime = { \key f \major}
cadenzaMeasure = {
  \cadenzaOff
  \partial 1024 s1024
  \cadenzaOn
}


SopMusic    = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f'4 f g2( a2) f4( g) a bes2 \cadenzaMeasure %Bless
    a4 a a g2 g f1 \cadenzaMeasure %blessed
    f4 f g2( a2) f4( g) a bes2 \cadenzaMeasure %Bless
    a4 \hideNotes a a \unHideNotes a bes c( bes) a4. \cadenzaMeasure %and all
    a4 a g2 g f1 \cadenzaMeasure %bless his Holy
    f4 f g2( a2) f4( g) a bes2 \cadenzaMeasure %Bless
    a4 \hideNotes a a a \unHideNotes a g2 g f1 \cadenzaMeasure %and forget not
    f4 f g2( a2) f4 \allowBreak g a bes2. bes4 bes2 \cadenzaMeasure  %who forgives 
    a4 \hideNotes a a a \unHideNotes a g2 f \cadenzaMeasure %who heals
    f4 g2( a2) f4 f f f g a bes2. bes4 bes2 \cadenzaMeasure %the lord is
    a4 \hideNotes a a \unHideNotes a g2 g f1 \cadenzaMeasure %longsuffering
    f4 f g2( a2) f4( g) a bes2 \cadenzaMeasure %Bless
    a4 a a g2 g f1 \cadenzaOff \fine %blessed
}

AltoMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    c'4 c e2( f2) f2 f4 f2  \cadenzaMeasure %bless
    f4 f f e2 e c1 \cadenzaMeasure %blessed
    c4 c e2( f2) f2 f4 f2  \cadenzaMeasure %bless
    f4 \hideNotes f f \unHideNotes f f f2 f4. \cadenzaMeasure %and all
    f4 f e2 e c1 \cadenzaMeasure %bless his Holy
    c4 c e2( f2) f2 f4 f2  \cadenzaMeasure %bless
    f4 \hideNotes f f f \unHideNotes f e2 e c1 \cadenzaMeasure %and forget not
    c4 c e2( f2) f4 f f f2. f4 f2 \cadenzaMeasure %who forgives
    f4 \hideNotes f f f \unHideNotes f e2 c \cadenzaMeasure %who heals
    c4 e2( f2) f4 f f f f f f2. f4 f2 \cadenzaMeasure %the Lord is
    f4 \hideNotes f f  \unHideNotes f e2 e c1 \cadenzaMeasure %longsuffering
    c4 c e2( f2) f2 f4 f2  \cadenzaMeasure %bless
    f4 f f e2 e c1 \cadenzaOff \fine %blessed

}

TenorMusic  = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    a4 a c1 a4( bes4) c d2 \cadenzaMeasure %bless
    c4 c c bes2 bes a1 \cadenzaMeasure %blessed
    a4 a c1 a4( bes4) c d2 \cadenzaMeasure %bless
    c4 \hideNotes c c \unHideNotes c d ees( d) c4. \cadenzaMeasure %and all
    c4 c bes2 bes a1 \cadenzaMeasure %bless his Holy
    a4 a c1 a4( bes4) c d2 \cadenzaMeasure %bless
    c4 \hideNotes c c c \unHideNotes c bes2 bes a1 \cadenzaMeasure %and forget not
    a4 a c1 a4 bes4 c d2. d4 d2 \cadenzaMeasure %who forgives
    c4 \hideNotes c c c \unHideNotes c bes2 a2 \cadenzaMeasure %who heals
    a4 c1 a4 a a a bes c d2. d4 d2 \cadenzaMeasure %the lord is
    c4 \hideNotes c c \unHideNotes c bes2 bes a1 \cadenzaMeasure %longsuffering
    a4 a c1 a4( bes4) c d2 \cadenzaMeasure %bless
    c4 c c bes2 bes a1 \cadenzaOff \fine %blessed
}

BassMusic   = \relative {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \cadenzaOn
    f4 f c2( f2) f2 f4 bes,2 \cadenzaMeasure %bless
    f'4 f f c2 c f1 \cadenzaMeasure %blessed
    f4 f c2( f2) f2 f4 bes,2 \cadenzaMeasure %bless
    f'4 \hideNotes f f \unHideNotes f bes a( bes) f4. \cadenzaMeasure %and all
    f4 f c2 c f1 \cadenzaMeasure %bless his holy
    f4 f c2( f2) f2 f4 bes,2 \cadenzaMeasure %bless
    f'4 \hideNotes f f f \unHideNotes f c2 c f1 \cadenzaMeasure %and forget not
    f4 f c2( f2) f4 f f bes,2. bes4 bes2 \cadenzaMeasure %who forgives
    f'4 \hideNotes f f f \unHideNotes f c2 f \cadenzaMeasure %who heals
    f4 c2( f2) f4 f f f f f bes,2. bes4 bes2 \cadenzaMeasure %the lord
    f'4 \hideNotes f f \unHideNotes f c2 c f1 \cadenzaMeasure %longsuffering
    f4 f c2( f2) f2 f4 bes,2 \cadenzaMeasure %bless
    f'4 f f c2 c f1 \cadenzaOff \fine %blessed
}

VerseOne = \lyricmode {
    Bless the Lord, __ O __ my soul:
    bless -- ed art Thou, O Lord.
    Bless the Lord, __ O __ my soul
    and all that is with -- in __ me,
    bless His Ho -- ly name.
    Bless the Lord, __ O __ my soul:
    and forget not all His ben -- e -- fits:
    Who for -- gives __ all thine in -- i -- qui -- ties,
    Who heals all thy dis -- eas -- es
    The Lord __ is com -- pass -- ion -- ate and mer -- ci -- ful,
    long suffering and of great good -- ness
    Bless the Lord, __ O __ my soul:
    bless -- ed art Thou, O Lord
    }


\include "C:/Users/Zhao/Choir Book/lilypond/ly/choirbook-satb-unmetered.ly"
