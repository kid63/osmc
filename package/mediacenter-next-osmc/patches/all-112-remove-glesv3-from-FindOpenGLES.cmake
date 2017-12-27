From 1049e8fc578b7b85af1d321674d54cf83cec65b4 Mon Sep 17 00:00:00 2001
From: Greg McCarthy <greg@gjmccarthy.co.uk>
Date: Wed, 27 Dec 2017 19:30:05 +0000
Subject: [PATCH] Remove GLESv3 from FindOpenGLES

---
 cmake/modules/FindOpenGLES.cmake | 1 -
 1 file changed, 1 deletion(-)

diff --git a/cmake/modules/FindOpenGLES.cmake b/cmake/modules/FindOpenGLES.cmake
index fac21bc4e8..2d475a97c4 100644
--- a/cmake/modules/FindOpenGLES.cmake
+++ b/cmake/modules/FindOpenGLES.cmake
@@ -31,7 +31,6 @@ else()
   set(OPENGLES_INCLUDE_DIR ${OPENGLES_gl_LIBRARY}/Headers)
 endif()
 
-find_path(OPENGLES3_INCLUDE_DIR GLES3/gl3.h)
 
 include(FindPackageHandleStandardArgs)
 find_package_handle_standard_args(OpenGLES
-- 
2.12.3

