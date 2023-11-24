if(WIN32)
    # Need gmp/mpir dllimport decorations (in particular on __mpir_version)
    add_definitions(-DMSC_USE_DLL)
endif()
