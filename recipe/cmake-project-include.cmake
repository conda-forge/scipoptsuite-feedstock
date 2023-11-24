if(WIN32)
    # Need gmp/mpir dllimport decorations (in particular on __mpir_version)
    add_definitions(-DMSC_USE_DLL)

    # winflexbison binaries
    find_program(BISON_EXECUTABLE win_bison)
    find_program(FLEX_EXECUTABLE win_flex)
endif()
