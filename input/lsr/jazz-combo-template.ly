%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.38"

\header {
  lsrtags = "piano-music, percussion, guitar, template"
 texidoc = "
This is quite an advanced template, for a jazz ensemble. Note that all
instruments are notated in \\key c \\major. This refers to the key in
concert pitch; LilyPond will automatically transpose the key if the
music is within a \\transpose section.
" }
% begin verbatim
\header {
           title = "Song"
           subtitle = "(tune)"
           composer = "Me"
           meter = "moderato"
           piece = "Swing"
           tagline = \markup {
             \column {
               "LilyPond example file by Amelie Zapf,"
               "Berlin 07/07/2003"
             }
           }
           texidoc = "Jazz tune for combo
                      (horns, guitar, piano, bass, drums)."
         }
         
         #(set-global-staff-size 16)
         \include "english.ly"
         
         %%%%%%%%%%%% Some macros %%%%%%%%%%%%%%%%%%%
         
         sl = {
           \override NoteHead #'style = #'slash
           \override Stem #'transparent = ##t
         }
         nsl = {
           \revert NoteHead #'style
           \revert Stem #'transparent
         }
         cr = \override NoteHead #'style = #'cross
         ncr = \revert NoteHead #'style
         
         %% insert chord name style stuff here.
         
         jzchords = { }
         
         
         %%%%%%%%%%%% Keys'n'thangs %%%%%%%%%%%%%%%%%
         
         global = {
           \time 4/4
         }
         
         Key = { \key c \major }
         
         % ############ Horns ############
         
         % ------ Trumpet ------
         trpt = \transpose c d \relative c'' {
           \Key
           c1 c c
         }
         trpharmony = \transpose c' d {
           \jzchords
         }
         trumpet = {
           \global
           \set Staff.instrumentName = #"Trumpet"
           \clef treble
           <<
             \trpt
           >>
         }
         
         % ------ Alto Saxophone ------
         alto = \transpose c a \relative c' {
           \Key
           c1 c c
         }
         altoharmony = \transpose c' a {
           \jzchords
         }
         altosax = {
           \global
           \set Staff.instrumentName = #"Alto Sax"
           \clef treble
           <<
             \alto
           >>
         }
         
         % ------ Baritone Saxophone ------
         bari = \transpose c a' \relative c {
           \Key
           c1 c \sl d4^"Solo" d d d \nsl
         }
         bariharmony = \transpose c' a \chordmode {
           \jzchords s1 s d2:maj e:m7
         }
         barisax = {
           \global
           \set Staff.instrumentName = #"Bari Sax"
           \clef treble
           <<
             \bari
           >>
         }
         
         % ------ Trombone ------
         tbone = \relative c {
           \Key
           c1 c c
         }
         tboneharmony = \chordmode {
           \jzchords
         }
         trombone = {
           \global
           \set Staff.instrumentName = #"Trombone"
           \clef bass
           <<
             \tbone
           >>
         }
         
         % ############ Rhythm Section #############
         
         % ------ Guitar ------
         gtr = \relative c'' {
           \Key
           c1 \sl b4 b b b \nsl c1
         }
         gtrharmony = \chordmode {
           \jzchords
           s1 c2:min7+ d2:maj9
         }
         guitar = {
           \global
           \set Staff.instrumentName = #"Guitar"
           \clef treble
           <<
             \gtr
           >>
         }
         
         %% ------ Piano ------
         rhUpper = \relative c'' {
           \voiceOne
           \Key
           c1 c c
         }
         rhLower = \relative c' {
           \voiceTwo
           \Key
           e1 e e
         }
         
         lhUpper = \relative c' {
           \voiceOne
           \Key
           g1 g g
         }
         lhLower = \relative c {
           \voiceTwo
           \Key
           c1 c c
         }
         
         PianoRH = {
           \clef treble
           \global
           \set Staff.midiInstrument = "acoustic grand"
           <<
             \new Voice = "one" \rhUpper
             \new Voice = "two" \rhLower
           >>
         }
         PianoLH = {
           \clef bass
           \global
           \set Staff.midiInstrument = "acoustic grand"
           <<
             \new Voice = "one" \lhUpper
             \new Voice = "two" \lhLower
           >>
         }
         
         piano = {
           <<
             \set PianoStaff.instrumentName = #"Piano"
             \new Staff = "upper" \PianoRH
             \new Staff = "lower" \PianoLH
           >>
         }
         
         % ------ Bass Guitar ------
         Bass = \relative c {
           \Key
           c1 c c
         }
         bass = {
           \global
           \set Staff.instrumentName = #"Bass"
           \clef bass
           <<
             \Bass
           >>
         }
         
         % ------ Drums ------
         up = \drummode {
           hh4 <hh sn>4 hh <hh sn> hh <hh sn>4
           hh4 <hh sn>4
           hh4 <hh sn>4
           hh4 <hh sn>4
         }
         
         down = \drummode {
           bd4 s bd s bd s bd s bd s bd s
         }
         
         drumContents = {
           \global
           <<
             \set DrumStaff.instrumentName = #"Drums"
             \new DrumVoice { \voiceOne \up }
             \new DrumVoice { \voiceTwo \down }
           >>
         }
         
         %%%%%%%%% It All Goes Together Here %%%%%%%%%%%%%%%%%%%%%%
         
         \score {
           <<
             \new StaffGroup = "horns" <<
               \new Staff = "trumpet" \trumpet
               \new Staff = "altosax" \altosax
               \new ChordNames = "barichords" \bariharmony
               \new Staff = "barisax" \barisax
               \new Staff = "trombone" \trombone
             >>
         
             \new StaffGroup = "rhythm" <<
               \new ChordNames = "chords" \gtrharmony
               \new Staff = "guitar" \guitar
               \new PianoStaff = "piano" \piano
               \new Staff = "bass" \bass
               \new DrumStaff { \drumContents }
             >>
           >>
         
           \layout {
             \context { \RemoveEmptyStaffContext }
             \context {
               \Score
               \override BarNumber #'padding = #3
               \override RehearsalMark #'padding = #2
               skipBars = ##t
             }
           }
         
           \midi { }
         }
% begin verbatim
