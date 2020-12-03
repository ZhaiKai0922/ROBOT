; Auto-generated. Do not edit!


(cl:in-package robot_msg-srv)


;//! \htmlinclude MapSaving-request.msg.html

(cl:defclass <MapSaving-request> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type cl:string
    :initform "")
   (filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform ""))
)

(cl:defclass MapSaving-request (<MapSaving-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapSaving-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapSaving-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<MapSaving-request> is deprecated: use robot_msg-srv:MapSaving-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <MapSaving-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:path-val is deprecated.  Use robot_msg-srv:path instead.")
  (path m))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <MapSaving-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:filename-val is deprecated.  Use robot_msg-srv:filename instead.")
  (filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapSaving-request>) ostream)
  "Serializes a message object of type '<MapSaving-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapSaving-request>) istream)
  "Deserializes a message object of type '<MapSaving-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapSaving-request>)))
  "Returns string type for a service object of type '<MapSaving-request>"
  "robot_msg/MapSavingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapSaving-request)))
  "Returns string type for a service object of type 'MapSaving-request"
  "robot_msg/MapSavingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapSaving-request>)))
  "Returns md5sum for a message object of type '<MapSaving-request>"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapSaving-request)))
  "Returns md5sum for a message object of type 'MapSaving-request"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapSaving-request>)))
  "Returns full string definition for message of type '<MapSaving-request>"
  (cl:format cl:nil "string path~%string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapSaving-request)))
  "Returns full string definition for message of type 'MapSaving-request"
  (cl:format cl:nil "string path~%string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapSaving-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path))
     4 (cl:length (cl:slot-value msg 'filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapSaving-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapSaving-request
    (cl:cons ':path (path msg))
    (cl:cons ':filename (filename msg))
))
;//! \htmlinclude MapSaving-response.msg.html

(cl:defclass <MapSaving-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MapSaving-response (<MapSaving-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapSaving-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapSaving-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<MapSaving-response> is deprecated: use robot_msg-srv:MapSaving-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <MapSaving-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:result-val is deprecated.  Use robot_msg-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapSaving-response>) ostream)
  "Serializes a message object of type '<MapSaving-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapSaving-response>) istream)
  "Deserializes a message object of type '<MapSaving-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapSaving-response>)))
  "Returns string type for a service object of type '<MapSaving-response>"
  "robot_msg/MapSavingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapSaving-response)))
  "Returns string type for a service object of type 'MapSaving-response"
  "robot_msg/MapSavingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapSaving-response>)))
  "Returns md5sum for a message object of type '<MapSaving-response>"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapSaving-response)))
  "Returns md5sum for a message object of type 'MapSaving-response"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapSaving-response>)))
  "Returns full string definition for message of type '<MapSaving-response>"
  (cl:format cl:nil "bool    result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapSaving-response)))
  "Returns full string definition for message of type 'MapSaving-response"
  (cl:format cl:nil "bool    result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapSaving-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapSaving-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapSaving-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapSaving)))
  'MapSaving-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapSaving)))
  'MapSaving-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapSaving)))
  "Returns string type for a service object of type '<MapSaving>"
  "robot_msg/MapSaving")