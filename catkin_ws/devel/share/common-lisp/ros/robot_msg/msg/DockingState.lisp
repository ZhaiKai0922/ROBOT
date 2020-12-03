; Auto-generated. Do not edit!


(cl:in-package robot_msg-msg)


;//! \htmlinclude DockingState.msg.html

(cl:defclass <DockingState> (roslisp-msg-protocol:ros-message)
  ((docking_state
    :reader docking_state
    :initarg :docking_state
    :type cl:integer
    :initform 0))
)

(cl:defclass DockingState (<DockingState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DockingState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DockingState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-msg:<DockingState> is deprecated: use robot_msg-msg:DockingState instead.")))

(cl:ensure-generic-function 'docking_state-val :lambda-list '(m))
(cl:defmethod docking_state-val ((m <DockingState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:docking_state-val is deprecated.  Use robot_msg-msg:docking_state instead.")
  (docking_state m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DockingState>)))
    "Constants for message type '<DockingState>"
  '((:NONE . 0)
    (:SEARCHING_STATION . 1)
    (:DOCKING_STATION . 2)
    (:DOCKING_SUCCESS . 3)
    (:SEARCHING_FAILURE . 4)
    (:DOCKING_FAILURE . 5)
    (:CANCLED . 6))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DockingState)))
    "Constants for message type 'DockingState"
  '((:NONE . 0)
    (:SEARCHING_STATION . 1)
    (:DOCKING_STATION . 2)
    (:DOCKING_SUCCESS . 3)
    (:SEARCHING_FAILURE . 4)
    (:DOCKING_FAILURE . 5)
    (:CANCLED . 6))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DockingState>) ostream)
  "Serializes a message object of type '<DockingState>"
  (cl:let* ((signed (cl:slot-value msg 'docking_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DockingState>) istream)
  "Deserializes a message object of type '<DockingState>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'docking_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DockingState>)))
  "Returns string type for a message object of type '<DockingState>"
  "robot_msg/DockingState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DockingState)))
  "Returns string type for a message object of type 'DockingState"
  "robot_msg/DockingState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DockingState>)))
  "Returns md5sum for a message object of type '<DockingState>"
  "d0cea54154831428974ca314f83a5bb0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DockingState)))
  "Returns md5sum for a message object of type 'DockingState"
  "d0cea54154831428974ca314f83a5bb0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DockingState>)))
  "Returns full string definition for message of type '<DockingState>"
  (cl:format cl:nil "# msg definition~%~%# constants state enum~%int32 NONE              = 0 #初始化状态~%int32 SEARCHING_STATION = 1 # 1-寻找充电桩~%int32 DOCKING_STATION   = 2 # 2-对接中~%int32 DOCKING_SUCCESS   = 3 # 3-对接成功~%int32 SEARCHING_FAILURE = 4 # 4-失败-未找到充电桩~%int32 DOCKING_FAILURE   = 5 # 5-失败-对接失败~%int32 CANCLED           = 6 # 6-成功-动作被取消~%~%# fields~%int32 		docking_state  #机器人回充状态~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DockingState)))
  "Returns full string definition for message of type 'DockingState"
  (cl:format cl:nil "# msg definition~%~%# constants state enum~%int32 NONE              = 0 #初始化状态~%int32 SEARCHING_STATION = 1 # 1-寻找充电桩~%int32 DOCKING_STATION   = 2 # 2-对接中~%int32 DOCKING_SUCCESS   = 3 # 3-对接成功~%int32 SEARCHING_FAILURE = 4 # 4-失败-未找到充电桩~%int32 DOCKING_FAILURE   = 5 # 5-失败-对接失败~%int32 CANCLED           = 6 # 6-成功-动作被取消~%~%# fields~%int32 		docking_state  #机器人回充状态~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DockingState>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DockingState>))
  "Converts a ROS message object to a list"
  (cl:list 'DockingState
    (cl:cons ':docking_state (docking_state msg))
))
