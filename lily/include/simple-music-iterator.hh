/*   
  simple-music-iterator.hh -- declare Simple_music_iterator
  
  source file of the GNU LilyPond music typesetter
  
  (c) 2000 Han-Wen Nienhuys <hanwen@cs.uu.nl>
 */

#ifndef SIMPLE_MUSIC_ITERATOR_HH
#define SIMPLE_MUSIC_ITERATOR_HH

#include "music-iterator.hh"

class Simple_music_iterator : public Music_iterator
{
protected:
  Moment length_mom_;
  Moment last_processed_mom_;
public:
  VIRTUAL_COPY_CONS (Music_iterator);
  Simple_music_iterator ();
  Simple_music_iterator (Simple_music_iterator const &);
  virtual void process (Moment);
  virtual bool ok ()const;
  virtual void skip (Moment);
  virtual Moment pending_moment ()const;
  virtual void construct_children ();
};

#endif /* SIMPLE_MUSIC_ITERATOR_HH */

