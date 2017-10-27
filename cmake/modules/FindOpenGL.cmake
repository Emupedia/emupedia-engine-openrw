include("${CMAKE_ROOT}/Modules/FindOpenGL.cmake")

if(OPENGL_FOUND)
  list(GET OPENGL_LIBRARIES 0 OPENGL_FIRST_LIBRARY)
  set(OPENGL_OTHER_LIBRARIES "${OPENGL_LIBRARIES}")
  list(REMOVE_AT OPENGL_OTHER_LIBRARIES 0)
  add_library(OpenGL::OpenGL UNKNOWN IMPORTED)
  set_target_properties(OpenGL::OpenGL PROPERTIES
    IMPORTED_LINK_INTERFACE_LANGUAGES "C;CXX"
    IMPORTED_LOCATION "${OPENGL_FIRST_LIBRARY}"
    INTERFACE_LINK_LIBRARIES "${OPENGL_OTHER_LIBRARIES}"
    INTERFACE_INCLUDE_DIRECTORIES "${OPENGL_INCLUDE_DIR}"
    )
endif()