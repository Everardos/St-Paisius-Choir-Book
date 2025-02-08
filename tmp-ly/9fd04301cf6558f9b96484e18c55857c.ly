%%File header
\version "2.18.2"

#(define inside-lyluatex #t)
#(set-global-staff-size 20)
#(set! paper-alist (cons '("lyluatexfmt" . (cons (* 614.294998 pt) (* 794.969986 pt))) paper-alist))

\include "lilypond-book-preamble.ly"

\header {
    copyright = ""
    tagline = ##f
}
\paper{
    #(set-paper-size "lyluatexfmt")
    two-sided = ##t
    line-width = 365.20002746582\pt
    indent = 0\pt
    % no alignment set
    % fonts not set
}
\layout{
    % no clef set
    % timing not suppressed
    % no time signature set
    % staff symbol not suppressed
    % no fix for badly cropped StaffGroup brackets
}

%%Follows original score
{lilypond/files/99 litanies/obikhod/litany-obikhod-tothee.ly}