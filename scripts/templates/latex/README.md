
Michael Gharbi <gharbi@mit.edu>


Dependencies
------------

* CMake 2.6


Folder structure
----------------

Images go in the `images/` folder, but are excluded from the repo.

The pdf output is to be found in `output/`


Compiling
---------

Go to the build directory, run cmake, and make the pdf target:

    cd build
    cmake ..
    make

Images
------

Symlink `images` to your dropbox or wherever you stored the images:

    ln -s path/to/your/images images


