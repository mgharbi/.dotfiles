CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(<NAME> NONE)

INCLUDE(UseLATEX.cmake)

SET(LATEX_OUTPUT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/build")
SET(out "${CMAKE_CURRENT_SOURCE_DIR}/output")
SET(img "images")
FILE(GLOB_RECURSE contents_files RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "include/*.tex")
message(${contents_files})

ADD_LATEX_DOCUMENT(<name>.tex
  INPUTS ${contents_files}
  BIBFILES "<name>.bib"
  IMAGE_DIRS ${img}
  DEFAULT_SAFEPDF
)

ADD_CUSTOM_COMMAND(TARGET safepdf POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
    ${LATEX_OUTPUT_PATH}/<name>.pdf
    ${out}/<name>.pdf
)
