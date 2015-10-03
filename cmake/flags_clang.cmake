if (LRCX_ENABLE_ASAN)
	execute_process(COMMAND ${CMAKE_CXX_COMPILER} -dumpversion
		OUTPUT_VARIABLE CLANG_VERSION)
	if (CLANG_VERSION VERSION_LESS 3.8)
		message(WARNING "Your clang version may not use Address-Sanitizer")
	endif()
	set(LRCX_COMPILER_FLAGS "-fsanitize=address -fno-omit-frame-pointer ${LRCX_COMPILER_FLAGS}")
	set(LRCX_LINKER_FLAGS "-fsanitize=address ${LRCX_LINKER_FLAGS}")
endif()

if (NOT LRCX_NO_LIBCXX)
	set(LRCX_COMPILER_FLAGS "-stdlib=libc++ ${LRCX_COMPILER_FLAGS}")
	set(LRCX_LINKER_FLAGS "-lc++abi ${LRCX_LINKER_FLAGS}")
endif()
