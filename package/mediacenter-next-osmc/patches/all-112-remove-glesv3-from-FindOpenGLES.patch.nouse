From 5a95fc32d91a1ea19ef037ad3b32afaaed242e86 Mon Sep 17 00:00:00 2001
From: Greg McCarthy <greg@gjmccarthy.co.uk>
Date: Wed, 27 Dec 2017 19:39:27 +0000
Subject: [PATCH] Remove GLESv3 from FindOpenGLES

---
 cmake/modules/FindOpenGLES.cmake | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/cmake/modules/FindOpenGLES.cmake b/cmake/modules/FindOpenGLES.cmake
index fac21bc4e8..d21d8f73fd 100644
--- a/cmake/modules/FindOpenGLES.cmake
+++ b/cmake/modules/FindOpenGLES.cmake
@@ -31,14 +31,11 @@ else()
   set(OPENGLES_INCLUDE_DIR ${OPENGLES_gl_LIBRARY}/Headers)
 endif()
 
-find_path(OPENGLES3_INCLUDE_DIR GLES3/gl3.h)
 
 include(FindPackageHandleStandardArgs)
 find_package_handle_standard_args(OpenGLES
                                   REQUIRED_VARS OPENGLES_gl_LIBRARY OPENGLES_INCLUDE_DIR)
 
-find_path(OPENGLES3_INCLUDE_DIR GLES3/gl3.h
-                                PATHS ${PC_OPENGLES_INCLUDEDIR})
 
 if(OPENGLES_FOUND)
   set(OPENGLES_LIBRARIES ${OPENGLES_gl_LIBRARY})
-- 
2.12.3

