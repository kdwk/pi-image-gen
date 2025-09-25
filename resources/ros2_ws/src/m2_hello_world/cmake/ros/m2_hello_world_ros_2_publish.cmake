# Copyright (c) 2025 HKU Robocon Team
# Author: Kdwk (kdwk@connect.hku.hk)

m2_hello_world_ros2_add_executable(m2_hello_world_node
    SELECTORS
        hello-world-node
)

m2b_install_targets(
    m2_hello_world_node
)

m2b_ros2_cmake_package(
    EXPORT_DEPENDS
        rosidl_default_runtime
)

install(DIRECTORY launch DESTINATION share/${PROJECT_NAME})
