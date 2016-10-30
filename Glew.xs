#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#define GLEW_STATIC
#include "windows.h"
/* This makes memory requirements balloon but makes building so much easier*/
#include <include/GL/glew.h>
#include <src/glew.c>

#include "const-c.inc"

MODULE = OpenGL::Glew		PACKAGE = OpenGL::Glew		

UV
glewInit()
CODE:
    glewExperimental = GL_TRUE; /* We want everything that is available on this machine */
    RETVAL = glewInit();
OUTPUT:
    RETVAL

SV*
glewGetErrorString(err)
    GLenum err
CODE:
    RETVAL = newSVpv(glewGetErrorString(err),0);
OUTPUT:
    RETVAL

SV*
glewGetString(what)
    GLenum what;
CODE:
    RETVAL = newSVpv(glewGetString(what),0);
OUTPUT:
    RETVAL

SV*
glGetString(what)
    GLenum what;
CODE:
    RETVAL = newSVpv(glGetString(what),0);
OUTPUT:
    RETVAL

GLint
glCreateShader(what)
    GLint what;
CODE:
    if(! __glewCreateShader) {
        croak("glCreateShader not available on this machine");
    };
    printf("XS: Creating %d shader via %x\n", what, __glewCreateShader);
    RETVAL = glCreateShader(what);
    printf("XS: Created shader\n");
OUTPUT:
    RETVAL

GLenum
glGetError();
CODE:
    RETVAL = glGetError();
OUTPUT:
    RETVAL

GLboolean
glewIsSupported(name);
    char* name;
CODE:
    printf("%s\n", name);
    RETVAL = glewIsSupported(name);
    printf("%d\n", RETVAL);
OUTPUT:
    RETVAL


# This isn't a bad idea, but I postpone this API and the corresponding
# typemap hackery until later
#GLboolean
#glAreProgramsResidentNV_p(GLuint* ids);
#PPCODE:
#     SV* buf_res = sv_2mortal(newSVpv("",items * sizeof(GLboolean)));
#     GLboolean* residences = (GLboolean*) SvPV_nolen(buf_res);
#     glAreProgramsResidentNV(items, ids, residences);
#     EXTEND(SP, items);
#     int i2;
#     for( i2 = 0; i2 < items; i2++ ) {
#        PUSHs(sv_2mortal(newSViv(residences[i2])));
#	 };

INCLUDE: const-xs.inc
#INCLUDE: auto-xs.inc
