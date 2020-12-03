; Auto-generated. Do not edit!


(cl:in-package robot_msg-srv)


;//! \htmlinclude SetDevice-request.msg.html

(cl:defclass <SetDevice-request> (roslisp-msg-protocol:ros-message)
  ((device_id
    :reader device_id
    :initarg :device_id
    :type cl:string
    :initform "")
   (cmd
    :reader cmd
    :initarg :cmd
    :type cl:string
    :initform "")
   (parameter1
    :reader parameter1
    :initarg :parameter1
    :type cl:integer
    :initform 0)
   (parameter2
    :reader parameter2
    :initarg :parameter2
    :type cl:integer
    :initform 0))
)

(cl:defclass SetDevice-request (<SetDevice-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetDevice-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetDevice-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<SetDevice-request> is deprecated: use robot_msg-srv:SetDevice-request instead.")))

(cl:ensure-generic-function 'device_id-val :lambda-list '(m))
(cl:defmethod device_id-val ((m <SetDevice-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:device_id-val is deprecated.  Use robot_msg-srv:device_id instead.")
  (device_id m))

(cl:ensure-generic-function 'cmd-val :lambda-list '(m))
(cl:defmethod cmd-val ((m <SetDevice-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:cmd-val is deprecated.  Use robot_msg-srv:cmd instead.")
  (cmd m))

(cl:ensure-generic-function 'parameter1-val :lambda-list '(m))
(cl:defmethod parameter1-val ((m <SetDevice-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:parameter1-val is deprecated.  Use robot_msg-srv:parameter1 instead.")
  (parameter1 m))

(cl:ensure-generic-function 'parameter2-val :lambda-list '(m))
(cl:defmethod parameter2-val ((m <SetDevice-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:parameter2-val is deprecated.  Use robot_msg-srv:parameter2 instead.")
  (parameter2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetDevice-request>) ostream)
  "Serializes a message object of type '<SetDevice-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'device_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'device_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'cmd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'cmd))
  (cl:let* ((signed (cl:slot-value msg 'parameter1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'parameter2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetDevice-request>) istream)
  "Deserializes a message object of type '<SetDevice-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'device_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'device_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cmd) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'cmd) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'parameter1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'parameter2) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetDevice-request>)))
  "Returns string type for a service object of type '<SetDevice-request>"
  "robot_msg/SetDeviceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDevice-request)))
  "Returns string type for a service object of type 'SetDevice-request"
  "robot_msg/SetDeviceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetDevice-request>)))
  "Returns md5sum for a message object of type '<SetDevice-request>"
  "4bbe5313598b86e0231eb9e4ecd3e0c0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetDevice-request)))
  "Returns md5sum for a message object of type 'SetDevice-request"
  "4bbe5313598b86e0231eb9e4ecd3e0c0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetDevice-request>)))
  "Returns full string definition for message of type '<SetDevice-request>"
  (cl:format cl:nil "# srv definition~%~%#request constants~%# device_id:            cmd                 param1           param2~%#    \"motor\"~%#                       \"release_motor\"     0： 上电锁轴~%#                                           1: 下电松轴~%#    \"humidifier\"~%#                       \"power\"             0： 开机~%#                                           1： 关机~%#                       \"fog_level\"         雾量等级~%#~%#request fields~%string  device_id       # 硬件设备id~%string  cmd             # 命令id~%int32   parameter1      # 参数1~%int32   parameter2      # 参数2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetDevice-request)))
  "Returns full string definition for message of type 'SetDevice-request"
  (cl:format cl:nil "# srv definition~%~%#request constants~%# device_id:            cmd                 param1           param2~%#    \"motor\"~%#                       \"release_motor\"     0： 上电锁轴~%#                                           1: 下电松轴~%#    \"humidifier\"~%#                       \"power\"             0： 开机~%#                                           1： 关机~%#                       \"fog_level\"         雾量等级~%#~%#request fields~%string  device_id       # 硬件设备id~%string  cmd             # 命令id~%int32   parameter1      # 参数1~%int32   parameter2      # 参数2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetDevice-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'device_id))
     4 (cl:length (cl:slot-value msg 'cmd))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetDevice-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetDevice-request
    (cl:cons ':device_id (device_id msg))
    (cl:cons ':cmd (cmd msg))
    (cl:cons ':parameter1 (parameter1 msg))
    (cl:cons ':parameter2 (parameter2 msg))
))
;//! \htmlinclude SetDevice-response.msg.html

(cl:defclass <SetDevice-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetDevice-response (<SetDevice-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetDevice-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetDevice-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<SetDevice-response> is deprecated: use robot_msg-srv:SetDevice-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <SetDevice-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:result-val is deprecated.  Use robot_msg-srv:result instead.")
  (result m))

(cl:ensure-generic-function 'message_code-val :lambda-list '(m))
(cl:defmethod message_code-val ((m <SetDevice-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:message_code-val is deprecated.  Use robot_msg-srv:message_code instead.")
  (message_code m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetDevice-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:message-val is deprecated.  Use robot_msg-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetDevice-response>) ostream)
  "Serializes a message object of type '<SetDevice-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetDevice-response>) istream)
  "Deserializes a message object of type '<SetDevice-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetDevice-response>)))
  "Returns string type for a service object of type '<SetDevice-response>"
  "robot_msg/SetDeviceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDevice-response)))
  "Returns string type for a service object of type 'SetDevice-response"
  "robot_msg/SetDeviceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetDevice-response>)))
  "Returns md5sum for a message object of type '<SetDevice-response>"
  "4bbe5313598b86e0231eb9e4ecd3e0c0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetDevice-response)))
  "Returns md5sum for a message object of type 'SetDevice-response"
  "4bbe5313598b86e0231eb9e4ecd3e0c0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetDevice-response>)))
  "Returns full string definition for message of type '<SetDevice-response>"
  (cl:format cl:nil "~%#response constants~%~%#response fields~%bool    result          #   收到命令，成功或者失败~%int32   message_code    #   额外信息代码~%string  message         #   额外信息，e.g. for error messages~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetDevice-response)))
  "Returns full string definition for message of type 'SetDevice-response"
  (cl:format cl:nil "~%#response constants~%~%#response fields~%bool    result          #   收到命令，成功或者失败~%int32   message_code    #   额外信息代码~%string  message         #   额外信息，e.g. for error messages~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetDevice-response>))
  (cl:+ 0
     1
     4
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetDevice-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetDevice-response
    (cl:cons ':result (result msg))
    (cl:cons ':message_code (message_code msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetDevice)))
  'SetDevice-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetDevice)))
  'SetDevice-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDevice)))
  "Returns string type for a service object of type '<SetDevice>"
  "robot_msg/SetDevice")