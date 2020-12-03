; Auto-generated. Do not edit!


(cl:in-package robot_msg-srv)


;//! \htmlinclude TrainScan-request.msg.html

(cl:defclass <TrainScan-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass TrainScan-request (<TrainScan-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrainScan-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrainScan-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<TrainScan-request> is deprecated: use robot_msg-srv:TrainScan-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <TrainScan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:path-val is deprecated.  Use robot_msg-srv:path instead.")
  (path m))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <TrainScan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:filename-val is deprecated.  Use robot_msg-srv:filename instead.")
  (filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrainScan-request>) ostream)
  "Serializes a message object of type '<TrainScan-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrainScan-request>) istream)
  "Deserializes a message object of type '<TrainScan-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrainScan-request>)))
  "Returns string type for a service object of type '<TrainScan-request>"
  "robot_msg/TrainScanRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrainScan-request)))
  "Returns string type for a service object of type 'TrainScan-request"
  "robot_msg/TrainScanRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrainScan-request>)))
  "Returns md5sum for a message object of type '<TrainScan-request>"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrainScan-request)))
  "Returns md5sum for a message object of type 'TrainScan-request"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrainScan-request>)))
  "Returns full string definition for message of type '<TrainScan-request>"
  (cl:format cl:nil "string path # path to store files for {scan, voc, bow};~%string filename # string for prefix of the files~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrainScan-request)))
  "Returns full string definition for message of type 'TrainScan-request"
  (cl:format cl:nil "string path # path to store files for {scan, voc, bow};~%string filename # string for prefix of the files~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrainScan-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path))
     4 (cl:length (cl:slot-value msg 'filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrainScan-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TrainScan-request
    (cl:cons ':path (path msg))
    (cl:cons ':filename (filename msg))
))
;//! \htmlinclude TrainScan-response.msg.html

(cl:defclass <TrainScan-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TrainScan-response (<TrainScan-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrainScan-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrainScan-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<TrainScan-response> is deprecated: use robot_msg-srv:TrainScan-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <TrainScan-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:result-val is deprecated.  Use robot_msg-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrainScan-response>) ostream)
  "Serializes a message object of type '<TrainScan-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrainScan-response>) istream)
  "Deserializes a message object of type '<TrainScan-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrainScan-response>)))
  "Returns string type for a service object of type '<TrainScan-response>"
  "robot_msg/TrainScanResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrainScan-response)))
  "Returns string type for a service object of type 'TrainScan-response"
  "robot_msg/TrainScanResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrainScan-response>)))
  "Returns md5sum for a message object of type '<TrainScan-response>"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrainScan-response)))
  "Returns md5sum for a message object of type 'TrainScan-response"
  "9c408861d9ae9ea33255ca346b01a6f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrainScan-response>)))
  "Returns full string definition for message of type '<TrainScan-response>"
  (cl:format cl:nil "bool result # to indicate success or not~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrainScan-response)))
  "Returns full string definition for message of type 'TrainScan-response"
  (cl:format cl:nil "bool result # to indicate success or not~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrainScan-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrainScan-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TrainScan-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TrainScan)))
  'TrainScan-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TrainScan)))
  'TrainScan-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrainScan)))
  "Returns string type for a service object of type '<TrainScan>"
  "robot_msg/TrainScan")