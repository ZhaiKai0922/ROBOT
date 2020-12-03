;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::CartoToVisionMap)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'CartoToVisionMap (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::CARTOTOVISIONMAP")
  (make-package "ROBOT_MSG::CARTOTOVISIONMAP"))
(unless (find-package "ROBOT_MSG::CARTOTOVISIONMAPREQUEST")
  (make-package "ROBOT_MSG::CARTOTOVISIONMAPREQUEST"))
(unless (find-package "ROBOT_MSG::CARTOTOVISIONMAPRESPONSE")
  (make-package "ROBOT_MSG::CARTOTOVISIONMAPRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass robot_msg::CartoToVisionMapRequest
  :super ros::object
  :slots (_map_flag _poses ))

(defmethod robot_msg::CartoToVisionMapRequest
  (:init
   (&key
    ((:map_flag __map_flag) nil)
    ((:poses __poses) (let (r) (dotimes (i 0) (push (instance geometry_msgs::PoseStamped :init) r)) r))
    )
   (send-super :init)
   (setq _map_flag __map_flag)
   (setq _poses __poses)
   self)
  (:map_flag
   (&optional __map_flag)
   (if __map_flag (setq _map_flag __map_flag)) _map_flag)
  (:poses
   (&rest __poses)
   (if (keywordp (car __poses))
       (send* _poses __poses)
     (progn
       (if __poses (setq _poses (car __poses)))
       _poses)))
  (:serialization-length
   ()
   (+
    ;; bool _map_flag
    1
    ;; geometry_msgs/PoseStamped[] _poses
    (apply #'+ (send-all _poses :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _map_flag
       (if _map_flag (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/PoseStamped[] _poses
     (write-long (length _poses) s)
     (dolist (elem _poses)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _map_flag
     (setq _map_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/PoseStamped[] _poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _poses (let (r) (dotimes (i n) (push (instance geometry_msgs::PoseStamped :init) r)) r))
     (dolist (elem- _poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass robot_msg::CartoToVisionMapResponse
  :super ros::object
  :slots (_finish_flag ))

(defmethod robot_msg::CartoToVisionMapResponse
  (:init
   (&key
    ((:finish_flag __finish_flag) nil)
    )
   (send-super :init)
   (setq _finish_flag __finish_flag)
   self)
  (:finish_flag
   (&optional __finish_flag)
   (if __finish_flag (setq _finish_flag __finish_flag)) _finish_flag)
  (:serialization-length
   ()
   (+
    ;; bool _finish_flag
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _finish_flag
       (if _finish_flag (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _finish_flag
     (setq _finish_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_msg::CartoToVisionMap
  :super ros::object
  :slots ())

(setf (get robot_msg::CartoToVisionMap :md5sum-) "19a9e8c96780c7c67a6911545c02145e")
(setf (get robot_msg::CartoToVisionMap :datatype-) "robot_msg/CartoToVisionMap")
(setf (get robot_msg::CartoToVisionMap :request) robot_msg::CartoToVisionMapRequest)
(setf (get robot_msg::CartoToVisionMap :response) robot_msg::CartoToVisionMapResponse)

(defmethod robot_msg::CartoToVisionMapRequest
  (:response () (instance robot_msg::CartoToVisionMapResponse :init)))

(setf (get robot_msg::CartoToVisionMapRequest :md5sum-) "19a9e8c96780c7c67a6911545c02145e")
(setf (get robot_msg::CartoToVisionMapRequest :datatype-) "robot_msg/CartoToVisionMapRequest")
(setf (get robot_msg::CartoToVisionMapRequest :definition-)
      "bool map_flag  # true-发送建图请求
geometry_msgs/PoseStamped[] poses # 激光雷达所有scan帧的时间戳和位姿(雷达到世界坐标系)

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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
---
bool finish_flag # true-接收到建图信号

")

(setf (get robot_msg::CartoToVisionMapResponse :md5sum-) "19a9e8c96780c7c67a6911545c02145e")
(setf (get robot_msg::CartoToVisionMapResponse :datatype-) "robot_msg/CartoToVisionMapResponse")
(setf (get robot_msg::CartoToVisionMapResponse :definition-)
      "bool map_flag  # true-发送建图请求
geometry_msgs/PoseStamped[] poses # 激光雷达所有scan帧的时间戳和位姿(雷达到世界坐标系)

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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
---
bool finish_flag # true-接收到建图信号

")



(provide :robot_msg/CartoToVisionMap "19a9e8c96780c7c67a6911545c02145e")


