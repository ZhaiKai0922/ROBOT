; Auto-generated. Do not edit!


(cl:in-package robot_msg-srv)


;//! \htmlinclude SetRestrict-request.msg.html

(cl:defclass <SetRestrict-request> (roslisp-msg-protocol:ros-message)
  ((cmd
    :reader cmd
    :initarg :cmd
    :type cl:string
    :initform "")
   (virtual_walls
    :reader virtual_walls
    :initarg :virtual_walls
    :type (cl:vector robot_msg-msg:Restrict)
   :initform (cl:make-array 0 :element-type 'robot_msg-msg:Restrict :initial-element (cl:make-instance 'robot_msg-msg:Restrict))))
)

(cl:defclass SetRestrict-request (<SetRestrict-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetRestrict-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetRestrict-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<SetRestrict-request> is deprecated: use robot_msg-srv:SetRestrict-request instead.")))

(cl:ensure-generic-function 'cmd-val :lambda-list '(m))
(cl:defmethod cmd-val ((m <SetRestrict-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:cmd-val is deprecated.  Use robot_msg-srv:cmd instead.")
  (cmd m))

(cl:ensure-generic-function 'virtual_walls-val :lambda-list '(m))
(cl:defmethod virtual_walls-val ((m <SetRestrict-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:virtual_walls-val is deprecated.  Use robot_msg-srv:virtual_walls instead.")
  (virtual_walls m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetRestrict-request>) ostream)
  "Serializes a message object of type '<SetRestrict-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'cmd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'cmd))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'virtual_walls))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'virtual_walls))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetRestrict-request>) istream)
  "Deserializes a message object of type '<SetRestrict-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cmd) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'cmd) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'virtual_walls) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'virtual_walls)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'robot_msg-msg:Restrict))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetRestrict-request>)))
  "Returns string type for a service object of type '<SetRestrict-request>"
  "robot_msg/SetRestrictRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetRestrict-request)))
  "Returns string type for a service object of type 'SetRestrict-request"
  "robot_msg/SetRestrictRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetRestrict-request>)))
  "Returns md5sum for a message object of type '<SetRestrict-request>"
  "1f3913cc9796519611b8018d97267e81")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetRestrict-request)))
  "Returns md5sum for a message object of type 'SetRestrict-request"
  "1f3913cc9796519611b8018d97267e81")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetRestrict-request>)))
  "Returns full string definition for message of type '<SetRestrict-request>"
  (cl:format cl:nil "# srv definition~%~%#request constants~%~%#   \"add\"      添加~%#   \"remove\"   移除~%#   \"clean\"    清除所有限制层文件~%~%#request fields~%string                  cmd                          # 操作命令~%robot_msg/Restrict[]    virtual_walls                # 虚拟墙描述~%~%================================================================================~%MSG: robot_msg/Restrict~%# msg definition~%~%# virtual walls e.g.~%~%int32                   id          # id~%geometry_msgs/Polygon   polygon       # Clockwise~%~%~%~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetRestrict-request)))
  "Returns full string definition for message of type 'SetRestrict-request"
  (cl:format cl:nil "# srv definition~%~%#request constants~%~%#   \"add\"      添加~%#   \"remove\"   移除~%#   \"clean\"    清除所有限制层文件~%~%#request fields~%string                  cmd                          # 操作命令~%robot_msg/Restrict[]    virtual_walls                # 虚拟墙描述~%~%================================================================================~%MSG: robot_msg/Restrict~%# msg definition~%~%# virtual walls e.g.~%~%int32                   id          # id~%geometry_msgs/Polygon   polygon       # Clockwise~%~%~%~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetRestrict-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'cmd))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'virtual_walls) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetRestrict-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetRestrict-request
    (cl:cons ':cmd (cmd msg))
    (cl:cons ':virtual_walls (virtual_walls msg))
))
;//! \htmlinclude SetRestrict-response.msg.html

(cl:defclass <SetRestrict-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil)
   (message_code
    :reader message_code
    :initarg :message_code
    :type cl:integer
    :initform 0)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass SetRestrict-response (<SetRestrict-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetRestrict-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetRestrict-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<SetRestrict-response> is deprecated: use robot_msg-srv:SetRestrict-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <SetRestrict-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:result-val is deprecated.  Use robot_msg-srv:result instead.")
  (result m))

(cl:ensure-generic-function 'message_code-val :lambda-list '(m))
(cl:defmethod message_code-val ((m <SetRestrict-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:message_code-val is deprecated.  Use robot_msg-srv:message_code instead.")
  (message_code m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetRestrict-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:message-val is deprecated.  Use robot_msg-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetRestrict-response>) ostream)
  "Serializes a message object of type '<SetRestrict-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'message_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetRestrict-response>) istream)
  "Deserializes a message object of type '<SetRestrict-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetRestrict-response>)))
  "Returns string type for a service object of type '<SetRestrict-response>"
  "robot_msg/SetRestrictResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetRestrict-response)))
  "Returns string type for a service object of type 'SetRestrict-response"
  "robot_msg/SetRestrictResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetRestrict-response>)))
  "Returns md5sum for a message object of type '<SetRestrict-response>"
  "1f3913cc9796519611b8018d97267e81")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetRestrict-response)))
  "Returns md5sum for a message object of type 'SetRestrict-response"
  "1f3913cc9796519611b8018d97267e81")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetRestrict-response>)))
  "Returns full string definition for message of type '<SetRestrict-response>"
  (cl:format cl:nil "~%#response constants~%#response fields~%bool    result          #   执行结果，成功或者失败~%int32   message_code    #   额外信息代码~%string  message         #   额外信息，e.g. for error messages~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetRestrict-response)))
  "Returns full string definition for message of type 'SetRestrict-response"
  (cl:format cl:nil "~%#response constants~%#response fields~%bool    result          #   执行结果，成功或者失败~%int32   message_code    #   额外信息代码~%string  message         #   额外信息，e.g. for error messages~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetRestrict-response>))
  (cl:+ 0
     1
     4
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetRestrict-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetRestrict-response
    (cl:cons ':result (result msg))
    (cl:cons ':message_code (message_code msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetRestrict)))
  'SetRestrict-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetRestrict)))
  'SetRestrict-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetRestrict)))
  "Returns string type for a service object of type '<SetRestrict>"
  "robot_msg/SetRestrict")