; Auto-generated. Do not edit!


(cl:in-package robot_msg-srv)


;//! \htmlinclude MapLoading-request.msg.html

(cl:defclass <MapLoading-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass MapLoading-request (<MapLoading-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapLoading-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapLoading-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<MapLoading-request> is deprecated: use robot_msg-srv:MapLoading-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <MapLoading-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:path-val is deprecated.  Use robot_msg-srv:path instead.")
  (path m))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <MapLoading-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:filename-val is deprecated.  Use robot_msg-srv:filename instead.")
  (filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapLoading-request>) ostream)
  "Serializes a message object of type '<MapLoading-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapLoading-request>) istream)
  "Deserializes a message object of type '<MapLoading-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapLoading-request>)))
  "Returns string type for a service object of type '<MapLoading-request>"
  "robot_msg/MapLoadingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapLoading-request)))
  "Returns string type for a service object of type 'MapLoading-request"
  "robot_msg/MapLoadingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapLoading-request>)))
  "Returns md5sum for a message object of type '<MapLoading-request>"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapLoading-request)))
  "Returns md5sum for a message object of type 'MapLoading-request"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapLoading-request>)))
  "Returns full string definition for message of type '<MapLoading-request>"
  (cl:format cl:nil "string path~%string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapLoading-request)))
  "Returns full string definition for message of type 'MapLoading-request"
  (cl:format cl:nil "string path~%string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapLoading-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path))
     4 (cl:length (cl:slot-value msg 'filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapLoading-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapLoading-request
    (cl:cons ':path (path msg))
    (cl:cons ':filename (filename msg))
))
;//! \htmlinclude MapLoading-response.msg.html

(cl:defclass <MapLoading-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MapLoading-response (<MapLoading-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapLoading-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapLoading-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<MapLoading-response> is deprecated: use robot_msg-srv:MapLoading-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <MapLoading-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:result-val is deprecated.  Use robot_msg-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapLoading-response>) ostream)
  "Serializes a message object of type '<MapLoading-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapLoading-response>) istream)
  "Deserializes a message object of type '<MapLoading-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapLoading-response>)))
  "Returns string type for a service object of type '<MapLoading-response>"
  "robot_msg/MapLoadingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapLoading-response)))
  "Returns string type for a service object of type 'MapLoading-response"
  "robot_msg/MapLoadingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapLoading-response>)))
  "Returns md5sum for a message object of type '<MapLoading-response>"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapLoading-response)))
  "Returns md5sum for a message object of type 'MapLoading-response"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapLoading-response>)))
  "Returns full string definition for message of type '<MapLoading-response>"
  (cl:format cl:nil "bool    result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapLoading-response)))
  "Returns full string definition for message of type 'MapLoading-response"
  (cl:format cl:nil "bool    result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapLoading-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapLoading-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapLoading-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapLoading)))
  'MapLoading-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapLoading)))
  'MapLoading-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapLoading)))
  "Returns string type for a service object of type '<MapLoading>"
  "robot_msg/MapLoading")