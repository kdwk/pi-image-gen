from pathlib import Path

from launch import LaunchDescription
from launch_ros.actions import Node
from launch.substitutions import LaunchConfiguration


def generate_launch_description():
    return LaunchDescription(
        [
            Node(
                package="m2_hello_world",
                executable="m2_hello_world_node",
                name="m2_hello_world_node",
                output="screen",
                parameters=[
                    {
                        "name": "M2",
                        "interval_ms": 500
                    }
                ]
            )
        ]
    )