/*
  mudela-version.cc -- implement Mudela_version

  source file of the GNU LilyPond music typesetter

  (c) 1998 Jan Nieuwenhuizen <jan@digicash.com>

*/

#include "mudela-version.hh"
#include "string-convert.hh"
#include "varray.hh"

Mudela_version::Mudela_version (int major, int minor, int patch)
{
  major_i_ = major;
  minor_i_ = minor;
  patch_i_ = patch;
}

Mudela_version::Mudela_version (String str)
{
  Array<String> version;
  version = String_convert::split_arr (str, '.');
  assert (version.size () == 3);
  major_i_ = version[0].value_i ();
  minor_i_ = version[1].value_i ();
  patch_i_ = version[2].value_i ();
}

String
Mudela_version::str () const
{
  return String (major_i_) + "." + String (minor_i_) + "." + String (patch_i_);
}

Mudela_version::operator int () const
{
    // ugh
  return 100000 * major_i_ + 1000 * minor_i_ + patch_i_;
}

