; Auto-generated. Do not edit!


(cl:in-package robot_msg-msg)


;//! \htmlinclude ActionState.msg.html

(cl:defclass <ActionState> (roslisp-msg-protocol:ros-message)
  ((action_state_id
    :reader action_state_id
    :initarg :action_state_id
    :type cl:string
    :initform "")
   (action_feedback
    :reader action_feedback
    :initarg :action_feedback
    :type cl:integer
    :initform 0))
)

(cl:defclass ActionState (<ActionState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActionState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActionState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-msg:<ActionState> is deprecated: use robot_msg-msg:ActionState instead.")))

(cl:ensure-generic-function 'action_state_id-val :lambda-list '(m))
(cl:defmethod action_state_id-val ((m <ActionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:action_state_id-val is deprecated.  Use robot_msg-msg:action_state_id instead.")
  (action_state_id m))

(cl:ensure-generic-function 'action_feedback-val :lambda-list '(m))
(cl:defmethod action_feedback-val ((m <ActionState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:action_feedback-val is deprecated.  Use robot_msg-msg:action_feedback instead.")
  (action_feedback m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ActionState>)))
    "Constants for message type '<ActionState>"
  '((:NONE . 0)
    (:SET_NEW_GOAL . 1)
    (:RUNNING . 2)
    (:GOAL_REACHED . 3)
    (:GOAL_CANCLE . 4)
    (:OBSTACLE . 5)
    (:NO_PATH . 6)
    (:DOCKER_NOTFOUND . 7)
    (:DOCKING_FAILURE . 8)
    (:ERROR_NODEFINE . 9))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ActionState)))
    "Constants for message type 'ActionState"
  '((:NONE . 0)
    (:SET_NEW_GOAL . 1)
    (:RUNNING . 2)
    (:GOAL_REACHED . 3)
    (:GOAL_CANCLE . 4)
    (:OBSTACLE . 5)
    (:NO_PATH . 6)
    (:DOCKER_NOTFOUND . 7)
    (:DOCKING_FAILURE . 8)
    (:ERROR_NODEFINE . 9))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActionState>) ostream)
  "Serializes a message object of type '<ActionState>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action_state_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action_state_id))
  (cl:let* ((signed (cl:slot-value msg 'action_feedback)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActionState>) istream)
  "Deserializes a message object of type '<ActionState>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action_state_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action_state_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action_feedback) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActionState>)))
  "Returns string type for a message object of type '<ActionState>"
  "robot_msg/ActionState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActionState)))
  "Returns string type for a message object of type 'ActionState"
  "robot_msg/ActionState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActionState>)))
  "Returns md5sum for a message object of type '<ActionState>"
  "6a5aedc175e4d4597fe604ea49d45b40")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActionState)))
  "Returns md5sum for a message object of type 'ActionState"
  "6a5aedc175e4d4597fe604ea49d45b40")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActionState>)))
  "Returns full string definition for message of type '<ActionState>"
  (cl:format cl:nil "# msg definition~%~%#   action_state_id: 								~%#	“idle”			    - 空闲		~%#	“sleep”			    - 休眠		~%#	“movebase_goal”	    - 导航到目标点		~%#	”rotate”		    - 旋转一定角度（body系）	~%#   “rotate_to”		    - 旋转到指定朝向（world系）~%#	“go_charging”	    - 返回充电				~%# 	“separate_docker”	- 脱离充电桩		~%#	“remote_telep”	    - 远程遥控~%~%# feedback enum~%int32 NONE              = 0 # none~%int32 SET_NEW_GOAL      = 1 # 收到指令~%int32 RUNNING           = 2 # 动作执行中~%int32 GOAL_REACHED      = 3 # 成功 - 目标达到~%int32 GOAL_CANCLE       = 4 # 成功 - 目标被取消~%int32 OBSTACLE          = 5 # 失败 - 存在障碍物~%int32 NO_PATH           = 6 # 失败 - 没有可行路径~%int32 DOCKER_NOTFOUND   = 7 # 失败 - 未找到充电桩~%int32 DOCKING_FAILURE   = 8 # 失败 - 对接失败~%int32 ERROR_NODEFINE    = 9 # 失败 - 其他异常 STUCK~%~%string 		    action_state_id  	# 机器人所处功能状态id~%int32           action_feedback 	# 动作执行实时状态反馈~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActionState)))
  "Returns full string definition for message of type 'ActionState"
  (cl:format cl:nil "# msg definition~%~%#   action_state_id: 								~%#	“idle”			    - 空闲		~%#	“sleep”			    - 休眠		~%#	“movebase_goal”	    - 导航到目标点		~%#	”rotate”		    - 旋转一定角度（body系）	~%#   “rotate_to”		    - 旋转到指定朝向（world系）~%#	“go_charging”	    - 返回充电				~%# 	“separate_docker”	- 脱离充电桩		~%#	“remote_telep”	    - 远程遥控~%~%# feedback enum~%int32 NONE              = 0 # none~%int32 SET_NEW_GOAL      = 1 # 收到指令~%int32 RUNNING           = 2 # 动作执行中~%int32 GOAL_REACHED      = 3 # 成功 - 目标达到~%int32 GOAL_CANCLE       = 4 # 成功 - 目标被取消~%int32 OBSTACLE          = 5 # 失败 - 存在障碍物~%int32 NO_PATH           = 6 # 失败 - 没有可行路径~%int32 DOCKER_NOTFOUND   = 7 # 失败 - 未找到充电桩~%int32 DOCKING_FAILURE   = 8 # 失败 - 对接失败~%int32 ERROR_NODEFINE    = 9 # 失败 - 其他异常 STUCK~%~%string 		    action_state_id  	# 机器人所处功能状态id~%int32           action_feedback 	# 动作执行实时状态反馈~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActionState>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'action_state_id))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActionState>))
  "Converts a ROS message object to a list"
  (cl:list 'ActionState
    (cl:cons ':action_state_id (action_state_id msg))
    (cl:cons ':action_feedback (action_feedback msg))
))
