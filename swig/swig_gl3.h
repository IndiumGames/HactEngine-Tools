/* 
 * gl3.h last updated on $Date: 2013-02-12 14:37:24 -0800 (Tue, 12 Feb 2013) $
 */

/*
** Copyright (c) 2007-2013 The Khronos Group Inc.
**
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and/or associated documentation files (the
** "Materials"), to deal in the Materials without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Materials, and to
** permit persons to whom the Materials are furnished to do so, subject to
** the following conditions:
**
** The above copyright notice and this permission notice shall be included
** in all copies or substantial portions of the Materials.
**
** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
*/

/*-------------------------------------------------------------------------
 * Data type definitions
 *-----------------------------------------------------------------------*/

/* OpenGL */
typedef unsigned int    GLenum;
typedef unsigned char   GLboolean;
typedef unsigned int    GLbitfield;
typedef void            GLvoid;
typedef signed char     GLbyte;     /* 1-byte signed */
typedef short           GLshort;    /* 2-byte signed */
typedef int             GLint;      /* 4-byte signed */
typedef unsigned char   GLubyte;    /* 1-byte unsigned */
typedef unsigned short  GLushort;   /* 2-byte unsigned */
typedef unsigned int    GLuint;     /* 4-byte unsigned */
typedef int             GLsizei;    /* 4-byte signed */
typedef float           GLfloat;    /* single precision float */
typedef float           GLclampf;   /* single precision float in [0,1] */
typedef double          GLdouble;   /* double precision float */
//ANDROID//typedef double          GLclampd;   /* double precision float in [0,1] */

/* OpenGL ES 2.0 */

typedef void             GLvoid;
typedef char             GLchar;
typedef unsigned int     GLenum;
typedef unsigned char    GLboolean;
typedef unsigned int     GLbitfield;
//typedef khronos_int8_t   GLbyte;
typedef short            GLshort;
typedef int              GLint;
typedef int              GLsizei;
//typedef khronos_uint8_t  GLubyte;
typedef unsigned short   GLushort;
typedef unsigned int     GLuint;
//typedef khronos_float_t  GLfloat;
//typedef khronos_float_t  GLclampf;
typedef int32_t  GLfixed;
typedef intptr_t GLintptr;
//typedef khronos_ssize_t  GLsizeiptr;

/* OpenGL ES 3.0 */

typedef unsigned short   GLhalf;
typedef int64_t  GLint64;
typedef uint64_t GLuint64;
typedef struct __GLsync *GLsync;

/*-------------------------------------------------------------------------
 * Token definitions
 *-----------------------------------------------------------------------*/

/* OpenGL ES core versions */
#define GL_ES_VERSION_3_0                                1
#define GL_ES_VERSION_2_0                                1

/* OpenGL ES 2.0 */

/* ClearBufferMask */
#define GL_DEPTH_BUFFER_BIT                              0x00000100
#define GL_STENCIL_BUFFER_BIT                            0x00000400
#define GL_COLOR_BUFFER_BIT                              0x00004000

/* Boolean */
#define GL_FALSE                                         0
#define GL_TRUE                                          1

/* BeginMode */
#define GL_POINTS                                        0x0000
#define GL_LINES                                         0x0001
#define GL_LINE_LOOP                                     0x0002
#define GL_LINE_STRIP                                    0x0003
#define GL_TRIANGLES                                     0x0004
#define GL_TRIANGLE_STRIP                                0x0005
#define GL_TRIANGLE_FAN                                  0x0006

/* BlendingFactorDest */
#define GL_ZERO                                          0
#define GL_ONE                                           1
#define GL_SRC_COLOR                                     0x0300
#define GL_ONE_MINUS_SRC_COLOR                           0x0301
#define GL_SRC_ALPHA                                     0x0302
#define GL_ONE_MINUS_SRC_ALPHA                           0x0303
#define GL_DST_ALPHA                                     0x0304
#define GL_ONE_MINUS_DST_ALPHA                           0x0305

/* BlendingFactorSrc */
/*      GL_ZERO */
/*      GL_ONE */
#define GL_DST_COLOR                                     0x0306
#define GL_ONE_MINUS_DST_COLOR                           0x0307
#define GL_SRC_ALPHA_SATURATE                            0x0308
/*      GL_SRC_ALPHA */
/*      GL_ONE_MINUS_SRC_ALPHA */
/*      GL_DST_ALPHA */
/*      GL_ONE_MINUS_DST_ALPHA */

/* BlendEquationSeparate */
#define GL_FUNC_ADD                                      0x8006
#define GL_BLEND_EQUATION                                0x8009
#define GL_BLEND_EQUATION_RGB                            0x8009    /* same as BLEND_EQUATION */
#define GL_BLEND_EQUATION_ALPHA                          0x883D

/* BlendSubtract */
#define GL_FUNC_SUBTRACT                                 0x800A
#define GL_FUNC_REVERSE_SUBTRACT                         0x800B

/* Separate Blend Functions */
#define GL_BLEND_DST_RGB                                 0x80C8
#define GL_BLEND_SRC_RGB                                 0x80C9
#define GL_BLEND_DST_ALPHA                               0x80CA
#define GL_BLEND_SRC_ALPHA                               0x80CB
#define GL_CONSTANT_COLOR                                0x8001
#define GL_ONE_MINUS_CONSTANT_COLOR                      0x8002
#define GL_CONSTANT_ALPHA                                0x8003
#define GL_ONE_MINUS_CONSTANT_ALPHA                      0x8004
#define GL_BLEND_COLOR                                   0x8005

/* Buffer Objects */
#define GL_ARRAY_BUFFER                                  0x8892
#define GL_ELEMENT_ARRAY_BUFFER                          0x8893
#define GL_ARRAY_BUFFER_BINDING                          0x8894
#define GL_ELEMENT_ARRAY_BUFFER_BINDING                  0x8895

#define GL_STREAM_DRAW                                   0x88E0
#define GL_STATIC_DRAW                                   0x88E4
#define GL_DYNAMIC_DRAW                                  0x88E8

#define GL_BUFFER_SIZE                                   0x8764
#define GL_BUFFER_USAGE                                  0x8765

#define GL_CURRENT_VERTEX_ATTRIB                         0x8626

/* CullFaceMode */
#define GL_FRONT                                         0x0404
#define GL_BACK                                          0x0405
#define GL_FRONT_AND_BACK                                0x0408

/* DepthFunction */
/*      GL_NEVER */
/*      GL_LESS */
/*      GL_EQUAL */
/*      GL_LEQUAL */
/*      GL_GREATER */
/*      GL_NOTEQUAL */
/*      GL_GEQUAL */
/*      GL_ALWAYS */

/* EnableCap */
#define GL_TEXTURE_2D                                    0x0DE1
#define GL_CULL_FACE                                     0x0B44
#define GL_BLEND                                         0x0BE2
#define GL_DITHER                                        0x0BD0
#define GL_STENCIL_TEST                                  0x0B90
#define GL_DEPTH_TEST                                    0x0B71
#define GL_SCISSOR_TEST                                  0x0C11
#define GL_POLYGON_OFFSET_FILL                           0x8037
#define GL_SAMPLE_ALPHA_TO_COVERAGE                      0x809E
#define GL_SAMPLE_COVERAGE                               0x80A0

/* ErrorCode */
#define GL_NO_ERROR                                      0
#define GL_INVALID_ENUM                                  0x0500
#define GL_INVALID_VALUE                                 0x0501
#define GL_INVALID_OPERATION                             0x0502
#define GL_OUT_OF_MEMORY                                 0x0505

/* FrontFaceDirection */
#define GL_CW                                            0x0900
#define GL_CCW                                           0x0901

/* GetPName */
#define GL_LINE_WIDTH                                    0x0B21
#define GL_ALIASED_POINT_SIZE_RANGE                      0x846D
#define GL_ALIASED_LINE_WIDTH_RANGE                      0x846E
#define GL_CULL_FACE_MODE                                0x0B45
#define GL_FRONT_FACE                                    0x0B46
#define GL_DEPTH_RANGE                                   0x0B70
#define GL_DEPTH_WRITEMASK                               0x0B72
#define GL_DEPTH_CLEAR_VALUE                             0x0B73
#define GL_DEPTH_FUNC                                    0x0B74
#define GL_STENCIL_CLEAR_VALUE                           0x0B91
#define GL_STENCIL_FUNC                                  0x0B92
#define GL_STENCIL_FAIL                                  0x0B94
#define GL_STENCIL_PASS_DEPTH_FAIL                       0x0B95
#define GL_STENCIL_PASS_DEPTH_PASS                       0x0B96
#define GL_STENCIL_REF                                   0x0B97
#define GL_STENCIL_VALUE_MASK                            0x0B93
#define GL_STENCIL_WRITEMASK                             0x0B98
#define GL_STENCIL_BACK_FUNC                             0x8800
#define GL_STENCIL_BACK_FAIL                             0x8801
#define GL_STENCIL_BACK_PASS_DEPTH_FAIL                  0x8802
#define GL_STENCIL_BACK_PASS_DEPTH_PASS                  0x8803
#define GL_STENCIL_BACK_REF                              0x8CA3
#define GL_STENCIL_BACK_VALUE_MASK                       0x8CA4
#define GL_STENCIL_BACK_WRITEMASK                        0x8CA5
#define GL_VIEWPORT                                      0x0BA2
#define GL_SCISSOR_BOX                                   0x0C10
/*      GL_SCISSOR_TEST */
#define GL_COLOR_CLEAR_VALUE                             0x0C22
#define GL_COLOR_WRITEMASK                               0x0C23
#define GL_UNPACK_ALIGNMENT                              0x0CF5
#define GL_PACK_ALIGNMENT                                0x0D05
#define GL_MAX_TEXTURE_SIZE                              0x0D33
#define GL_MAX_VIEWPORT_DIMS                             0x0D3A
#define GL_SUBPIXEL_BITS                                 0x0D50
#define GL_RED_BITS                                      0x0D52
#define GL_GREEN_BITS                                    0x0D53
#define GL_BLUE_BITS                                     0x0D54
#define GL_ALPHA_BITS                                    0x0D55
#define GL_DEPTH_BITS                                    0x0D56
#define GL_STENCIL_BITS                                  0x0D57
#define GL_POLYGON_OFFSET_UNITS                          0x2A00
/*      GL_POLYGON_OFFSET_FILL */
#define GL_POLYGON_OFFSET_FACTOR                         0x8038
#define GL_TEXTURE_BINDING_2D                            0x8069
#define GL_SAMPLE_BUFFERS                                0x80A8
#define GL_SAMPLES                                       0x80A9
#define GL_SAMPLE_COVERAGE_VALUE                         0x80AA
#define GL_SAMPLE_COVERAGE_INVERT                        0x80AB

/* GetTextureParameter */
/*      GL_TEXTURE_MAG_FILTER */
/*      GL_TEXTURE_MIN_FILTER */
/*      GL_TEXTURE_WRAP_S */
/*      GL_TEXTURE_WRAP_T */

#define GL_NUM_COMPRESSED_TEXTURE_FORMATS                0x86A2
#define GL_COMPRESSED_TEXTURE_FORMATS                    0x86A3

/* HintMode */
#define GL_DONT_CARE                                     0x1100
#define GL_FASTEST                                       0x1101
#define GL_NICEST                                        0x1102

/* HintTarget */
#define GL_GENERATE_MIPMAP_HINT                          0x8192

/* DataType */
#define GL_BYTE                                          0x1400
#define GL_UNSIGNED_BYTE                                 0x1401
#define GL_SHORT                                         0x1402
#define GL_UNSIGNED_SHORT                                0x1403
#define GL_INT                                           0x1404
#define GL_UNSIGNED_INT                                  0x1405
#define GL_FLOAT                                         0x1406
#define GL_FIXED                                         0x140C

/* PixelFormat */
#define GL_DEPTH_COMPONENT                               0x1902
#define GL_ALPHA                                         0x1906
#define GL_RGB                                           0x1907
#define GL_RGBA                                          0x1908
#define GL_LUMINANCE                                     0x1909
#define GL_LUMINANCE_ALPHA                               0x190A

/* PixelType */
/*      GL_UNSIGNED_BYTE */
#define GL_UNSIGNED_SHORT_4_4_4_4                        0x8033
#define GL_UNSIGNED_SHORT_5_5_5_1                        0x8034
#define GL_UNSIGNED_SHORT_5_6_5                          0x8363

/* Shaders */
#define GL_FRAGMENT_SHADER                               0x8B30
#define GL_VERTEX_SHADER                                 0x8B31
#define GL_MAX_VERTEX_ATTRIBS                            0x8869
#define GL_MAX_VERTEX_UNIFORM_VECTORS                    0x8DFB
#define GL_MAX_VARYING_VECTORS                           0x8DFC
#define GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS              0x8B4D
#define GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS                0x8B4C
#define GL_MAX_TEXTURE_IMAGE_UNITS                       0x8872
#define GL_MAX_FRAGMENT_UNIFORM_VECTORS                  0x8DFD
#define GL_SHADER_TYPE                                   0x8B4F
#define GL_DELETE_STATUS                                 0x8B80
#define GL_LINK_STATUS                                   0x8B82
#define GL_VALIDATE_STATUS                               0x8B83
#define GL_ATTACHED_SHADERS                              0x8B85
#define GL_ACTIVE_UNIFORMS                               0x8B86
#define GL_ACTIVE_UNIFORM_MAX_LENGTH                     0x8B87
#define GL_ACTIVE_ATTRIBUTES                             0x8B89
#define GL_ACTIVE_ATTRIBUTE_MAX_LENGTH                   0x8B8A
#define GL_SHADING_LANGUAGE_VERSION                      0x8B8C
#define GL_CURRENT_PROGRAM                               0x8B8D

/* StencilFunction */
#define GL_NEVER                                         0x0200
#define GL_LESS                                          0x0201
#define GL_EQUAL                                         0x0202
#define GL_LEQUAL                                        0x0203
#define GL_GREATER                                       0x0204
#define GL_NOTEQUAL                                      0x0205
#define GL_GEQUAL                                        0x0206
#define GL_ALWAYS                                        0x0207

/* StencilOp */
/*      GL_ZERO */
#define GL_KEEP                                          0x1E00
#define GL_REPLACE                                       0x1E01
#define GL_INCR                                          0x1E02
#define GL_DECR                                          0x1E03
#define GL_INVERT                                        0x150A
#define GL_INCR_WRAP                                     0x8507
#define GL_DECR_WRAP                                     0x8508

/* StringName */
#define GL_VENDOR                                        0x1F00
#define GL_RENDERER                                      0x1F01
#define GL_VERSION                                       0x1F02
#define GL_EXTENSIONS                                    0x1F03

/* TextureMagFilter */
#define GL_NEAREST                                       0x2600
#define GL_LINEAR                                        0x2601

/* TextureMinFilter */
/*      GL_NEAREST */
/*      GL_LINEAR */
#define GL_NEAREST_MIPMAP_NEAREST                        0x2700
#define GL_LINEAR_MIPMAP_NEAREST                         0x2701
#define GL_NEAREST_MIPMAP_LINEAR                         0x2702
#define GL_LINEAR_MIPMAP_LINEAR                          0x2703

/* TextureParameterName */
#define GL_TEXTURE_MAG_FILTER                            0x2800
#define GL_TEXTURE_MIN_FILTER                            0x2801
#define GL_TEXTURE_WRAP_S                                0x2802
#define GL_TEXTURE_WRAP_T                                0x2803

/* TextureTarget */
/*      GL_TEXTURE_2D */
#define GL_TEXTURE                                       0x1702

#define GL_TEXTURE_CUBE_MAP                              0x8513
#define GL_TEXTURE_BINDING_CUBE_MAP                      0x8514
#define GL_TEXTURE_CUBE_MAP_POSITIVE_X                   0x8515
#define GL_TEXTURE_CUBE_MAP_NEGATIVE_X                   0x8516
#define GL_TEXTURE_CUBE_MAP_POSITIVE_Y                   0x8517
#define GL_TEXTURE_CUBE_MAP_NEGATIVE_Y                   0x8518
#define GL_TEXTURE_CUBE_MAP_POSITIVE_Z                   0x8519
#define GL_TEXTURE_CUBE_MAP_NEGATIVE_Z                   0x851A
#define GL_MAX_CUBE_MAP_TEXTURE_SIZE                     0x851C

/* TextureUnit */
#define GL_TEXTURE0                                      0x84C0
#define GL_TEXTURE1                                      0x84C1
#define GL_TEXTURE2                                      0x84C2
#define GL_TEXTURE3                                      0x84C3
#define GL_TEXTURE4                                      0x84C4
#define GL_TEXTURE5                                      0x84C5
#define GL_TEXTURE6                                      0x84C6
#define GL_TEXTURE7                                      0x84C7
#define GL_TEXTURE8                                      0x84C8
#define GL_TEXTURE9                                      0x84C9
#define GL_TEXTURE10                                     0x84CA
#define GL_TEXTURE11                                     0x84CB
#define GL_TEXTURE12                                     0x84CC
#define GL_TEXTURE13                                     0x84CD
#define GL_TEXTURE14                                     0x84CE
#define GL_TEXTURE15                                     0x84CF
#define GL_TEXTURE16                                     0x84D0
#define GL_TEXTURE17                                     0x84D1
#define GL_TEXTURE18                                     0x84D2
#define GL_TEXTURE19                                     0x84D3
#define GL_TEXTURE20                                     0x84D4
#define GL_TEXTURE21                                     0x84D5
#define GL_TEXTURE22                                     0x84D6
#define GL_TEXTURE23                                     0x84D7
#define GL_TEXTURE24                                     0x84D8
#define GL_TEXTURE25                                     0x84D9
#define GL_TEXTURE26                                     0x84DA
#define GL_TEXTURE27                                     0x84DB
#define GL_TEXTURE28                                     0x84DC
#define GL_TEXTURE29                                     0x84DD
#define GL_TEXTURE30                                     0x84DE
#define GL_TEXTURE31                                     0x84DF
#define GL_ACTIVE_TEXTURE                                0x84E0

/* TextureWrapMode */
#define GL_REPEAT                                        0x2901
#define GL_CLAMP_TO_EDGE                                 0x812F
#define GL_MIRRORED_REPEAT                               0x8370

/* Uniform Types */
#define GL_FLOAT_VEC2                                    0x8B50
#define GL_FLOAT_VEC3                                    0x8B51
#define GL_FLOAT_VEC4                                    0x8B52
#define GL_INT_VEC2                                      0x8B53
#define GL_INT_VEC3                                      0x8B54
#define GL_INT_VEC4                                      0x8B55
#define GL_BOOL                                          0x8B56
#define GL_BOOL_VEC2                                     0x8B57
#define GL_BOOL_VEC3                                     0x8B58
#define GL_BOOL_VEC4                                     0x8B59
#define GL_FLOAT_MAT2                                    0x8B5A
#define GL_FLOAT_MAT3                                    0x8B5B
#define GL_FLOAT_MAT4                                    0x8B5C
#define GL_SAMPLER_2D                                    0x8B5E
#define GL_SAMPLER_CUBE                                  0x8B60

/* Vertex Arrays */
#define GL_VERTEX_ATTRIB_ARRAY_ENABLED                   0x8622
#define GL_VERTEX_ATTRIB_ARRAY_SIZE                      0x8623
#define GL_VERTEX_ATTRIB_ARRAY_STRIDE                    0x8624
#define GL_VERTEX_ATTRIB_ARRAY_TYPE                      0x8625
#define GL_VERTEX_ATTRIB_ARRAY_NORMALIZED                0x886A
#define GL_VERTEX_ATTRIB_ARRAY_POINTER                   0x8645
#define GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING            0x889F

/* Read Format */
#define GL_IMPLEMENTATION_COLOR_READ_TYPE                0x8B9A
#define GL_IMPLEMENTATION_COLOR_READ_FORMAT              0x8B9B

/* Shader Source */
#define GL_COMPILE_STATUS                                0x8B81
#define GL_INFO_LOG_LENGTH                               0x8B84
#define GL_SHADER_SOURCE_LENGTH                          0x8B88
#define GL_SHADER_COMPILER                               0x8DFA

/* Shader Binary */
#define GL_SHADER_BINARY_FORMATS                         0x8DF8
#define GL_NUM_SHADER_BINARY_FORMATS                     0x8DF9

/* Shader Precision-Specified Types */
#define GL_LOW_FLOAT                                     0x8DF0
#define GL_MEDIUM_FLOAT                                  0x8DF1
#define GL_HIGH_FLOAT                                    0x8DF2
#define GL_LOW_INT                                       0x8DF3
#define GL_MEDIUM_INT                                    0x8DF4
#define GL_HIGH_INT                                      0x8DF5

/* Framebuffer Object. */
#define GL_FRAMEBUFFER                                   0x8D40
#define GL_RENDERBUFFER                                  0x8D41

#define GL_RGBA4                                         0x8056
#define GL_RGB5_A1                                       0x8057
#define GL_RGB565                                        0x8D62
#define GL_DEPTH_COMPONENT16                             0x81A5
#define GL_STENCIL_INDEX8                                0x8D48

#define GL_RENDERBUFFER_WIDTH                            0x8D42
#define GL_RENDERBUFFER_HEIGHT                           0x8D43
#define GL_RENDERBUFFER_INTERNAL_FORMAT                  0x8D44
#define GL_RENDERBUFFER_RED_SIZE                         0x8D50
#define GL_RENDERBUFFER_GREEN_SIZE                       0x8D51
#define GL_RENDERBUFFER_BLUE_SIZE                        0x8D52
#define GL_RENDERBUFFER_ALPHA_SIZE                       0x8D53
#define GL_RENDERBUFFER_DEPTH_SIZE                       0x8D54
#define GL_RENDERBUFFER_STENCIL_SIZE                     0x8D55

#define GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE            0x8CD0
#define GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME            0x8CD1
#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL          0x8CD2
#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE  0x8CD3

#define GL_COLOR_ATTACHMENT0                             0x8CE0
#define GL_DEPTH_ATTACHMENT                              0x8D00
#define GL_STENCIL_ATTACHMENT                            0x8D20

#define GL_NONE                                          0

#define GL_FRAMEBUFFER_COMPLETE                          0x8CD5
#define GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT             0x8CD6
#define GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT     0x8CD7
#define GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS             0x8CD9
#define GL_FRAMEBUFFER_UNSUPPORTED                       0x8CDD

#define GL_FRAMEBUFFER_BINDING                           0x8CA6
#define GL_RENDERBUFFER_BINDING                          0x8CA7
#define GL_MAX_RENDERBUFFER_SIZE                         0x84E8

#define GL_INVALID_FRAMEBUFFER_OPERATION                 0x0506

/* OpenGL ES 3.0 */

#define GL_READ_BUFFER                                   0x0C02
#define GL_UNPACK_ROW_LENGTH                             0x0CF2
#define GL_UNPACK_SKIP_ROWS                              0x0CF3
#define GL_UNPACK_SKIP_PIXELS                            0x0CF4
#define GL_PACK_ROW_LENGTH                               0x0D02
#define GL_PACK_SKIP_ROWS                                0x0D03
#define GL_PACK_SKIP_PIXELS                              0x0D04
#define GL_COLOR                                         0x1800
#define GL_DEPTH                                         0x1801
#define GL_STENCIL                                       0x1802
#define GL_RED                                           0x1903
#define GL_RGB8                                          0x8051
#define GL_RGBA8                                         0x8058
#define GL_RGB10_A2                                      0x8059
#define GL_TEXTURE_BINDING_3D                            0x806A
#define GL_UNPACK_SKIP_IMAGES                            0x806D
#define GL_UNPACK_IMAGE_HEIGHT                           0x806E
#define GL_TEXTURE_3D                                    0x806F
#define GL_TEXTURE_WRAP_R                                0x8072
#define GL_MAX_3D_TEXTURE_SIZE                           0x8073
#define GL_UNSIGNED_INT_2_10_10_10_REV                   0x8368
#define GL_MAX_ELEMENTS_VERTICES                         0x80E8
#define GL_MAX_ELEMENTS_INDICES                          0x80E9
#define GL_TEXTURE_MIN_LOD                               0x813A
#define GL_TEXTURE_MAX_LOD                               0x813B
#define GL_TEXTURE_BASE_LEVEL                            0x813C
#define GL_TEXTURE_MAX_LEVEL                             0x813D
#define GL_MIN                                           0x8007
#define GL_MAX                                           0x8008
#define GL_DEPTH_COMPONENT24                             0x81A6
#define GL_MAX_TEXTURE_LOD_BIAS                          0x84FD
#define GL_TEXTURE_COMPARE_MODE                          0x884C
#define GL_TEXTURE_COMPARE_FUNC                          0x884D
#define GL_CURRENT_QUERY                                 0x8865
#define GL_QUERY_RESULT                                  0x8866
#define GL_QUERY_RESULT_AVAILABLE                        0x8867
#define GL_BUFFER_MAPPED                                 0x88BC
#define GL_BUFFER_MAP_POINTER                            0x88BD
#define GL_STREAM_READ                                   0x88E1
#define GL_STREAM_COPY                                   0x88E2
#define GL_STATIC_READ                                   0x88E5
#define GL_STATIC_COPY                                   0x88E6
#define GL_DYNAMIC_READ                                  0x88E9
#define GL_DYNAMIC_COPY                                  0x88EA
#define GL_MAX_DRAW_BUFFERS                              0x8824
#define GL_DRAW_BUFFER0                                  0x8825
#define GL_DRAW_BUFFER1                                  0x8826
#define GL_DRAW_BUFFER2                                  0x8827
#define GL_DRAW_BUFFER3                                  0x8828
#define GL_DRAW_BUFFER4                                  0x8829
#define GL_DRAW_BUFFER5                                  0x882A
#define GL_DRAW_BUFFER6                                  0x882B
#define GL_DRAW_BUFFER7                                  0x882C
#define GL_DRAW_BUFFER8                                  0x882D
#define GL_DRAW_BUFFER9                                  0x882E
#define GL_DRAW_BUFFER10                                 0x882F
#define GL_DRAW_BUFFER11                                 0x8830
#define GL_DRAW_BUFFER12                                 0x8831
#define GL_DRAW_BUFFER13                                 0x8832
#define GL_DRAW_BUFFER14                                 0x8833
#define GL_DRAW_BUFFER15                                 0x8834
#define GL_MAX_FRAGMENT_UNIFORM_COMPONENTS               0x8B49
#define GL_MAX_VERTEX_UNIFORM_COMPONENTS                 0x8B4A
#define GL_SAMPLER_3D                                    0x8B5F
#define GL_SAMPLER_2D_SHADOW                             0x8B62
#define GL_FRAGMENT_SHADER_DERIVATIVE_HINT               0x8B8B
#define GL_PIXEL_PACK_BUFFER                             0x88EB
#define GL_PIXEL_UNPACK_BUFFER                           0x88EC
#define GL_PIXEL_PACK_BUFFER_BINDING                     0x88ED
#define GL_PIXEL_UNPACK_BUFFER_BINDING                   0x88EF
#define GL_FLOAT_MAT2x3                                  0x8B65
#define GL_FLOAT_MAT2x4                                  0x8B66
#define GL_FLOAT_MAT3x2                                  0x8B67
#define GL_FLOAT_MAT3x4                                  0x8B68
#define GL_FLOAT_MAT4x2                                  0x8B69
#define GL_FLOAT_MAT4x3                                  0x8B6A
#define GL_SRGB                                          0x8C40
#define GL_SRGB8                                         0x8C41
#define GL_SRGB8_ALPHA8                                  0x8C43
#define GL_COMPARE_REF_TO_TEXTURE                        0x884E
#define GL_MAJOR_VERSION                                 0x821B
#define GL_MINOR_VERSION                                 0x821C
#define GL_NUM_EXTENSIONS                                0x821D
#define GL_RGBA32F                                       0x8814
#define GL_RGB32F                                        0x8815
#define GL_RGBA16F                                       0x881A
#define GL_RGB16F                                        0x881B
#define GL_VERTEX_ATTRIB_ARRAY_INTEGER                   0x88FD
#define GL_MAX_ARRAY_TEXTURE_LAYERS                      0x88FF
#define GL_MIN_PROGRAM_TEXEL_OFFSET                      0x8904
#define GL_MAX_PROGRAM_TEXEL_OFFSET                      0x8905
#define GL_MAX_VARYING_COMPONENTS                        0x8B4B
#define GL_TEXTURE_2D_ARRAY                              0x8C1A
#define GL_TEXTURE_BINDING_2D_ARRAY                      0x8C1D
#define GL_R11F_G11F_B10F                                0x8C3A
#define GL_UNSIGNED_INT_10F_11F_11F_REV                  0x8C3B
#define GL_RGB9_E5                                       0x8C3D
#define GL_UNSIGNED_INT_5_9_9_9_REV                      0x8C3E
#define GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH         0x8C76
#define GL_TRANSFORM_FEEDBACK_BUFFER_MODE                0x8C7F
#define GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS    0x8C80
#define GL_TRANSFORM_FEEDBACK_VARYINGS                   0x8C83
#define GL_TRANSFORM_FEEDBACK_BUFFER_START               0x8C84
#define GL_TRANSFORM_FEEDBACK_BUFFER_SIZE                0x8C85
#define GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN         0x8C88
#define GL_RASTERIZER_DISCARD                            0x8C89
#define GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS 0x8C8A
#define GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS       0x8C8B
#define GL_INTERLEAVED_ATTRIBS                           0x8C8C
#define GL_SEPARATE_ATTRIBS                              0x8C8D
#define GL_TRANSFORM_FEEDBACK_BUFFER                     0x8C8E
#define GL_TRANSFORM_FEEDBACK_BUFFER_BINDING             0x8C8F
#define GL_RGBA32UI                                      0x8D70
#define GL_RGB32UI                                       0x8D71
#define GL_RGBA16UI                                      0x8D76
#define GL_RGB16UI                                       0x8D77
#define GL_RGBA8UI                                       0x8D7C
#define GL_RGB8UI                                        0x8D7D
#define GL_RGBA32I                                       0x8D82
#define GL_RGB32I                                        0x8D83
#define GL_RGBA16I                                       0x8D88
#define GL_RGB16I                                        0x8D89
#define GL_RGBA8I                                        0x8D8E
#define GL_RGB8I                                         0x8D8F
#define GL_RED_INTEGER                                   0x8D94
#define GL_RGB_INTEGER                                   0x8D98
#define GL_RGBA_INTEGER                                  0x8D99
#define GL_SAMPLER_2D_ARRAY                              0x8DC1
#define GL_SAMPLER_2D_ARRAY_SHADOW                       0x8DC4
#define GL_SAMPLER_CUBE_SHADOW                           0x8DC5
#define GL_UNSIGNED_INT_VEC2                             0x8DC6
#define GL_UNSIGNED_INT_VEC3                             0x8DC7
#define GL_UNSIGNED_INT_VEC4                             0x8DC8
#define GL_INT_SAMPLER_2D                                0x8DCA
#define GL_INT_SAMPLER_3D                                0x8DCB
#define GL_INT_SAMPLER_CUBE                              0x8DCC
#define GL_INT_SAMPLER_2D_ARRAY                          0x8DCF
#define GL_UNSIGNED_INT_SAMPLER_2D                       0x8DD2
#define GL_UNSIGNED_INT_SAMPLER_3D                       0x8DD3
#define GL_UNSIGNED_INT_SAMPLER_CUBE                     0x8DD4
#define GL_UNSIGNED_INT_SAMPLER_2D_ARRAY                 0x8DD7
#define GL_BUFFER_ACCESS_FLAGS                           0x911F
#define GL_BUFFER_MAP_LENGTH                             0x9120
#define GL_BUFFER_MAP_OFFSET                             0x9121
#define GL_DEPTH_COMPONENT32F                            0x8CAC
#define GL_DEPTH32F_STENCIL8                             0x8CAD
#define GL_FLOAT_32_UNSIGNED_INT_24_8_REV                0x8DAD
#define GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING         0x8210
#define GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE         0x8211
#define GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE               0x8212
#define GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE             0x8213
#define GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE              0x8214
#define GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE             0x8215
#define GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE             0x8216
#define GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE           0x8217
#define GL_FRAMEBUFFER_DEFAULT                           0x8218
#define GL_FRAMEBUFFER_UNDEFINED                         0x8219
#define GL_DEPTH_STENCIL_ATTACHMENT                      0x821A
#define GL_DEPTH_STENCIL                                 0x84F9
#define GL_UNSIGNED_INT_24_8                             0x84FA
#define GL_DEPTH24_STENCIL8                              0x88F0
#define GL_UNSIGNED_NORMALIZED                           0x8C17
#define GL_DRAW_FRAMEBUFFER_BINDING                      GL_FRAMEBUFFER_BINDING
#define GL_READ_FRAMEBUFFER                              0x8CA8
#define GL_DRAW_FRAMEBUFFER                              0x8CA9
#define GL_READ_FRAMEBUFFER_BINDING                      0x8CAA
#define GL_RENDERBUFFER_SAMPLES                          0x8CAB
#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER          0x8CD4
#define GL_MAX_COLOR_ATTACHMENTS                         0x8CDF
#define GL_COLOR_ATTACHMENT1                             0x8CE1
#define GL_COLOR_ATTACHMENT2                             0x8CE2
#define GL_COLOR_ATTACHMENT3                             0x8CE3
#define GL_COLOR_ATTACHMENT4                             0x8CE4
#define GL_COLOR_ATTACHMENT5                             0x8CE5
#define GL_COLOR_ATTACHMENT6                             0x8CE6
#define GL_COLOR_ATTACHMENT7                             0x8CE7
#define GL_COLOR_ATTACHMENT8                             0x8CE8
#define GL_COLOR_ATTACHMENT9                             0x8CE9
#define GL_COLOR_ATTACHMENT10                            0x8CEA
#define GL_COLOR_ATTACHMENT11                            0x8CEB
#define GL_COLOR_ATTACHMENT12                            0x8CEC
#define GL_COLOR_ATTACHMENT13                            0x8CED
#define GL_COLOR_ATTACHMENT14                            0x8CEE
#define GL_COLOR_ATTACHMENT15                            0x8CEF
#define GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE            0x8D56
#define GL_MAX_SAMPLES                                   0x8D57
#define GL_HALF_FLOAT                                    0x140B
#define GL_MAP_READ_BIT                                  0x0001
#define GL_MAP_WRITE_BIT                                 0x0002
#define GL_MAP_INVALIDATE_RANGE_BIT                      0x0004
#define GL_MAP_INVALIDATE_BUFFER_BIT                     0x0008
#define GL_MAP_FLUSH_EXPLICIT_BIT                        0x0010
#define GL_MAP_UNSYNCHRONIZED_BIT                        0x0020
#define GL_RG                                            0x8227
#define GL_RG_INTEGER                                    0x8228
#define GL_R8                                            0x8229
#define GL_RG8                                           0x822B
#define GL_R16F                                          0x822D
#define GL_R32F                                          0x822E
#define GL_RG16F                                         0x822F
#define GL_RG32F                                         0x8230
#define GL_R8I                                           0x8231
#define GL_R8UI                                          0x8232
#define GL_R16I                                          0x8233
#define GL_R16UI                                         0x8234
#define GL_R32I                                          0x8235
#define GL_R32UI                                         0x8236
#define GL_RG8I                                          0x8237
#define GL_RG8UI                                         0x8238
#define GL_RG16I                                         0x8239
#define GL_RG16UI                                        0x823A
#define GL_RG32I                                         0x823B
#define GL_RG32UI                                        0x823C
#define GL_VERTEX_ARRAY_BINDING                          0x85B5
#define GL_R8_SNORM                                      0x8F94
#define GL_RG8_SNORM                                     0x8F95
#define GL_RGB8_SNORM                                    0x8F96
#define GL_RGBA8_SNORM                                   0x8F97
#define GL_SIGNED_NORMALIZED                             0x8F9C
#define GL_PRIMITIVE_RESTART_FIXED_INDEX                 0x8D69
#define GL_COPY_READ_BUFFER                              0x8F36
#define GL_COPY_WRITE_BUFFER                             0x8F37
#define GL_COPY_READ_BUFFER_BINDING                      GL_COPY_READ_BUFFER
#define GL_COPY_WRITE_BUFFER_BINDING                     GL_COPY_WRITE_BUFFER
#define GL_UNIFORM_BUFFER                                0x8A11
#define GL_UNIFORM_BUFFER_BINDING                        0x8A28
#define GL_UNIFORM_BUFFER_START                          0x8A29
#define GL_UNIFORM_BUFFER_SIZE                           0x8A2A
#define GL_MAX_VERTEX_UNIFORM_BLOCKS                     0x8A2B
#define GL_MAX_FRAGMENT_UNIFORM_BLOCKS                   0x8A2D
#define GL_MAX_COMBINED_UNIFORM_BLOCKS                   0x8A2E
#define GL_MAX_UNIFORM_BUFFER_BINDINGS                   0x8A2F
#define GL_MAX_UNIFORM_BLOCK_SIZE                        0x8A30
#define GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS        0x8A31
#define GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS      0x8A33
#define GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT               0x8A34
#define GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH          0x8A35
#define GL_ACTIVE_UNIFORM_BLOCKS                         0x8A36
#define GL_UNIFORM_TYPE                                  0x8A37
#define GL_UNIFORM_SIZE                                  0x8A38
#define GL_UNIFORM_NAME_LENGTH                           0x8A39
#define GL_UNIFORM_BLOCK_INDEX                           0x8A3A
#define GL_UNIFORM_OFFSET                                0x8A3B
#define GL_UNIFORM_ARRAY_STRIDE                          0x8A3C
#define GL_UNIFORM_MATRIX_STRIDE                         0x8A3D
#define GL_UNIFORM_IS_ROW_MAJOR                          0x8A3E
#define GL_UNIFORM_BLOCK_BINDING                         0x8A3F
#define GL_UNIFORM_BLOCK_DATA_SIZE                       0x8A40
#define GL_UNIFORM_BLOCK_NAME_LENGTH                     0x8A41
#define GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS                 0x8A42
#define GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES          0x8A43
#define GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER     0x8A44
#define GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER   0x8A46
#define GL_INVALID_INDEX                                 0xFFFFFFFFu
#define GL_MAX_VERTEX_OUTPUT_COMPONENTS                  0x9122
#define GL_MAX_FRAGMENT_INPUT_COMPONENTS                 0x9125
#define GL_MAX_SERVER_WAIT_TIMEOUT                       0x9111
#define GL_OBJECT_TYPE                                   0x9112
#define GL_SYNC_CONDITION                                0x9113
#define GL_SYNC_STATUS                                   0x9114
#define GL_SYNC_FLAGS                                    0x9115
#define GL_SYNC_FENCE                                    0x9116
#define GL_SYNC_GPU_COMMANDS_COMPLETE                    0x9117
#define GL_UNSIGNALED                                    0x9118
#define GL_SIGNALED                                      0x9119
#define GL_ALREADY_SIGNALED                              0x911A
#define GL_TIMEOUT_EXPIRED                               0x911B
#define GL_CONDITION_SATISFIED                           0x911C
#define GL_WAIT_FAILED                                   0x911D
#define GL_SYNC_FLUSH_COMMANDS_BIT                       0x00000001
#define GL_TIMEOUT_IGNORED                               0xFFFFFFFFFFFFFFFFull
#define GL_VERTEX_ATTRIB_ARRAY_DIVISOR                   0x88FE
#define GL_ANY_SAMPLES_PASSED                            0x8C2F
#define GL_ANY_SAMPLES_PASSED_CONSERVATIVE               0x8D6A
#define GL_SAMPLER_BINDING                               0x8919
#define GL_RGB10_A2UI                                    0x906F
#define GL_TEXTURE_SWIZZLE_R                             0x8E42
#define GL_TEXTURE_SWIZZLE_G                             0x8E43
#define GL_TEXTURE_SWIZZLE_B                             0x8E44
#define GL_TEXTURE_SWIZZLE_A                             0x8E45
#define GL_GREEN                                         0x1904
#define GL_BLUE                                          0x1905
#define GL_INT_2_10_10_10_REV                            0x8D9F
#define GL_TRANSFORM_FEEDBACK                            0x8E22
#define GL_TRANSFORM_FEEDBACK_PAUSED                     0x8E23
#define GL_TRANSFORM_FEEDBACK_ACTIVE                     0x8E24
#define GL_TRANSFORM_FEEDBACK_BINDING                    0x8E25
#define GL_PROGRAM_BINARY_RETRIEVABLE_HINT               0x8257
#define GL_PROGRAM_BINARY_LENGTH                         0x8741
#define GL_NUM_PROGRAM_BINARY_FORMATS                    0x87FE
#define GL_PROGRAM_BINARY_FORMATS                        0x87FF
#define GL_COMPRESSED_R11_EAC                            0x9270
#define GL_COMPRESSED_SIGNED_R11_EAC                     0x9271
#define GL_COMPRESSED_RG11_EAC                           0x9272
#define GL_COMPRESSED_SIGNED_RG11_EAC                    0x9273
#define GL_COMPRESSED_RGB8_ETC2                          0x9274
#define GL_COMPRESSED_SRGB8_ETC2                         0x9275
#define GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2      0x9276
#define GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2     0x9277
#define GL_COMPRESSED_RGBA8_ETC2_EAC                     0x9278
#define GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC              0x9279
#define GL_TEXTURE_IMMUTABLE_FORMAT                      0x912F
#define GL_MAX_ELEMENT_INDEX                             0x8D6B
#define GL_NUM_SAMPLE_COUNTS                             0x9380
#define GL_TEXTURE_IMMUTABLE_LEVELS                      0x82DF

/*-------------------------------------------------------------------------
 * Entrypoint definitions
 *-----------------------------------------------------------------------*/

/* OpenGL ES 2.0 */

void           glActiveTexture (GLenum texture);
//DESKTOP//void           glAttachShader (GLuint program, GLuint shader);
//DESKTOP//void           glBindAttribLocation (GLuint program, GLuint index, const GLchar* name);
//DESKTOP//void           glBindBuffer (GLenum target, GLuint buffer);
//DESKTOP//void           glBindFramebuffer (GLenum target, GLuint framebuffer);
//DESKTOP//void           glBindRenderbuffer (GLenum target, GLuint renderbuffer);
void           glBindTexture (GLenum target, GLuint texture);
void           glBlendColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
void           glBlendEquation (GLenum mode);
//DESKTOP//void           glBlendEquationSeparate (GLenum modeRGB, GLenum modeAlpha);
void           glBlendFunc (GLenum sfactor, GLenum dfactor);
//DESKTOP//void           glBlendFuncSeparate (GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha);
//DESKTOP//void           glBufferData (GLenum target, GLsizeiptr size, const GLvoid* data, GLenum usage);
//DESKTOP//void           glBufferSubData (GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid* data);
//DESKTOP//GLenum         glCheckFramebufferStatus (GLenum target);
void           glClear (GLbitfield mask);
void           glClearColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
//DESKTOP//void           glClearDepthf (GLfloat depth);
void           glClearStencil (GLint s);
void           glColorMask (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
//DESKTOP//void           glCompileShader (GLuint shader);
void           glCompressedTexImage2D (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid* data);
void           glCompressedTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const GLvoid* data);
void           glCopyTexImage2D (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
void           glCopyTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
//DESKTOP//GLuint         glCreateProgram (void);
//DESKTOP//GLuint         glCreateShader (GLenum type);
void           glCullFace (GLenum mode);
//DESKTOP//void           glDeleteBuffers (GLsizei n, const GLuint* buffers);
//DESKTOP//void           glDeleteFramebuffers (GLsizei n, const GLuint* framebuffers);
//DESKTOP//void           glDeleteProgram (GLuint program);
//DESKTOP//void           glDeleteRenderbuffers (GLsizei n, const GLuint* renderbuffers);
//DESKTOP//void           glDeleteShader (GLuint shader);
void           glDeleteTextures (GLsizei n, const GLuint* textures);
void           glDepthFunc (GLenum func);
void           glDepthMask (GLboolean flag);
//DESKTOP//void           glDepthRangef (GLfloat n, GLfloat f);
//DESKTOP//void           glDetachShader (GLuint program, GLuint shader);
void           glDisable (GLenum cap);
//DESKTOP//void           glDisableVertexAttribArray (GLuint index);
void           glDrawArrays (GLenum mode, GLint first, GLsizei count);
void           glDrawElements (GLenum mode, GLsizei count, GLenum type, const GLvoid* indices);
void           glEnable (GLenum cap);
//DESKTOP//void           glEnableVertexAttribArray (GLuint index);
void           glFinish (void);
void           glFlush (void);
//DESKTOP//void           glFramebufferRenderbuffer (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
//DESKTOP//void           glFramebufferTexture2D (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void           glFrontFace (GLenum mode);
//DESKTOP//void           glGenBuffers (GLsizei n, GLuint* buffers);
//DESKTOP//void           glGenerateMipmap (GLenum target);
//DESKTOP//void           glGenFramebuffers (GLsizei n, GLuint* framebuffers);
//DESKTOP//void           glGenRenderbuffers (GLsizei n, GLuint* renderbuffers);
void           glGenTextures (GLsizei n, GLuint* textures);
//DESKTOP//void           glGetActiveAttrib (GLuint program, GLuint index, GLsizei bufsize, GLsizei* length, GLint* size, GLenum* type, GLchar* name);
//DESKTOP//void           glGetActiveUniform (GLuint program, GLuint index, GLsizei bufsize, GLsizei* length, GLint* size, GLenum* type, GLchar* name);
//DESKTOP//void           glGetAttachedShaders (GLuint program, GLsizei maxcount, GLsizei* count, GLuint* shaders);
//DESKTOP//GLint          glGetAttribLocation (GLuint program, const GLchar* name);
void           glGetBooleanv (GLenum pname, GLboolean* params);
//DESKTOP//void           glGetBufferParameteriv (GLenum target, GLenum pname, GLint* params);
GLenum         glGetError (void);
void           glGetFloatv (GLenum pname, GLfloat* params);
//DESKTOP//void           glGetFramebufferAttachmentParameteriv (GLenum target, GLenum attachment, GLenum pname, GLint* params);
void           glGetIntegerv (GLenum pname, GLint* params);
//DESKTOP//void           glGetProgramiv (GLuint program, GLenum pname, GLint* params);
//DESKTOP//void           glGetProgramInfoLog (GLuint program, GLsizei bufsize, GLsizei* length, GLchar* infolog);
//DESKTOP//void           glGetRenderbufferParameteriv (GLenum target, GLenum pname, GLint* params);
//DESKTOP//void           glGetShaderiv (GLuint shader, GLenum pname, GLint* params);
//DESKTOP//void           glGetShaderInfoLog (GLuint shader, GLsizei bufsize, GLsizei* length, GLchar* infolog);
//DESKTOP//void           glGetShaderPrecisionFormat (GLenum shadertype, GLenum precisiontype, GLint* range, GLint* precision);
//DESKTOP//void           glGetShaderSource (GLuint shader, GLsizei bufsize, GLsizei* length, GLchar* source);
const GLubyte* glGetString (GLenum name);
void           glGetTexParameterfv (GLenum target, GLenum pname, GLfloat* params);
void           glGetTexParameteriv (GLenum target, GLenum pname, GLint* params);
//DESKTOP//void           glGetUniformfv (GLuint program, GLint location, GLfloat* params);
//DESKTOP//void           glGetUniformiv (GLuint program, GLint location, GLint* params);
//DESKTOP//GLint          glGetUniformLocation (GLuint program, const GLchar* name);
//DESKTOP//void           glGetVertexAttribfv (GLuint index, GLenum pname, GLfloat* params);
//DESKTOP//void           glGetVertexAttribiv (GLuint index, GLenum pname, GLint* params);
//DESKTOP//void           glGetVertexAttribPointerv (GLuint index, GLenum pname, GLvoid** pointer);
void           glHint (GLenum target, GLenum mode);
//DESKTOP//GLboolean      glIsBuffer (GLuint buffer);
GLboolean      glIsEnabled (GLenum cap);
//DESKTOP//GLboolean      glIsFramebuffer (GLuint framebuffer);
//DESKTOP//GLboolean      glIsProgram (GLuint program);
//DESKTOP//GLboolean      glIsRenderbuffer (GLuint renderbuffer);
//DESKTOP//GLboolean      glIsShader (GLuint shader);
GLboolean      glIsTexture (GLuint texture);
void           glLineWidth (GLfloat width);
//DESKTOP//void           glLinkProgram (GLuint program);
void           glPixelStorei (GLenum pname, GLint param);
void           glPolygonOffset (GLfloat factor, GLfloat units);
void           glReadPixels (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid* pixels);
//DESKTOP//void           glReleaseShaderCompiler (void);
//DESKTOP//void           glRenderbufferStorage (GLenum target, GLenum internalformat, GLsizei width, GLsizei height);
void           glSampleCoverage (GLfloat value, GLboolean invert);
void           glScissor (GLint x, GLint y, GLsizei width, GLsizei height);
//DESKTOP//void           glShaderBinary (GLsizei n, const GLuint* shaders, GLenum binaryformat, const GLvoid* binary, GLsizei length);
//DESKTOP//void           glShaderSource (GLuint shader, GLsizei count, const GLchar* const* string, const GLint* length);
void           glStencilFunc (GLenum func, GLint ref, GLuint mask);
//DESKTOP//void           glStencilFuncSeparate (GLenum face, GLenum func, GLint ref, GLuint mask);
void           glStencilMask (GLuint mask);
//DESKTOP//void           glStencilMaskSeparate (GLenum face, GLuint mask);
void           glStencilOp (GLenum fail, GLenum zfail, GLenum zpass);
//DESKTOP//void           glStencilOpSeparate (GLenum face, GLenum fail, GLenum zfail, GLenum zpass);
void           glTexImage2D (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid* pixels);
void           glTexParameterf (GLenum target, GLenum pname, GLfloat param);
void           glTexParameterfv (GLenum target, GLenum pname, const GLfloat* params);
void           glTexParameteri (GLenum target, GLenum pname, GLint param);
void           glTexParameteriv (GLenum target, GLenum pname, const GLint* params);
void           glTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid* pixels);
//DESKTOP//void           glUniform1f (GLint location, GLfloat x);
//DESKTOP//void           glUniform1fv (GLint location, GLsizei count, const GLfloat* v);
//DESKTOP//void           glUniform1i (GLint location, GLint x);
//DESKTOP//void           glUniform1iv (GLint location, GLsizei count, const GLint* v);
//DESKTOP//void           glUniform2f (GLint location, GLfloat x, GLfloat y);
//DESKTOP//void           glUniform2fv (GLint location, GLsizei count, const GLfloat* v);
//DESKTOP//void           glUniform2i (GLint location, GLint x, GLint y);
//DESKTOP//void           glUniform2iv (GLint location, GLsizei count, const GLint* v);
//DESKTOP//void           glUniform3f (GLint location, GLfloat x, GLfloat y, GLfloat z);
//DESKTOP//void           glUniform3fv (GLint location, GLsizei count, const GLfloat* v);
//DESKTOP//void           glUniform3i (GLint location, GLint x, GLint y, GLint z);
//DESKTOP//void           glUniform3iv (GLint location, GLsizei count, const GLint* v);
//DESKTOP//void           glUniform4f (GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
//DESKTOP//void           glUniform4fv (GLint location, GLsizei count, const GLfloat* v);
//DESKTOP//void           glUniform4i (GLint location, GLint x, GLint y, GLint z, GLint w);
//DESKTOP//void           glUniform4iv (GLint location, GLsizei count, const GLint* v);
//DESKTOP//void           glUniformMatrix2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
//DESKTOP//void           glUniformMatrix3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
//DESKTOP//void           glUniformMatrix4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
//DESKTOP//void           glUseProgram (GLuint program);
//DESKTOP//void           glValidateProgram (GLuint program);
//DESKTOP//void           glVertexAttrib1f (GLuint indx, GLfloat x);
//DESKTOP//void           glVertexAttrib1fv (GLuint indx, const GLfloat* values);
//DESKTOP//void           glVertexAttrib2f (GLuint indx, GLfloat x, GLfloat y);
//DESKTOP//void           glVertexAttrib2fv (GLuint indx, const GLfloat* values);
//DESKTOP//void           glVertexAttrib3f (GLuint indx, GLfloat x, GLfloat y, GLfloat z);
//DESKTOP//void           glVertexAttrib3fv (GLuint indx, const GLfloat* values);
//DESKTOP//void           glVertexAttrib4f (GLuint indx, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
//DESKTOP//void           glVertexAttrib4fv (GLuint indx, const GLfloat* values);
//DESKTOP//void           glVertexAttribPointer (GLuint indx, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const GLvoid* ptr);
void           glViewport (GLint x, GLint y, GLsizei width, GLsizei height);

/* OpenGL ES 3.0 */

/*
void           glReadBuffer (GLenum mode);
void           glDrawRangeElements (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const GLvoid* indices);
void           glTexImage3D (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const GLvoid* pixels);
void           glTexSubImage3D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const GLvoid* pixels);
void           glCopyTexSubImage3D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void           glCompressedTexImage3D (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const GLvoid* data);
void           glCompressedTexSubImage3D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const GLvoid* data);
void           glGenQueries (GLsizei n, GLuint* ids);
void           glDeleteQueries (GLsizei n, const GLuint* ids);
GLboolean      glIsQuery (GLuint id);
void           glBeginQuery (GLenum target, GLuint id);
void           glEndQuery (GLenum target);
void           glGetQueryiv (GLenum target, GLenum pname, GLint* params);
void           glGetQueryObjectuiv (GLuint id, GLenum pname, GLuint* params);
GLboolean      glUnmapBuffer (GLenum target);
void           glGetBufferPointerv (GLenum target, GLenum pname, GLvoid** params);
void           glDrawBuffers (GLsizei n, const GLenum* bufs);
void           glUniformMatrix2x3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
void           glUniformMatrix3x2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
void           glUniformMatrix2x4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
void           glUniformMatrix4x2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
void           glUniformMatrix3x4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
void           glUniformMatrix4x3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
void           glBlitFramebuffer (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
void           glRenderbufferStorageMultisample (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
void           glFramebufferTextureLayer (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer);
GLvoid*        glMapBufferRange (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access);
void           glFlushMappedBufferRange (GLenum target, GLintptr offset, GLsizeiptr length);
void           glBindVertexArray (GLuint array);
void           glDeleteVertexArrays (GLsizei n, const GLuint* arrays);
void           glGenVertexArrays (GLsizei n, GLuint* arrays);
GLboolean      glIsVertexArray (GLuint array);
void           glGetIntegeri_v (GLenum target, GLuint index, GLint* data);
void           glBeginTransformFeedback (GLenum primitiveMode);
void           glEndTransformFeedback (void);
void           glBindBufferRange (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size);
void           glBindBufferBase (GLenum target, GLuint index, GLuint buffer);
void           glTransformFeedbackVaryings (GLuint program, GLsizei count, const GLchar* const* varyings, GLenum bufferMode);
void           glGetTransformFeedbackVarying (GLuint program, GLuint index, GLsizei bufSize, GLsizei* length, GLsizei* size, GLenum* type, GLchar* name);
void           glVertexAttribIPointer (GLuint index, GLint size, GLenum type, GLsizei stride, const GLvoid* pointer);
void           glGetVertexAttribIiv (GLuint index, GLenum pname, GLint* params);
void           glGetVertexAttribIuiv (GLuint index, GLenum pname, GLuint* params);
void           glVertexAttribI4i (GLuint index, GLint x, GLint y, GLint z, GLint w);
void           glVertexAttribI4ui (GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
void           glVertexAttribI4iv (GLuint index, const GLint* v);
void           glVertexAttribI4uiv (GLuint index, const GLuint* v);
void           glGetUniformuiv (GLuint program, GLint location, GLuint* params);
GLint          glGetFragDataLocation (GLuint program, const GLchar *name);
void           glUniform1ui (GLint location, GLuint v0);
void           glUniform2ui (GLint location, GLuint v0, GLuint v1);
void           glUniform3ui (GLint location, GLuint v0, GLuint v1, GLuint v2);
void           glUniform4ui (GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
void           glUniform1uiv (GLint location, GLsizei count, const GLuint* value);
void           glUniform2uiv (GLint location, GLsizei count, const GLuint* value);
void           glUniform3uiv (GLint location, GLsizei count, const GLuint* value);
void           glUniform4uiv (GLint location, GLsizei count, const GLuint* value);
void           glClearBufferiv (GLenum buffer, GLint drawbuffer, const GLint* value);
void           glClearBufferuiv (GLenum buffer, GLint drawbuffer, const GLuint* value);
void           glClearBufferfv (GLenum buffer, GLint drawbuffer, const GLfloat* value);
void           glClearBufferfi (GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil);
const GLubyte* glGetStringi (GLenum name, GLuint index);
void           glCopyBufferSubData (GLenum readTarget, GLenum writeTarget, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
void           glGetUniformIndices (GLuint program, GLsizei uniformCount, const GLchar* const* uniformNames, GLuint* uniformIndices);
void           glGetActiveUniformsiv (GLuint program, GLsizei uniformCount, const GLuint* uniformIndices, GLenum pname, GLint* params);
GLuint         glGetUniformBlockIndex (GLuint program, const GLchar* uniformBlockName);
void           glGetActiveUniformBlockiv (GLuint program, GLuint uniformBlockIndex, GLenum pname, GLint* params);
void           glGetActiveUniformBlockName (GLuint program, GLuint uniformBlockIndex, GLsizei bufSize, GLsizei* length, GLchar* uniformBlockName);
void           glUniformBlockBinding (GLuint program, GLuint uniformBlockIndex, GLuint uniformBlockBinding);
void           glDrawArraysInstanced (GLenum mode, GLint first, GLsizei count, GLsizei instanceCount);
void           glDrawElementsInstanced (GLenum mode, GLsizei count, GLenum type, const GLvoid* indices, GLsizei instanceCount);
GLsync         glFenceSync (GLenum condition, GLbitfield flags);
GLboolean      glIsSync (GLsync sync);
void           glDeleteSync (GLsync sync);
GLenum         glClientWaitSync (GLsync sync, GLbitfield flags, GLuint64 timeout);
void           glWaitSync (GLsync sync, GLbitfield flags, GLuint64 timeout);
void           glGetInteger64v (GLenum pname, GLint64* params);
void           glGetSynciv (GLsync sync, GLenum pname, GLsizei bufSize, GLsizei* length, GLint* values);
void           glGetInteger64i_v (GLenum target, GLuint index, GLint64* data);
void           glGetBufferParameteri64v (GLenum target, GLenum pname, GLint64* params);
void           glGenSamplers (GLsizei count, GLuint* samplers);
void           glDeleteSamplers (GLsizei count, const GLuint* samplers);
GLboolean      glIsSampler (GLuint sampler);
void           glBindSampler (GLuint unit, GLuint sampler);
void           glSamplerParameteri (GLuint sampler, GLenum pname, GLint param);
void           glSamplerParameteriv (GLuint sampler, GLenum pname, const GLint* param);
void           glSamplerParameterf (GLuint sampler, GLenum pname, GLfloat param);
void           glSamplerParameterfv (GLuint sampler, GLenum pname, const GLfloat* param);
void           glGetSamplerParameteriv (GLuint sampler, GLenum pname, GLint* params);
void           glGetSamplerParameterfv (GLuint sampler, GLenum pname, GLfloat* params);
void           glVertexAttribDivisor (GLuint index, GLuint divisor);
void           glBindTransformFeedback (GLenum target, GLuint id);
void           glDeleteTransformFeedbacks (GLsizei n, const GLuint* ids);
void           glGenTransformFeedbacks (GLsizei n, GLuint* ids);
GLboolean      glIsTransformFeedback (GLuint id);
void           glPauseTransformFeedback (void);
void           glResumeTransformFeedback (void);
void           glGetProgramBinary (GLuint program, GLsizei bufSize, GLsizei* length, GLenum* binaryFormat, GLvoid* binary);
void           glProgramBinary (GLuint program, GLenum binaryFormat, const GLvoid* binary, GLsizei length);
void           glProgramParameteri (GLuint program, GLenum pname, GLint value);
void           glInvalidateFramebuffer (GLenum target, GLsizei numAttachments, const GLenum* attachments);
void           glInvalidateSubFramebuffer (GLenum target, GLsizei numAttachments, const GLenum* attachments, GLint x, GLint y, GLsizei width, GLsizei height);
void           glTexStorage2D (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
void           glTexStorage3D (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
void           glGetInternalformativ (GLenum target, GLenum internalformat, GLenum pname, GLsizei bufSize, GLint* params);
*/
