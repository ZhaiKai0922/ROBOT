;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::StringOccupancyGrid)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'StringOccupancyGrid (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::STRINGOCCUPANCYGRID")
  (make-package "ROBOT_MSG::STRINGOCCUPANCYGRID"))

(in-package "ROS")
;;//! \htmlinclude StringOccupancyGrid.msg.html
(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robot_msg::StringOccupancyGrid
  :super ros::object
  :slots (_header _info _angle _data ))

(defmethod robot_msg::StringOccupancyGrid
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:info __info) (instance nav_msgs::MapMetaData :init))
    ((:angle __angle) 0.0)
    ((:data __data) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _info __info)
   (setq _angle (float __angle))
   (setq _data (string __data))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:info
   (&rest __info)
   (if (keywordp (car __info))
       (send* _info __info)
     (progn
       (if __info (setq _info (car __info)))
       _info)))
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; nav_msgs/MapMetaData _info
    (send _info :serialization-length)
    ;; float32 _angle
    4
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; nav_msgs/MapMetaData _info
       (send _info :serialize s)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; nav_msgs/MapMetaData _info
     (send _info :deserialize buf ptr-) (incf ptr- (send _info :serialization-length))
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get robot_msg::StringOccupancyGrid :md5sum-) "71cb4d0c03c15e5f80b82f9bc5ee91a3")
(setf (get robot_msg::StringOccupancyGrid :datatype-) "robot_msg/StringOccupancyGrid")
(setf (get robot_msg::StringOccupancyGrid :definition-)
      "Header header
nav_msgs/MapMetaData info
float32 angle
string data

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: nav_msgs/MapMetaData
# This hold basic information about the characterists of the OccupancyGrid

# The time at which the map was loaded
time map_load_time
# The map resolution [m/cell]
float32 resolution
# Map width [cells]
uint32 width
# Map height [cells]
uint32 height
# The origin of the map [m, m, rad].  This is the real-world pose of the
# cell (0,0) in the map.
geometry_msgs/Pose origin
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :robot_msg/StringOccupancyGrid "71cb4d0c03c15e5f80b82f9bc5ee91a3")


