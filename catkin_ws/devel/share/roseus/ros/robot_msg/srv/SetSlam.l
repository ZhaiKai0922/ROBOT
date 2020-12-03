;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::SetSlam)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'SetSlam (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::SETSLAM")
  (make-package "ROBOT_MSG::SETSLAM"))
(unless (find-package "ROBOT_MSG::SETSLAMREQUEST")
  (make-package "ROBOT_MSG::SETSLAMREQUEST"))
(unless (find-package "ROBOT_MSG::SETSLAMRESPONSE")
  (make-package "ROBOT_MSG::SETSLAMRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass robot_msg::SetSlamRequest
  :super ros::object
  :slots (_header _cmd _mapdir _filename _initial_pose ))

(defmethod robot_msg::SetSlamRequest
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:cmd __cmd) "")
    ((:mapdir __mapdir) "")
    ((:filename __filename) "")
    ((:initial_pose __initial_pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _cmd (string __cmd))
   (setq _mapdir (string __mapdir))
   (setq _filename (string __filename))
   (setq _initial_pose __initial_pose)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:cmd
   (&optional __cmd)
   (if __cmd (setq _cmd __cmd)) _cmd)
  (:mapdir
   (&optional __mapdir)
   (if __mapdir (setq _mapdir __mapdir)) _mapdir)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:initial_pose
   (&rest __initial_pose)
   (if (keywordp (car __initial_pose))
       (send* _initial_pose __initial_pose)
     (progn
       (if __initial_pose (setq _initial_pose (car __initial_pose)))
       _initial_pose)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _cmd
    4 (length _cmd)
    ;; string _mapdir
    4 (length _mapdir)
    ;; string _filename
    4 (length _filename)
    ;; geometry_msgs/Pose _initial_pose
    (send _initial_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _cmd
       (write-long (length _cmd) s) (princ _cmd s)
     ;; string _mapdir
       (write-long (length _mapdir) s) (princ _mapdir s)
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;; geometry_msgs/Pose _initial_pose
       (send _initial_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _cmd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cmd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _mapdir
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mapdir (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _initial_pose
     (send _initial_pose :deserialize buf ptr-) (incf ptr- (send _initial_pose :serialization-length))
   ;;
   self)
  )

(defclass robot_msg::SetSlamResponse
  :super ros::object
  :slots (_success _message ))

(defmethod robot_msg::SetSlamResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_msg::SetSlam
  :super ros::object
  :slots ())

(setf (get robot_msg::SetSlam :md5sum-) "376b55de1ddd4506705a9e23f4322617")
(setf (get robot_msg::SetSlam :datatype-) "robot_msg/SetSlam")
(setf (get robot_msg::SetSlam :request) robot_msg::SetSlamRequest)
(setf (get robot_msg::SetSlam :response) robot_msg::SetSlamResponse)

(defmethod robot_msg::SetSlamRequest
  (:response () (instance robot_msg::SetSlamResponse :init)))

(setf (get robot_msg::SetSlamRequest :md5sum-) "376b55de1ddd4506705a9e23f4322617")
(setf (get robot_msg::SetSlamRequest :datatype-) "robot_msg/SetSlamRequest")
(setf (get robot_msg::SetSlamRequest :definition-)
      "Header header
string cmd #build/save/switch/reloc, build cmd do not use others
string mapdir #absolute path with no end slash
string filename #map file name with no suffix (.pbstream and .pgm)
geometry_msgs/Pose initial_pose  #only switch cmd use this

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
bool success
string message

")

(setf (get robot_msg::SetSlamResponse :md5sum-) "376b55de1ddd4506705a9e23f4322617")
(setf (get robot_msg::SetSlamResponse :datatype-) "robot_msg/SetSlamResponse")
(setf (get robot_msg::SetSlamResponse :definition-)
      "Header header
string cmd #build/save/switch/reloc, build cmd do not use others
string mapdir #absolute path with no end slash
string filename #map file name with no suffix (.pbstream and .pgm)
geometry_msgs/Pose initial_pose  #only switch cmd use this

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
bool success
string message

")



(provide :robot_msg/SetSlam "376b55de1ddd4506705a9e23f4322617")


