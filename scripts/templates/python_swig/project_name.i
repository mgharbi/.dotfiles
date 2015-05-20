%module project_name

%{
#define SWIG_FILE_WITH_INIT
#include "project_name.h"
%}

%include "numpy.i"

%init %{
import_array();
%}

%apply (double* IN_ARRAY3, int DIM1, int DIM2, int DIM3){(double* in, int i_height, int i_width, int i_chan)};
%apply (double* ARGOUT_ARRAY1, int DIM1){(double* out, int numel)}

%include "project_name.h"
