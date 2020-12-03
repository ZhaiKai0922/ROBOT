; Auto-generated. Do not edit!


(cl:in-package robot_msg-msg)


;//! \htmlinclude LocalizationState.msg.html

(cl:defclass <LocalizationState> (roslisp-msg-protocol:ros-message)
  ((localization_state
    :reader localization_state
    :initarg :localization_state
    :type cl:integer
    :initform 0)
   (floor
    :reader floor
    :initarg :floor
    :type cl:integer
    :initform 0)
   (global_pose
    :reader global_pose
    :initarg :global_pose
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (score
    :reader score
    :initarg :score
    :type cl:float
    :initform 0.0)
   (progress
    :reader progress
    :initarg :progress
    :type cl:float
    :initform 0.0))
)

(cl:defclass LocalizationState (<LocalizationState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocalizationState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocalizationState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-msg:<LocalizationState> is deprecated: use robot_msg-msg:LocalizationState instead.")))

(cl:ensure-generic-function 'localization_state-val :lambda-list '(m))
(cl:defmethod localization_state-val ((m <LocalizationState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:localization_state-val is deprecated.  Use robot_msg-msg:localization_state instead.")
  (localization_state m))

(cl:ensure-generic-function 'floor-val :lambda-list '(m))
(cl:defmethod floor-val ((m <LocalizationState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:floor-val is deprecated.  Use robot_msg-msg:floor instead.")
  (floor m))

(cl:ensure-generic-function 'global_pose-val :lambda-list '(m))
(cl:defmethod global_pose-val ((m <LocalizationState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:global_pose-val is deprecated.  Use robot_msg-msg:global_pose instead.")
  (global_pose m))

(cl:ensure-generic-function 'score-val :lambda-list '(m))
(cl:defmethod score-val ((m <LocalizationState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:score-val is deprecated.  Use robot_msg-msg:score instead.")
  (score m))

(cl:ensure-generic-function 'progress-val :lambda-list '(m))
(cl:defmethod progress-val ((m <LocalizationState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:progress-val is deprecated.  Use robot_msg-msg:progress instead.")
  (progress m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<LocalizationState>)))
    "Constants for message type '<LocalizationState>"
  '((:NONE . 0)
    (:MAP_BUILDING . 1)
    (:LOCATING . 2)
    (:SUCCESS . 3)
    (:FAILURE . 4)
    (:MAP_SAVING . 5))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'LocalizationState)))
    "Constants for message type 'LocalizationState"
  '((:NONE . 0)
    (:MAP_BUILDING . 1)
    (:LOCATING . 2)
    (:SUCCESS . 3)
    (:FAILURE . 4)
    (:MAP_SAVING . 5))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocalizationState>) ostream)
  "Serializes a message object of type '<LocalizationState>"
  (cl:let* ((signed (cl:slot-value msg 'localization_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'floor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'global_pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'score))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'progress))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocalizationState>) istream)
  "Deserializes a message object of type '<LocalizationState>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'localization_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'floor) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'global_pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'score) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'progress) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocalizationState>)))
  "Returns string type for a message object of type '<LocalizationState>"
  "robot_msg/LocalizationState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocalizationState)))
  "Returns string type for a message object of type 'LocalizationState"
  "robot_msg/LocalizationState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocalizationState>)))
  "Returns md5sum for a message object of type '<LocalizationState>"
  "1ce43e83728f9fa44734aa425fdc622d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocalizationState)))
  "Returns md5sum for a message object of type 'LocalizationState"
  "1ce43e83728f9fa44734aa425fdc622d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocalizationState>)))
  "Returns full string definition for message of type '<LocalizationState>"
  (cl:format cl:nil "# msg definition 对Android~%~%# localization state enum~%int32 NONE         = 0 # 初始化~%int32 MAP_BUILDING = 1 # 建图中~%int32 LOCATING     = 2 # 定位中~%int32 SUCCESS      = 3 # 定位成功~%int32 FAILURE      = 4 # 定位失败~%int32 MAP_SAVING   = 5 # 地图保存中~%~%int32 		        localization_state      # 机器人定位状态~%int32                   floor                   # 机器人当前所处楼层~%geometry_msgs/Vector3 	global_pose             # 机器人全局位置坐标，(x，y，thete)~%float32                 score                   # 得分~%float32                 progress                # 地图保存进度，100%为已保存状态~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocalizationState)))
  "Returns full string definition for message of type 'LocalizationState"
  (cl:format cl:nil "# msg definition 对Android~%~%# localization state enum~%int32 NONE         = 0 # 初始化~%int32 MAP_BUILDING = 1 # 建图中~%int32 LOCATING     = 2 # 定位中~%int32 SUCCESS      = 3 # 定位成功~%int32 FAILURE      = 4 # 定位失败~%int32 MAP_SAVING   = 5 # 地图保存中~%~%int32 		        localization_state      # 机器人定位状态~%int32                   floor                   # 机器人当前所处楼层~%geometry_msgs/Vector3 	global_pose             # 机器人全局位置坐标，(x，y，thete)~%float32                 score                   # 得分~%float32                 progress                # 地图保存进度，100%为已保存状态~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocalizationState>))
  (cl:+ 0
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'global_pose))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocalizationState>))
  "Converts a ROS message object to a list"
  (cl:list 'LocalizationState
    (cl:cons ':localization_state (localization_state msg))
    (cl:cons ':floor (floor msg))
    (cl:cons ':global_pose (global_pose msg))
    (cl:cons ':score (score msg))
    (cl:cons ':progress (progress msg))
))
