# Copyright (c) 2025 HKU Robocon Team
# Author: Kdwk (kdwk@connect.hku.hk)

find_package(trolly REQUIRED)
find_package(std_msgs REQUIRED)

function(m2_hello_world_ros2_add_object_library object_name)
    cmake_parse_arguments(ARG "" "" "DEPENDS;AMENT_DEPENDS" ${ARGN})
    m2b_ros2_add_object_library(${object_name} ${ARG_UNPARSED_ARGUMENTS}
        DEPENDS
            trolly::trolly-interface
            ${ARG_DEPENDS}
        AMENT_DEPENDS
            std_msgs
            ${ARG_AMENT_DEPENDS}
    )
endfunction()

function(m2_hello_world_ros2_add_test_object_library object_name)
    cmake_parse_arguments(ARG "" "" "INCLUDES_FROM_PROPERTIES;DEPENDS;AMENT_DEPENDS" ${ARGN})
    m2b_ros2_add_object_library(${object_name} ${ARG_UNPARSED_ARGUMENTS}
        INCLUDES_FROM_PROPERTIES
            m2_hello_world_GTEST_INCLUDES
            ${ARG_INCLUDES_FROM_PROPERTIES}
        DEPENDS
            trolly::trolly-interface
            ${ARG_DEPENDS}
        AMENT_DEPENDS
            std_msgs
            ${ARG_AMENT_DEPENDS}
    )
endfunction()

function(m2_hello_world_ros2_add_library target_name)
    cmake_parse_arguments(ARG "" "" "WHOLE_DEPENDS;AMENT_DEPENDS" ${ARGN})
    m2b_ros2_add_library(${target_name} ${ARG_UNPARSED_ARGUMENTS}
        SELECTOR_PROPERTY "M2_HELLO_WORLD_SELECTOR"
        WHOLE_DEPENDS
            trolly::trolly
            trolly::trolly-ros2
            ${ARG_WHOLE_DEPENDS}
        AMENT_DEPENDS
            std_msgs
            ${ARG_AMENT_DEPENDS}
    )
endfunction()

function(m2_hello_world_ros2_add_executable target_name)
    cmake_parse_arguments(ARG "" "" "WHOLE_DEPENDS;AMENT_DEPENDS" ${ARGN})
    m2b_ros2_add_executable(${target_name} ${ARG_UNPARSED_ARGUMENTS}
        SELECTOR_PROPERTY "M2_HELLO_WORLD_SELECTOR"
        WHOLE_DEPENDS
            trolly::trolly
            trolly::trolly-ros2
            ${ARG_WHOLE_DEPENDS}
        AMENT_DEPENDS
            std_msgs
            ${ARG_AMENT_DEPENDS}
    )
endfunction()

function(m2_hello_world_build_current_ros2_dir object_name)
    aux_source_directory(. _srcs)
    m2_hello_world_ros2_add_object_library(${object_name} ${_srcs} ${ARGN})
endfunction()
