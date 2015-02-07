set(test_src 
    test_suite.cpp
    example_tests.cpp
)

add_executable(test_suite ${test_src})

include_directories(${inc})
include_directories(
  "${GTEST_DIR}/include"
)
set_target_properties(test_suite PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${bin}/test")
target_link_libraries(test_suite
    ${GTEST_DIR}/libgtest.a
)
