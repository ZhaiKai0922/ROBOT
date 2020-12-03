; Auto-generated. Do not edit!


(cl:in-package robot_msg-srv)


;//! \htmlinclude SetSlam-request.msg.html

(cl:defclass <SetSlam-request> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (cmd
    :reader cmd
    :initarg :cmd
    :type cl:string
    :initform "")
   (mapdir
    :reader mapdir
    :initarg :mapdir
    :type cl:string
    :initform "")
   (filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform "")
   (initial_pose
    :reader initial_pose
    :initarg :initial_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass SetSlam-request (<SetSlam-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSlam-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSlam-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<SetSlam-request> is deprecated: use robot_msg-srv:SetSlam-request instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SetSlam-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:header-val is deprecated.  Use robot_msg-srv:header instead.")
  (header m))

(cl:ensure-generic-function 'cmd-val :lambda-list '(m))
(cl:defmethod cmd-val ((m <SetSlam-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:cmd-val is deprecated.  Use robot_msg-srv:cmd instead.")
  (cmd m))

(cl:ensure-generic-function 'mapdir-val :lambda-list '(m))
(cl:defmethod mapdir-val ((m <SetSlam-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:mapdir-val is deprecated.  Use robot_msg-srv:mapdir instead.")
  (mapdir m))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <SetSlam-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:filename-val is deprecated.  Use robot_msg-srv:filename instead.")
  (filename m))

(cl:ensure-generic-function 'initial_pose-val :lambda-list '(m))
(cl:defmethod initial_pose-val ((m <SetSlam-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:initial_pose-val is deprecated.  Use robot_msg-srv:initial_pose instead.")
  (initial_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSlam-request>) ostream)
  "Serializes a message object of type '<SetSlam-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'cmd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'cmd))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mapdir))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mapdir))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'initial_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSlam-request>) istream)
  "Deserializes a message object of type '<SetSlam-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cmd) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'cmd) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mapdir) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mapdir) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'initial_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSlam-request>)))
  "Returns string type for a service object of type '<SetSlam-request>"
  "robot_msg/SetSlamRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSlam-request)))
  "Returns string type for a service object of type 'SetSlam-request"
  "robot_msg/SetSlamRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSlam-request>)))
  "Returns md5sum for a message object of type '<SetSlam-request>"
  "376b55de1ddd4506705a9e23f4322617")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSlam-request)))
  "Returns md5sum for a message object of type 'SetSlam-request"
  "376b55de1ddd4506705a9e23f4322617")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSlam-request>)))
  "Returns full string definition for message of type '<SetSlam-request>"
  (cl:format cl:nil "Header header~%string cmd #build/save/switch/reloc, build cmd do not use others~%string mapdir #absolute path with no end slash~%string filename #map file name with no suffix (.pbstream and .pgm)~%geometry_msgs/Pose initial_pose  #only switch cmd use this~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSlam-request)))
  "Returns full string definition for message of type 'SetSlam-request"
  (cl:format cl:nil "Header header~%string cmd #build/save/switch/reloc, build cmd do not use others~%string mapdir #absolute path with no end slash~%string filename #map file name with no suffix (.pbstream and .pgm)~%geometry_msgs/Pose initial_pose  #only switch cmd use this~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSlam-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'cmd))
     4 (cl:length (cl:slot-value msg 'mapdir))
     4 (cl:length (cl:slot-value msg 'filename))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'initial_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSlam-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSlam-request
    (cl:cons ':header (header msg))
    (cl:cons ':cmd (cmd msg))
    (cl:cons ':mapdir (mapdir msg))
    (cl:cons ':filename (filename msg))
    (cl:cons ':initial_pose (initial_pose msg))
))
;//! \htmlinclude SetSlam-response.msg.html

(cl:defclass <SetSlam-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass SetSlam-response (<SetSlam-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSlam-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSlam-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<SetSlam-response> is deprecated: use robot_msg-srv:SetSlam-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetSlam-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:success-val is deprecated.  Use robot_msg-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetSlam-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:message-val is deprecated.  Use robot_msg-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSlam-response>) ostream)
  "Serializes a message object of type '<SetSlam-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSlam-response>) istream)
  "Deserializes a message object of type '<SetSlam-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSlam-response>)))
  "Returns string type for a service object of type '<SetSlam-response>"
  "robot_msg/SetSlamResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSlam-response)))
  "Returns string type for a service object of type 'SetSlam-response"
  "robot_msg/SetSlamResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSlam-response>)))
  "Returns md5sum for a message object of type '<SetSlam-response>"
  "376b55de1ddd4506705a9e23f4322617")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSlam-response)))
  "Returns md5sum for a message object of type 'SetSlam-response"
  "376b55de1ddd4506705a9e23f4322617")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSlam-response>)))
  "Returns full string definition for message of type '<SetSlam-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSlam-response)))
  "Returns full string definition for message of type 'SetSlam-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSlam-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSlam-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSlam-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetSlam)))
  'SetSlam-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetSlam)))
  'SetSlam-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSlam)))
  "Returns string type for a service object of type '<SetSlam>"
  "robot_msg/SetSlam")