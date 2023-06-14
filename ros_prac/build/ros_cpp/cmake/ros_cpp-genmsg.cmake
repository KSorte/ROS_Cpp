# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ros_cpp: 1 messages, 1 services")

set(MSG_I_FLAGS "-Iros_cpp:/home/kaushal/ros_prac/src/ros_cpp/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ros_cpp_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg" NAME_WE)
add_custom_target(_ros_cpp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ros_cpp" "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg" ""
)

get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv" NAME_WE)
add_custom_target(_ros_cpp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ros_cpp" "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ros_cpp
  "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_cpp
)

### Generating Services
_generate_srv_cpp(ros_cpp
  "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_cpp
)

### Generating Module File
_generate_module_cpp(ros_cpp
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_cpp
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ros_cpp_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ros_cpp_generate_messages ros_cpp_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg" NAME_WE)
add_dependencies(ros_cpp_generate_messages_cpp _ros_cpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(ros_cpp_generate_messages_cpp _ros_cpp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros_cpp_gencpp)
add_dependencies(ros_cpp_gencpp ros_cpp_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_cpp_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ros_cpp
  "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_cpp
)

### Generating Services
_generate_srv_eus(ros_cpp
  "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_cpp
)

### Generating Module File
_generate_module_eus(ros_cpp
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_cpp
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ros_cpp_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ros_cpp_generate_messages ros_cpp_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg" NAME_WE)
add_dependencies(ros_cpp_generate_messages_eus _ros_cpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(ros_cpp_generate_messages_eus _ros_cpp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros_cpp_geneus)
add_dependencies(ros_cpp_geneus ros_cpp_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_cpp_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ros_cpp
  "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_cpp
)

### Generating Services
_generate_srv_lisp(ros_cpp
  "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_cpp
)

### Generating Module File
_generate_module_lisp(ros_cpp
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_cpp
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ros_cpp_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ros_cpp_generate_messages ros_cpp_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg" NAME_WE)
add_dependencies(ros_cpp_generate_messages_lisp _ros_cpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(ros_cpp_generate_messages_lisp _ros_cpp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros_cpp_genlisp)
add_dependencies(ros_cpp_genlisp ros_cpp_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_cpp_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ros_cpp
  "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_cpp
)

### Generating Services
_generate_srv_nodejs(ros_cpp
  "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_cpp
)

### Generating Module File
_generate_module_nodejs(ros_cpp
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_cpp
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ros_cpp_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ros_cpp_generate_messages ros_cpp_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg" NAME_WE)
add_dependencies(ros_cpp_generate_messages_nodejs _ros_cpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(ros_cpp_generate_messages_nodejs _ros_cpp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros_cpp_gennodejs)
add_dependencies(ros_cpp_gennodejs ros_cpp_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_cpp_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ros_cpp
  "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_cpp
)

### Generating Services
_generate_srv_py(ros_cpp
  "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_cpp
)

### Generating Module File
_generate_module_py(ros_cpp
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_cpp
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ros_cpp_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ros_cpp_generate_messages ros_cpp_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/msg/Num.msg" NAME_WE)
add_dependencies(ros_cpp_generate_messages_py _ros_cpp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kaushal/ros_prac/src/ros_cpp/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(ros_cpp_generate_messages_py _ros_cpp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros_cpp_genpy)
add_dependencies(ros_cpp_genpy ros_cpp_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_cpp_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_cpp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_cpp
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ros_cpp_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_cpp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_cpp
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ros_cpp_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_cpp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_cpp
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ros_cpp_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_cpp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_cpp
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ros_cpp_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_cpp)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_cpp\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_cpp
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ros_cpp_generate_messages_py std_msgs_generate_messages_py)
endif()
