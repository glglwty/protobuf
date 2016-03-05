set(MY_CSC "msbuild.exe")
get_filename_component(MY_CSC "${MY_CSC}" PROGRAM)
if(NOT EXISTS "${MY_CSC}")
    message(FATAL_ERROR "Cannot find msbuild.exe. Please install Visual Studio and run cmake within Visual Studio build command console.")
endif()

set(MY_OUTPUT_PATH "${CMAKE_BINARY_DIR}/../lib")
set(BOOST_DIR "${CMAKE_CURRENT_SOURCE_DIR}")

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/${PROJ_NAME}.vcxproj.template" "${CMAKE_CURRENT_SOURCE_DIR}/${PROJ_NAME}.vcxproj")

set(MY_PLATFORM "x64")

execute_process(
    COMMAND ${MY_CSC} "${CMAKE_CURRENT_SOURCE_DIR}/${PROJ_NAME}.vcxproj" "/property:Platform=${MY_PLATFORM}"
    )