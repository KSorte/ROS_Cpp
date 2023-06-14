FROM ros:noetic

RUN apt-get update && apt-get install -yq --no-install-recommends \
    ros-dev-tools \
    ros-noetic-rviz \
    && rm -rf /var/lib/apt/lists/*

COPY . /home/$USER/review_ws/

ENV ROS_MASTER_URI=http://localhost:11311
ENV ROS_IP=127.0.0.1

WORKDIR /home/$USER/review_ws/

RUN echo 'source /opt/ros/noetic/setup.bash' >> ~/.bashrc
