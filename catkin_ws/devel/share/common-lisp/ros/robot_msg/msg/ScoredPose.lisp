; Auto-generated. Do not edit!


(cl:in-package robot_msg-msg)


;//! \htmlinclude ScoredPose.msg.html

(cl:defclass <ScoredPose> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
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
   (opt_works_remain
    :reader opt_works_remain
    :initarg :opt_works_remain
    :type cl:fixnum
    :initform 0)
   (relocated
    :reader relocated
    :initarg :relocated
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ScoredPose (<ScoredPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ScoredPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ScoredPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-msg:<ScoredPose> is deprecated: use robot_msg-msg:ScoredPose instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ScoredPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:header-val is deprecated.  Use robot_msg-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <ScoredPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:pose-val is deprecated.  Use robot_msg-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'score-val :lambda-list '(m))
(cl:defmethod score-val ((m <ScoredPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:score-val is deprecated.  Use robot_msg-msg:score instead.")
  (score m))

(cl:ensure-generic-function 'opt_works_remain-val :lambda-list '(m))
(cl:defmethod opt_works_remain-val ((m <ScoredPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:opt_works_remain-val is deprecated.  Use robot_msg-msg:opt_works_remain instead.")
  (opt_works_remain m))

(cl:ensure-generic-function 'relocated-val :lambda-list '(m))
(cl:defmethod relocated-val ((m <ScoredPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:relocated-val is deprecated.  Use robot_msg-msg:relocated instead.")
  (relocated m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ScoredPose>) ostream)
  "Serializes a message object of type '<ScoredPose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'score))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'opt_works_remain)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'relocated) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ScoredPose>) istream)
  "Deserializes a message object of type '<ScoredPose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'score) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'opt_works_remain) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'relocated) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ScoredPose>)))
  "Returns string type for a message object of type '<ScoredPose>"
  "robot_msg/ScoredPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScoredPose)))
  "Returns string type for a message object of type 'ScoredPose"
  "robot_msg/ScoredPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ScoredPose>)))
  "Returns md5sum for a message object of type '<ScoredPose>"
  "0af756687c3ab51ab296469842fee404")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ScoredPose)))
  "Returns md5sum for a message object of type 'ScoredPose"
  "0af756687c3ab51ab296469842fee404")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ScoredPose>)))
  "Returns full string definition for message of type '<ScoredPose>"
  (cl:format cl:nil "std_msgs/Header header~%geometry_msgs/Pose pose~%float32 score~%int16   opt_works_remain~%bool    relocated~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ScoredPose)))
  "Returns full string definition for message of type 'ScoredPose"
  (cl:format cl:nil "std_msgs/Header header~%geometry_msgs/Pose pose~%float32 score~%int16   opt_works_remain~%bool    relocated~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ScoredPose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     4
     2
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ScoredPose>))
  "Converts a ROS message object to a list"
  (cl:list 'ScoredPose
    (cl:cons ':header (header msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':score (score msg))
    (cl:cons ':opt_works_remain (opt_works_remain msg))
    (cl:cons ':relocated (relocated msg))
))
