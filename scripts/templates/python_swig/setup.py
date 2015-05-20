from distutils.core import setup, Extension

import numpy
import os

try:
    numpy_include = numpy.get_include()
except AttributeError:
    numpy_include = numpy.get_numpy_include()

# Additional C flags
cargs = [
    "-I",
    "/usr/local/"
]

mghimproc = Extension(
    '_mghimproc',
    sources=['mghimproc.c','mghimproc.i'],
    include_dirs = [numpy_include],
    extra_compile_args = cargs,
)

setup(
        name = 'project_name',
        description = '',
        author = '',
        version = '0.1',
        ext_modules = [mghimproc],
    )
