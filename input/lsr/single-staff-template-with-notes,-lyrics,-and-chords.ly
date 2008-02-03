%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.38"

\header {
  lsrtags = "vocal-music, chords, template"
 texidoc = "
This template allows you to prepare a song with melody, words, and
chords. 
" }
% begin verbatim
melody = \relative c' {
            \clef treble
            \key c \major
            \time 4/4
         
            a b c d
         }
         
         text = \lyricmode {
            Aaa Bee Cee Dee
         }
         
         harmonies = \chordmode {
            a2 c2
         }
         
         \score {
            <<
               \new ChordNames {
                  \set chordChanges = ##t
                  \harmonies
               }
            \new Voice = "one" {
               \autoBeamOff
               \melody
            }
            \new Lyrics \lyricsto "one" \text
            >>
            \layout { }
            \midi { }
         }

