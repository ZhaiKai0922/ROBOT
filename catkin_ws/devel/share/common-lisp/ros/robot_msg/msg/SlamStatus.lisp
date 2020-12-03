; Auto-generated. Do not edit!


(cl:in-package robot_msg-msg)


;//! \htmlinclude SlamStatus.msg.html

(cl:defclass <SlamStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (status
    :reader status
    :initarg :status
    :type cl:string
    :initform "")
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (score
    :reader score
    :initarg :score
    :type cl:float
    :initform 0.0)
   (process
    :reader process
    :initarg :process
    :type cl:float
    :initform 0.0)
   (expect_time
    :reader expect_time
    :initarg :expect_time
    :type cl:float
    :initform 0.0)
   (relocated
    :reader relocated
    :initarg :relocated
    :type cl:boolean
    :initform cl:nil)
   (reloc_used_time
    :reader reloc_used_time
    :initarg :reloc_used_time
    :type cl:float
    :initform 0.0)
   (opt_works_remain
    :reader opt_works_remain
    :initarg :opt_works_remain
    :type cl:fixnum
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass SlamStatus (<SlamStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlamStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlamStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-msg:<SlamStatus> is deprecated: use robot_msg-msg:SlamStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SlamStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:header-val is deprecated.  Use robot_msg-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <SlamStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:status-val is deprecated.  Use robot_msg-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <SlamStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:pose-val is deprecated.  Use robot_msg-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'score-val :lambda-list '(m))
(cl:defmethod score-val ((m <SlamStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:score-val is deprecated.  Use robot_msg-msg:score instead.")
  (score m))

(cl:ensure-generic-function 'process-val :lambda-list '(m))
(cl:defmethod process-val ((m <SlamStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:process-val is deprecated.  Use robot_msg-msg:process instead.")
  (process m))

(cl:ensure-generic-function 'expect_time-val :lambda-list '(m))
(cl:defmethod expect_time-val ((m <SlamStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:expect_time-val is deprecated.  Use robot_msg-msg:expect_time instead.")
  (expect_time m))

(cl:ensure-generic-function 'relocated-val :lambda-list '(m))
(cl:defmethod relocated-val ((m <SlamStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:relocated-val is deprecated.  Use robot_msg-msg:relocated instead.")
  (relocated m))

(cl:ensure-generic-function 'reloc_used_time-val :lambda-list '(m))
(cl:defmethod reloc_used_time-val ((m <SlamStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:reloc_used_time-val is deprecated.  Use robot_msg-msg:reloc_used_time instead.")
  (reloc_used_time m))

(cl:ensure-generic-function 'opt_works_remain-val :lambda-list '(m))
(cl:defmethod opt_works_remain-val ((m <SlamStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:opt_works_remain-val is deprecated.  Use robot_msg-msg:opt_works_remain instead.")
  (opt_works_remain m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <SlamStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:angle-val is deprecated.  Use robot_msg-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlamStatus>) ostream)
  "Serializes a message object of type '<SlamStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'score))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'process))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'expect_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'relocated) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'reloc_used_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'opt_works_remain)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlamStatus>) istream)
  "Deserializes a message object of type '<SlamStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'score) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'process) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'expect_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'relocated) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'reloc_used_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'opt_works_remain) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlamStatus>)))
  "Returns string type for a message object of type '<SlamStatus>"
  "robot_msg/SlamStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlamStatus)))
  "Returns string type for a message object of type 'SlamStatus"
  "robot_msg/SlamStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlamStatus>)))
  "Returns md5sum for a message object of type '<SlamStatus>"
  "65da29df73e6a7154f974aeec3a060d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlamStatus)))
  "Returns md5sum for a message object of type 'SlamStatus"
  "65da29df73e6a7154f974aeec3a060d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlamStatus>)))
  "Returns full string definition for message of type '<SlamStatus>"
  (cl:format cl:nil "std_msgs/Header header~%string              status              # 状态~%geometry_msgs/Pose  pose                # 全局位姿~%float32             score               # 得分~%float32             process             # 地图保存进图，100%为已保存状态~%float32             expect_time         # 预测保存地图的时间，假设每秒优化2个~%bool                relocated           # 重定位成功判断~%float32             reloc_used_time     # 上次重定位耗费时间~%int16               opt_works_remain    # 优化队列~%float32             angle               # 地图旋转角度 radian~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlamStatus)))
  "Returns full string definition for message of type 'SlamStatus"
  (cl:format cl:nil "std_msgs/Header header~%string              status              # 状态~%geometry_msgs/Pose  pose                # 全局位姿~%float32             score               # 得分~%float32             process             # 地图保存进图，100%为已保存状态~%float32             expect_time         # 预测保存地图的时间，假设每秒优化2个~%bool                relocated           # 重定位成功判断~%float32             reloc_used_time     # 上次重定位耗费时间~%int16               opt_works_remain    # 优化队列~%float32             angle               # 地图旋转角度 radian~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlamStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'status))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     4
     4
     4
     1
     4
     2
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlamStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'SlamStatus
    (cl:cons ':header (header msg))
    (cl:cons ':status (status msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':score (score msg))
    (cl:cons ':process (process msg))
    (cl:cons ':expect_time (expect_time msg))
    (cl:cons ':relocated (relocated msg))
    (cl:cons ':reloc_used_time (reloc_used_time msg))
    (cl:cons ':opt_works_remain (opt_works_remain msg))
    (cl:cons ':angle (angle msg))
))
