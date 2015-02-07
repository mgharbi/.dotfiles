include_directories(${inc})

set(main_src
    main.cpp
)

include_directories( ${OpenCV_INCLUDE_DIRS} )

add_executable(main
    ${main_src}
)

target_link_libraries(main
    ${Boost_LIBRARIES}
)
