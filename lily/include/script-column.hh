/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 1999--2012 Han-Wen Nienhuys <hanwen@xs4all.nl>

  LilyPond is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  LilyPond is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with LilyPond.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef Script_COLUMN_HH
#define Script_COLUMN_HH

#include "lily-proto.hh"
#include "grob-interface.hh"
#include "std-vector.hh"

class Script_column
{
public:
  static void add_side_positioned (Grob *, Grob *);
  DECLARE_SCHEME_CALLBACK (before_line_breaking, (SCM));
  DECLARE_SCHEME_CALLBACK (row_before_line_breaking, (SCM));
  DECLARE_GROB_INTERFACE ();
  static void order_grobs (vector<Grob *> grobs);

};

#endif /* Script_COLUMN_HH */

