;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::ScoredPose)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'ScoredPose (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::SCOREDPOSE")
  (make-package "ROBOT_MSG::SCOREDPOSE"))

(in-package "ROS")
;;//! \htmlinclude ScoredPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robot_msg::ScoredPose
  :super ros::object
  :slots (_header _pose _score _opt_works_remain _relocated ))

(defmethod robot_msg::ScoredPose
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:score __score) 0.0)
    ((:opt_works_remain __opt_works_remain) 0)
    ((:relocated __relocated) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _pose __pose)
   (setq _score (float __score))
   (setq _opt_works_remain (round __opt_works_remain))
   (setq _relocated __relocated)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:opt_works_remain
   (&optional __opt_works_remain)
   (if __opt_works_remain (setq _opt_works_remain __opt_works_remain)) _opt_works_remain)
  (:relocated
   (&optional __relocated)
   (if __relocated (setq _relocated __relocated)) _relocated)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float32 _score
    4
    ;; int16 _opt_works_remain
    2
    ;; bool _relocated
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float32 _score
       (sys::poke _score (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16 _opt_works_remain
       (write-word _opt_works_remain s)
     ;; bool _relocated
       (if _relocated (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float32 _score
     (setq _score (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16 _opt_works_remain
     (setq _opt_works_remain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _relocated
     (setq _relocated (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robot_msg::ScoredPose :md5sum-) "0af756687c3ab51ab296469842fee404")
(setf (get robot_msg::ScoredPose :datatype-) "robot_msg/ScoredPose")
(setf (get robot_msg::ScoredPose :definition-)
      "std_msgs/Header header
geometry_msgs/Pose pose
float32 score
int16   opt_works_remain
bool    relocated

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

")



(provide :robot_msg/ScoredPose "0af756687c3ab51ab296469842fee404")


