; Auto-generated. Do not edit!


(cl:in-package robot_msg-srv)


;//! \htmlinclude SaveFrames-request.msg.html

(cl:defclass <SaveFrames-request> (roslisp-msg-protocol:ros-message)
  ((save_flag
    :reader save_flag
    :initarg :save_flag
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SaveFrames-request (<SaveFrames-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveFrames-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveFrames-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<SaveFrames-request> is deprecated: use robot_msg-srv:SaveFrames-request instead.")))

(cl:ensure-generic-function 'save_flag-val :lambda-list '(m))
(cl:defmethod save_flag-val ((m <SaveFrames-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:save_flag-val is deprecated.  Use robot_msg-srv:save_flag instead.")
  (save_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveFrames-request>) ostream)
  "Serializes a message object of type '<SaveFrames-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'save_flag) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveFrames-request>) istream)
  "Deserializes a message object of type '<SaveFrames-request>"
    (cl:setf (cl:slot-value msg 'save_flag) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveFrames-request>)))
  "Returns string type for a service object of type '<SaveFrames-request>"
  "robot_msg/SaveFramesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveFrames-request)))
  "Returns string type for a service object of type 'SaveFrames-request"
  "robot_msg/SaveFramesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveFrames-request>)))
  "Returns md5sum for a message object of type '<SaveFrames-request>"
  "78fa97d242f9f98c3b258ac9794f610a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveFrames-request)))
  "Returns md5sum for a message object of type 'SaveFrames-request"
  "78fa97d242f9f98c3b258ac9794f610a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveFrames-request>)))
  "Returns full string definition for message of type '<SaveFrames-request>"
  (cl:format cl:nil "bool save_flag  # true-发送保存帧请求；false-发送停止保存帧请求~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveFrames-request)))
  "Returns full string definition for message of type 'SaveFrames-request"
  (cl:format cl:nil "bool save_flag  # true-发送保存帧请求；false-发送停止保存帧请求~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveFrames-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveFrames-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveFrames-request
    (cl:cons ':save_flag (save_flag msg))
))
;//! \htmlinclude SaveFrames-response.msg.html

(cl:defclass <SaveFrames-response> (roslisp-msg-protocol:ros-message)
  ((finish_flag
    :reader finish_flag
    :initarg :finish_flag
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SaveFrames-response (<SaveFrames-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveFrames-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveFrames-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<SaveFrames-response> is deprecated: use robot_msg-srv:SaveFrames-response instead.")))

(cl:ensure-generic-function 'finish_flag-val :lambda-list '(m))
(cl:defmethod finish_flag-val ((m <SaveFrames-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:finish_flag-val is deprecated.  Use robot_msg-srv:finish_flag instead.")
  (finish_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveFrames-response>) ostream)
  "Serializes a message object of type '<SaveFrames-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finish_flag) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveFrames-response>) istream)
  "Deserializes a message object of type '<SaveFrames-response>"
    (cl:setf (cl:slot-value msg 'finish_flag) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveFrames-response>)))
  "Returns string type for a service object of type '<SaveFrames-response>"
  "robot_msg/SaveFramesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveFrames-response)))
  "Returns string type for a service object of type 'SaveFrames-response"
  "robot_msg/SaveFramesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveFrames-response>)))
  "Returns md5sum for a message object of type '<SaveFrames-response>"
  "78fa97d242f9f98c3b258ac9794f610a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveFrames-response)))
  "Returns md5sum for a message object of type 'SaveFrames-response"
  "78fa97d242f9f98c3b258ac9794f610a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveFrames-response>)))
  "Returns full string definition for message of type '<SaveFrames-response>"
  (cl:format cl:nil "bool finish_flag # true-完成标志； false-未完成标志~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveFrames-response)))
  "Returns full string definition for message of type 'SaveFrames-response"
  (cl:format cl:nil "bool finish_flag # true-完成标志； false-未完成标志~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveFrames-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveFrames-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveFrames-response
    (cl:cons ':finish_flag (finish_flag msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SaveFrames)))
  'SaveFrames-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SaveFrames)))
  'SaveFrames-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveFrames)))
  "Returns string type for a service object of type '<SaveFrames>"
  "robot_msg/SaveFrames")