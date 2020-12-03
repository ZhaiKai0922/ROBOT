; Auto-generated. Do not edit!


(cl:in-package robot_msg-msg)


;//! \htmlinclude FeedBack.msg.html

(cl:defclass <FeedBack> (roslisp-msg-protocol:ros-message)
  ((feedback
    :reader feedback
    :initarg :feedback
    :type cl:integer
    :initform 0)
   (feedbackStr
    :reader feedbackStr
    :initarg :feedbackStr
    :type cl:string
    :initform ""))
)

(cl:defclass FeedBack (<FeedBack>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FeedBack>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FeedBack)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-msg:<FeedBack> is deprecated: use robot_msg-msg:FeedBack instead.")))

(cl:ensure-generic-function 'feedback-val :lambda-list '(m))
(cl:defmethod feedback-val ((m <FeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:feedback-val is deprecated.  Use robot_msg-msg:feedback instead.")
  (feedback m))

(cl:ensure-generic-function 'feedbackStr-val :lambda-list '(m))
(cl:defmethod feedbackStr-val ((m <FeedBack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:feedbackStr-val is deprecated.  Use robot_msg-msg:feedbackStr instead.")
  (feedbackStr m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<FeedBack>)))
    "Constants for message type '<FeedBack>"
  '((:NONE . 0))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'FeedBack)))
    "Constants for message type 'FeedBack"
  '((:NONE . 0))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FeedBack>) ostream)
  "Serializes a message object of type '<FeedBack>"
  (cl:let* ((signed (cl:slot-value msg 'feedback)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'feedbackStr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'feedbackStr))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FeedBack>) istream)
  "Deserializes a message object of type '<FeedBack>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'feedback) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'feedbackStr) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'feedbackStr) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FeedBack>)))
  "Returns string type for a message object of type '<FeedBack>"
  "robot_msg/FeedBack")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FeedBack)))
  "Returns string type for a message object of type 'FeedBack"
  "robot_msg/FeedBack")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FeedBack>)))
  "Returns md5sum for a message object of type '<FeedBack>"
  "0f9d77a5ebec864d5c1481f385477d58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FeedBack)))
  "Returns md5sum for a message object of type 'FeedBack"
  "0f9d77a5ebec864d5c1481f385477d58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FeedBack>)))
  "Returns full string definition for message of type '<FeedBack>"
  (cl:format cl:nil "# msg definition~%~%# feedback enum~%int32 NONE              = 0 # none~%                            # others...~%~%int32           feedback 	    # result feedback~%string 		    feedbackStr  	# feedback to string~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FeedBack)))
  "Returns full string definition for message of type 'FeedBack"
  (cl:format cl:nil "# msg definition~%~%# feedback enum~%int32 NONE              = 0 # none~%                            # others...~%~%int32           feedback 	    # result feedback~%string 		    feedbackStr  	# feedback to string~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FeedBack>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'feedbackStr))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FeedBack>))
  "Converts a ROS message object to a list"
  (cl:list 'FeedBack
    (cl:cons ':feedback (feedback msg))
    (cl:cons ':feedbackStr (feedbackStr msg))
))
