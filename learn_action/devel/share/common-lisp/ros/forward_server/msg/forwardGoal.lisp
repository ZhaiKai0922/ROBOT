; Auto-generated. Do not edit!


(cl:in-package forward_server-msg)


;//! \htmlinclude forwardGoal.msg.html

(cl:defclass <forwardGoal> (roslisp-msg-protocol:ros-message)
  ((line
    :reader line
    :initarg :line
    :type cl:float
    :initform 0.0)
   (line_velocity
    :reader line_velocity
    :initarg :line_velocity
    :type cl:float
    :initform 0.0)
   (time_out
    :reader time_out
    :initarg :time_out
    :type cl:float
    :initform 0.0))
)

(cl:defclass forwardGoal (<forwardGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <forwardGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'forwardGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name forward_server-msg:<forwardGoal> is deprecated: use forward_server-msg:forwardGoal instead.")))

(cl:ensure-generic-function 'line-val :lambda-list '(m))
(cl:defmethod line-val ((m <forwardGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader forward_server-msg:line-val is deprecated.  Use forward_server-msg:line instead.")
  (line m))

(cl:ensure-generic-function 'line_velocity-val :lambda-list '(m))
(cl:defmethod line_velocity-val ((m <forwardGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader forward_server-msg:line_velocity-val is deprecated.  Use forward_server-msg:line_velocity instead.")
  (line_velocity m))

(cl:ensure-generic-function 'time_out-val :lambda-list '(m))
(cl:defmethod time_out-val ((m <forwardGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader forward_server-msg:time_out-val is deprecated.  Use forward_server-msg:time_out instead.")
  (time_out m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <forwardGoal>) ostream)
  "Serializes a message object of type '<forwardGoal>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'line))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'line_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time_out))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <forwardGoal>) istream)
  "Deserializes a message object of type '<forwardGoal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'line) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'line_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time_out) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<forwardGoal>)))
  "Returns string type for a message object of type '<forwardGoal>"
  "forward_server/forwardGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'forwardGoal)))
  "Returns string type for a message object of type 'forwardGoal"
  "forward_server/forwardGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<forwardGoal>)))
  "Returns md5sum for a message object of type '<forwardGoal>"
  "1ea14902e630c8a1c9802214171cc9f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'forwardGoal)))
  "Returns md5sum for a message object of type 'forwardGoal"
  "1ea14902e630c8a1c9802214171cc9f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<forwardGoal>)))
  "Returns full string definition for message of type '<forwardGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%float64 line~%float64 line_velocity~%float64 time_out~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'forwardGoal)))
  "Returns full string definition for message of type 'forwardGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%float64 line~%float64 line_velocity~%float64 time_out~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <forwardGoal>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <forwardGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'forwardGoal
    (cl:cons ':line (line msg))
    (cl:cons ':line_velocity (line_velocity msg))
    (cl:cons ':time_out (time_out msg))
))
