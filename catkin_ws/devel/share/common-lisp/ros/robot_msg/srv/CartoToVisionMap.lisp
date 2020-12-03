; Auto-generated. Do not edit!


(cl:in-package robot_msg-srv)


;//! \htmlinclude CartoToVisionMap-request.msg.html

(cl:defclass <CartoToVisionMap-request> (roslisp-msg-protocol:ros-message)
  ((map_flag
    :reader map_flag
    :initarg :map_flag
    :type cl:boolean
    :initform cl:nil)
   (poses
    :reader poses
    :initarg :poses
    :type (cl:vector geometry_msgs-msg:PoseStamped)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:PoseStamped :initial-element (cl:make-instance 'geometry_msgs-msg:PoseStamped))))
)

(cl:defclass CartoToVisionMap-request (<CartoToVisionMap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartoToVisionMap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartoToVisionMap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<CartoToVisionMap-request> is deprecated: use robot_msg-srv:CartoToVisionMap-request instead.")))

(cl:ensure-generic-function 'map_flag-val :lambda-list '(m))
(cl:defmethod map_flag-val ((m <CartoToVisionMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:map_flag-val is deprecated.  Use robot_msg-srv:map_flag instead.")
  (map_flag m))

(cl:ensure-generic-function 'poses-val :lambda-list '(m))
(cl:defmethod poses-val ((m <CartoToVisionMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:poses-val is deprecated.  Use robot_msg-srv:poses instead.")
  (poses m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartoToVisionMap-request>) ostream)
  "Serializes a message object of type '<CartoToVisionMap-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'map_flag) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'poses))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartoToVisionMap-request>) istream)
  "Deserializes a message object of type '<CartoToVisionMap-request>"
    (cl:setf (cl:slot-value msg 'map_flag) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'poses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:PoseStamped))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartoToVisionMap-request>)))
  "Returns string type for a service object of type '<CartoToVisionMap-request>"
  "robot_msg/CartoToVisionMapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartoToVisionMap-request)))
  "Returns string type for a service object of type 'CartoToVisionMap-request"
  "robot_msg/CartoToVisionMapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartoToVisionMap-request>)))
  "Returns md5sum for a message object of type '<CartoToVisionMap-request>"
  "19a9e8c96780c7c67a6911545c02145e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartoToVisionMap-request)))
  "Returns md5sum for a message object of type 'CartoToVisionMap-request"
  "19a9e8c96780c7c67a6911545c02145e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartoToVisionMap-request>)))
  "Returns full string definition for message of type '<CartoToVisionMap-request>"
  (cl:format cl:nil "bool map_flag  # true-发送建图请求~%geometry_msgs/PoseStamped[] poses # 激光雷达所有scan帧的时间戳和位姿(雷达到世界坐标系)~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartoToVisionMap-request)))
  "Returns full string definition for message of type 'CartoToVisionMap-request"
  (cl:format cl:nil "bool map_flag  # true-发送建图请求~%geometry_msgs/PoseStamped[] poses # 激光雷达所有scan帧的时间戳和位姿(雷达到世界坐标系)~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartoToVisionMap-request>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartoToVisionMap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CartoToVisionMap-request
    (cl:cons ':map_flag (map_flag msg))
    (cl:cons ':poses (poses msg))
))
;//! \htmlinclude CartoToVisionMap-response.msg.html

(cl:defclass <CartoToVisionMap-response> (roslisp-msg-protocol:ros-message)
  ((finish_flag
    :reader finish_flag
    :initarg :finish_flag
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CartoToVisionMap-response (<CartoToVisionMap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartoToVisionMap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartoToVisionMap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<CartoToVisionMap-response> is deprecated: use robot_msg-srv:CartoToVisionMap-response instead.")))

(cl:ensure-generic-function 'finish_flag-val :lambda-list '(m))
(cl:defmethod finish_flag-val ((m <CartoToVisionMap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:finish_flag-val is deprecated.  Use robot_msg-srv:finish_flag instead.")
  (finish_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartoToVisionMap-response>) ostream)
  "Serializes a message object of type '<CartoToVisionMap-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finish_flag) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartoToVisionMap-response>) istream)
  "Deserializes a message object of type '<CartoToVisionMap-response>"
    (cl:setf (cl:slot-value msg 'finish_flag) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartoToVisionMap-response>)))
  "Returns string type for a service object of type '<CartoToVisionMap-response>"
  "robot_msg/CartoToVisionMapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartoToVisionMap-response)))
  "Returns string type for a service object of type 'CartoToVisionMap-response"
  "robot_msg/CartoToVisionMapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartoToVisionMap-response>)))
  "Returns md5sum for a message object of type '<CartoToVisionMap-response>"
  "19a9e8c96780c7c67a6911545c02145e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartoToVisionMap-response)))
  "Returns md5sum for a message object of type 'CartoToVisionMap-response"
  "19a9e8c96780c7c67a6911545c02145e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartoToVisionMap-response>)))
  "Returns full string definition for message of type '<CartoToVisionMap-response>"
  (cl:format cl:nil "bool finish_flag # true-接收到建图信号~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartoToVisionMap-response)))
  "Returns full string definition for message of type 'CartoToVisionMap-response"
  (cl:format cl:nil "bool finish_flag # true-接收到建图信号~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartoToVisionMap-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartoToVisionMap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CartoToVisionMap-response
    (cl:cons ':finish_flag (finish_flag msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CartoToVisionMap)))
  'CartoToVisionMap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CartoToVisionMap)))
  'CartoToVisionMap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartoToVisionMap)))
  "Returns string type for a service object of type '<CartoToVisionMap>"
  "robot_msg/CartoToVisionMap")