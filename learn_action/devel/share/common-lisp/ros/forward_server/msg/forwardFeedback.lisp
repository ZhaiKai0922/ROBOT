; Auto-generated. Do not edit!


(cl:in-package forward_server-msg)


;//! \htmlinclude forwardFeedback.msg.html

(cl:defclass <forwardFeedback> (roslisp-msg-protocol:ros-message)
  ((feedback_x
    :reader feedback_x
    :initarg :feedback_x
    :type cl:float
    :initform 0.0)
   (feedback_y
    :reader feedback_y
    :initarg :feedback_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass forwardFeedback (<forwardFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <forwardFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'forwardFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name forward_server-msg:<forwardFeedback> is deprecated: use forward_server-msg:forwardFeedback instead.")))

(cl:ensure-generic-function 'feedback_x-val :lambda-list '(m))
(cl:defmethod feedback_x-val ((m <forwardFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader forward_server-msg:feedback_x-val is deprecated.  Use forward_server-msg:feedback_x instead.")
  (feedback_x m))

(cl:ensure-generic-function 'feedback_y-val :lambda-list '(m))
(cl:defmethod feedback_y-val ((m <forwardFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader forward_server-msg:feedback_y-val is deprecated.  Use forward_server-msg:feedback_y instead.")
  (feedback_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <forwardFeedback>) ostream)
  "Serializes a message object of type '<forwardFeedback>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'feedback_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'feedback_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <forwardFeedback>) istream)
  "Deserializes a message object of type '<forwardFeedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'feedback_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'feedback_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<forwardFeedback>)))
  "Returns string type for a message object of type '<forwardFeedback>"
  "forward_server/forwardFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'forwardFeedback)))
  "Returns string type for a message object of type 'forwardFeedback"
  "forward_server/forwardFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<forwardFeedback>)))
  "Returns md5sum for a message object of type '<forwardFeedback>"
  "28b2f4c6bff997642d6c7dab1fe99c89")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'forwardFeedback)))
  "Returns md5sum for a message object of type 'forwardFeedback"
  "28b2f4c6bff997642d6c7dab1fe99c89")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<forwardFeedback>)))
  "Returns full string definition for message of type '<forwardFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback~%float64 feedback_x~%float64 feedback_y~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'forwardFeedback)))
  "Returns full string definition for message of type 'forwardFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback~%float64 feedback_x~%float64 feedback_y~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <forwardFeedback>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <forwardFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'forwardFeedback
    (cl:cons ':feedback_x (feedback_x msg))
    (cl:cons ':feedback_y (feedback_y msg))
))
