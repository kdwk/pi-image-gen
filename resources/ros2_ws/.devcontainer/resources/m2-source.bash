source /opt/ros/$ROS_DISTRO/setup.bash

if [ -z "$ROS2_WS" ]; then export ROS2_WS=$HOME/ros2_ws; fi

if [ -f $ROS2_WS/install/setup.bash ]; then
    source $ROS2_WS/install/setup.bash
fi

export CC=/usr/lib/ccache/clang
export CXX=/usr/lib/ccache/clang++

format() {
    find $1 -iname '*.h' -o -iname '*.cpp' | xargs clang-format -i
}