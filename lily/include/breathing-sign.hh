/*
  breathing-sign.hh

  Copyright (C) 1999 Michael Krause

  written for the GNU LilyPond music typesetter

*/

#ifndef BREATHING_SIGN_HH
#define BREATHING_SIGN_HH

#include "item.hh"
#include "staff-symbol-referencer.hh"
#include "parray.hh"

class Breathing_sign : public Item, public Staff_symbol_referencer {
public:
  VIRTUAL_COPY_CONS(Score_element);
  Breathing_sign ();

  void set_vertical_position (Direction);
  void set_direction (Direction d ) { dir_ =  d; }
  Direction get_direction () const { return dir_; }


protected:
  virtual void do_post_processing ();
  virtual Molecule* do_brew_molecule_p () const;

private:
  Direction dir_;
};

#endif // BREATHING_SIGN_HH
