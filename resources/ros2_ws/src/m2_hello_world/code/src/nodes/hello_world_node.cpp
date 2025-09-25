#include <csignal>
#include <cstdio>
#include <format>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"

#include "trolly/log/trolly_logger_macro.h"
#include "trolly/ros2/log/trolly_logger_ros2.h"

namespace m2 {
class hello_world_node : public rclcpp::Node {
public:
    hello_world_node() noexcept
        : rclcpp::Node("hello_world_node")
    {
        declare_parameter("name", "M2");
        declare_parameter("interval_ms", 1000);
    }

    void init() noexcept
    {
        name_ = get_parameter("name").as_string();
        interval_ms_ = get_parameter("interval_ms").as_int();
        msg_pub_ = create_publisher<std_msgs::msg::String>("/hello_world", 1);
    }

    void tick() noexcept
    {
        tick_elapsed_since_last_pub_ += 1;
        if (tick_elapsed_since_last_pub_ * 10 >= interval_ms_) {
            std_msgs::msg::String msg;
            msg.data = std::format("Hello world {}!", name_);
            msg_pub_->publish(msg);
            tick_elapsed_since_last_pub_ = 0;
        }
    }

private:
    rclcpp::Publisher<std_msgs::msg::String>::SharedPtr msg_pub_;
    std::string name_ = "";
    uint32_t interval_ms_ = 1000;
    uint32_t tick_elapsed_since_last_pub_ = 0;
};
}  // namespace m2

void shutdown(int)
{
    rclcpp::shutdown();
    exit(0);
}

int main(int argc, char** argv)
{
    rclcpp::init(argc, argv);
    signal(SIGINT, shutdown);

    auto node = std::make_shared<m2::hello_world_node>();
    trolly::log::use_ros2_logger(node->get_logger(), node->get_clock());
    TROLLY_INFO("m2_hello_world_node: node init begin");
    node->init();
    TROLLY_INFO("m2_hello_world_node: node init end");

    rclcpp::Rate rate(100);
    while (rclcpp::ok()) {
        node->tick();
        rclcpp::spin_some(node);
        rate.sleep();
    }

    shutdown(SIGINT);
    return 0;
}
