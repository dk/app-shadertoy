OpenGL-Glew / App-Shadertoy version 0.01
========================

![Seascape Shadertoy](https://github.com/Corion/app-shadertoy/raw/master/demo/shadertoy-01-seascape.gif)

This Perl distribution contains an offline runner for shader toys
from https://www.shadertoy.com . It also currently includes the
OpenGL::Glew library, at least until that is merged into the
mainline OpenGL distribution.

The program requires an OpenGL 4 compatible graphics card. Users of
Intel integrated graphics will likely not be able to enjoy this.

INSTALLATION

To install this module type the following:

   perl Makefile.PL
   make
   make test
   make install

DEPENDENCIES

This module requires these other modules and libraries:

  Prima
  Prima::OpenGL 0.07 (not yet on CPAN)

COPYRIGHT AND LICENCE

Put the correct copyright and licence information here.

Copyright (C) 2016 by Max Maischein

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.1 or,
at your option, any later version of Perl 5 you may have available.

This distribution includes the Glew library. See L<http://glew.sourceforge.net/>
and https://github.com/nigels-com/glew#copyright-and-licensing .

This distribution also includes the Seascape shader by TDM.
See https://www.shadertoy.com/view/Ms2SD1 .
