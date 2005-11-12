#include "grob.hh"
#include "simple-closure.hh"

SCM
axis_offset_symbol (Axis a)
{
  return a == X_AXIS
    ? ly_symbol2scm ("X-offset")
    : ly_symbol2scm ("Y-offset");
}

SCM
axis_parent_positioning (Axis a)
{
  return (a == X_AXIS)
    ? Grob::x_parent_positioning_proc
    : Grob::y_parent_positioning_proc;
}



/*
  Replace

  (orig-proc GROB)

  by

  (+ (PROC GROB) (orig-proc GROB))
  
*/
void
add_offset_callback (Grob *g, SCM proc, Axis a)
{
  SCM data = g->get_property_data (axis_offset_symbol (a));
  if (!scm_is_number (data)
      && !ly_is_procedure (data)
      && !is_simple_closure (data))
    {
      g->internal_set_property (axis_offset_symbol (a),
				proc);
      return ;
    }

  if (ly_is_procedure (data))
    data = ly_make_simple_closure (scm_list_1  (data));
  else if (is_simple_closure (data))
    data = simple_closure_expression (data);

  SCM plus = ly_lily_module_constant ("+");

  if (ly_is_procedure (proc))
    proc = ly_make_simple_closure (scm_list_1 (proc));
  
  SCM expr = scm_list_3 (plus, proc, data);
  g->internal_set_property (axis_offset_symbol (a),
			    ly_make_simple_closure (expr));
}


/*
  replace

  (orig-proc GROB)

  by

  (PROC GROB (orig-proc GROB)) 

*/
void
chain_offset_callback (Grob *g, SCM proc, Axis a)
{
  SCM data = g->get_property_data (axis_offset_symbol (a));

  if (ly_is_procedure (data))
    data = ly_make_simple_closure (scm_list_1  (data));
  else if (is_simple_closure (data))
    data = simple_closure_expression (data);
  else if (!scm_is_number (data))
    data = scm_from_int (0);
  
  SCM expr = scm_list_2 (proc, data);
  g->internal_set_property (axis_offset_symbol (a),
			    
			    // twice: one as a wrapper for grob property routines,
			    // once for the actual delayed binding. 
			    ly_make_simple_closure (ly_make_simple_closure (expr)));
}
