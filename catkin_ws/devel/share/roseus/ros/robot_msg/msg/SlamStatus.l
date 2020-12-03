;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::SlamStatus)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'SlamStatus (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::SLAMSTATUS")
  (make-package "ROBOT_MSG::SLAMSTATUS"))

(in-package "ROS")
;;//! \htmlinclude SlamStatus.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robot_msg::SlamStatus
  :super ros::object
  :slots (_header _status _pose _score _process _expect_time _relocated _reloc_used_time _opt_works_remain _angle ))

(defmethod robot_msg::SlamStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:status __status) "")
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:score __score) 0.0)
    ((:process __process) 0.0)
    ((:expect_time __expect_time) 0.0)
    ((:relocated __relocated) nil)
    ((:reloc_used_time __reloc_used_time) 0.0)
    ((:opt_works_remain __opt_works_remain) 0)
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _status (string __status))
   (setq _pose __pose)
   (setq _score (float __score))
   (setq _process (float __process))
   (setq _expect_time (float __expect_time))
   (setq _relocated __relocated)
   (setq _reloc_used_time (float __reloc_used_time))
   (setq _opt_works_remain (round __opt_works_remain))
   (setq _angle (float __angle))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
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
  (:process
   (&optional __process)
   (if __process (setq _process __process)) _process)
  (:expect_time
   (&optional __expect_time)
   (if __expect_time (setq _expect_time __expect_time)) _expect_time)
  (:relocated
   (&optional __relocated)
   (if __relocated (setq _relocated __relocated)) _relocated)
  (:reloc_used_time
   (&optional __reloc_used_time)
   (if __reloc_used_time (setq _reloc_used_time __reloc_used_time)) _reloc_used_time)
  (:opt_works_remain
   (&optional __opt_works_remain)
   (if __opt_works_remain (setq _opt_works_remain __opt_works_remain)) _opt_works_remain)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _status
    4 (length _status)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float32 _score
    4
    ;; float32 _process
    4
    ;; float32 _expect_time
    4
    ;; bool _relocated
    1
    ;; float32 _reloc_used_time
    4
    ;; int16 _opt_works_remain
    2
    ;; float32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float32 _score
       (sys::poke _score (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _process
       (sys::poke _process (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _expect_time
       (sys::poke _expect_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _relocated
       (if _relocated (write-byte -1 s) (write-byte 0 s))
     ;; float32 _reloc_used_time
       (sys::poke _reloc_used_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16 _opt_works_remain
       (write-word _opt_works_remain s)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float32 _score
     (setq _score (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _process
     (setq _process (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _expect_time
     (setq _expect_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _relocated
     (setq _relocated (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _reloc_used_time
     (setq _reloc_used_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16 _opt_works_remain
     (setq _opt_works_remain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_msg::SlamStatus :md5sum-) "65da29df73e6a7154f974aeec3a060d8")
(setf (get robot_msg::SlamStatus :datatype-) "robot_msg/SlamStatus")
(setf (get robot_msg::SlamStatus :definition-)
      "std_msgs/Header header
string              status              # 状态
geometry_msgs/Pose  pose                # 全局位姿
float32             score               # 得分
float32             process             # 地图保存进图，100%为已保存状态
float32             expect_time         # 预测保存地图的时间，假设每秒优化2个
bool                relocated           # 重定位成功判断
float32             reloc_used_time     # 上次重定位耗费时间
int16               opt_works_remain    # 优化队列
float32             angle               # 地图旋转角度 radian

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



(provide :robot_msg/SlamStatus "65da29df73e6a7154f974aeec3a060d8")


