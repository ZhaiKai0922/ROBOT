; Auto-generated. Do not edit!


(cl:in-package robot_msg-msg)


;//! \htmlinclude BaseInfo.msg.html

(cl:defclass <BaseInfo> (roslisp-msg-protocol:ros-message)
  ((connected
    :reader connected
    :initarg :connected
    :type cl:boolean
    :initform cl:nil)
   (base_device_state
    :reader base_device_state
    :initarg :base_device_state
    :type cl:fixnum
    :initform 0)
   (cliff_left
    :reader cliff_left
    :initarg :cliff_left
    :type cl:boolean
    :initform cl:nil)
   (cliff_front_left
    :reader cliff_front_left
    :initarg :cliff_front_left
    :type cl:boolean
    :initform cl:nil)
   (cliff_front_right
    :reader cliff_front_right
    :initarg :cliff_front_right
    :type cl:boolean
    :initform cl:nil)
   (cliff_right
    :reader cliff_right
    :initarg :cliff_right
    :type cl:boolean
    :initform cl:nil)
   (bump_state_left
    :reader bump_state_left
    :initarg :bump_state_left
    :type cl:boolean
    :initform cl:nil)
   (bump_state_right
    :reader bump_state_right
    :initarg :bump_state_right
    :type cl:boolean
    :initform cl:nil)
   (chargingVol
    :reader chargingVol
    :initarg :chargingVol
    :type cl:fixnum
    :initform 0)
   (chargingState
    :reader chargingState
    :initarg :chargingState
    :type cl:fixnum
    :initform 0)
   (motor_left_err_code
    :reader motor_left_err_code
    :initarg :motor_left_err_code
    :type cl:fixnum
    :initform 0)
   (motor_right_err_code
    :reader motor_right_err_code
    :initarg :motor_right_err_code
    :type cl:fixnum
    :initform 0)
   (bump_enable
    :reader bump_enable
    :initarg :bump_enable
    :type cl:boolean
    :initform cl:nil)
   (cliff_enable
    :reader cliff_enable
    :initarg :cliff_enable
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BaseInfo (<BaseInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BaseInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BaseInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-msg:<BaseInfo> is deprecated: use robot_msg-msg:BaseInfo instead.")))

(cl:ensure-generic-function 'connected-val :lambda-list '(m))
(cl:defmethod connected-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:connected-val is deprecated.  Use robot_msg-msg:connected instead.")
  (connected m))

(cl:ensure-generic-function 'base_device_state-val :lambda-list '(m))
(cl:defmethod base_device_state-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:base_device_state-val is deprecated.  Use robot_msg-msg:base_device_state instead.")
  (base_device_state m))

(cl:ensure-generic-function 'cliff_left-val :lambda-list '(m))
(cl:defmethod cliff_left-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:cliff_left-val is deprecated.  Use robot_msg-msg:cliff_left instead.")
  (cliff_left m))

(cl:ensure-generic-function 'cliff_front_left-val :lambda-list '(m))
(cl:defmethod cliff_front_left-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:cliff_front_left-val is deprecated.  Use robot_msg-msg:cliff_front_left instead.")
  (cliff_front_left m))

(cl:ensure-generic-function 'cliff_front_right-val :lambda-list '(m))
(cl:defmethod cliff_front_right-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:cliff_front_right-val is deprecated.  Use robot_msg-msg:cliff_front_right instead.")
  (cliff_front_right m))

(cl:ensure-generic-function 'cliff_right-val :lambda-list '(m))
(cl:defmethod cliff_right-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:cliff_right-val is deprecated.  Use robot_msg-msg:cliff_right instead.")
  (cliff_right m))

(cl:ensure-generic-function 'bump_state_left-val :lambda-list '(m))
(cl:defmethod bump_state_left-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:bump_state_left-val is deprecated.  Use robot_msg-msg:bump_state_left instead.")
  (bump_state_left m))

(cl:ensure-generic-function 'bump_state_right-val :lambda-list '(m))
(cl:defmethod bump_state_right-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:bump_state_right-val is deprecated.  Use robot_msg-msg:bump_state_right instead.")
  (bump_state_right m))

(cl:ensure-generic-function 'chargingVol-val :lambda-list '(m))
(cl:defmethod chargingVol-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:chargingVol-val is deprecated.  Use robot_msg-msg:chargingVol instead.")
  (chargingVol m))

(cl:ensure-generic-function 'chargingState-val :lambda-list '(m))
(cl:defmethod chargingState-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:chargingState-val is deprecated.  Use robot_msg-msg:chargingState instead.")
  (chargingState m))

(cl:ensure-generic-function 'motor_left_err_code-val :lambda-list '(m))
(cl:defmethod motor_left_err_code-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:motor_left_err_code-val is deprecated.  Use robot_msg-msg:motor_left_err_code instead.")
  (motor_left_err_code m))

(cl:ensure-generic-function 'motor_right_err_code-val :lambda-list '(m))
(cl:defmethod motor_right_err_code-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:motor_right_err_code-val is deprecated.  Use robot_msg-msg:motor_right_err_code instead.")
  (motor_right_err_code m))

(cl:ensure-generic-function 'bump_enable-val :lambda-list '(m))
(cl:defmethod bump_enable-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:bump_enable-val is deprecated.  Use robot_msg-msg:bump_enable instead.")
  (bump_enable m))

(cl:ensure-generic-function 'cliff_enable-val :lambda-list '(m))
(cl:defmethod cliff_enable-val ((m <BaseInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:cliff_enable-val is deprecated.  Use robot_msg-msg:cliff_enable instead.")
  (cliff_enable m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<BaseInfo>)))
    "Constants for message type '<BaseInfo>"
  '((:DEVICE_EMERGENCY . 1)
    (:ROS_NO_CMD . 2)
    (:DRIVER_LOST . 4)
    (:IMU_LOST . 8)
    (:RELEASE_MOTOR . 16)
    (:BMS_LOST . 32)
    (:UNCHARGING . 0)
    (:CHARGING . 1)
    (:DOCK_IN . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'BaseInfo)))
    "Constants for message type 'BaseInfo"
  '((:DEVICE_EMERGENCY . 1)
    (:ROS_NO_CMD . 2)
    (:DRIVER_LOST . 4)
    (:IMU_LOST . 8)
    (:RELEASE_MOTOR . 16)
    (:BMS_LOST . 32)
    (:UNCHARGING . 0)
    (:CHARGING . 1)
    (:DOCK_IN . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BaseInfo>) ostream)
  "Serializes a message object of type '<BaseInfo>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'connected) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'base_device_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cliff_left) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cliff_front_left) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cliff_front_right) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cliff_right) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bump_state_left) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bump_state_right) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chargingVol)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'chargingVol)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chargingState)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_left_err_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'motor_left_err_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_right_err_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'motor_right_err_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bump_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'cliff_enable) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BaseInfo>) istream)
  "Deserializes a message object of type '<BaseInfo>"
    (cl:setf (cl:slot-value msg 'connected) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'base_device_state)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cliff_left) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'cliff_front_left) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'cliff_front_right) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'cliff_right) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'bump_state_left) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'bump_state_right) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chargingVol)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'chargingVol)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chargingState)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_left_err_code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'motor_left_err_code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_right_err_code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'motor_right_err_code)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bump_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'cliff_enable) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BaseInfo>)))
  "Returns string type for a message object of type '<BaseInfo>"
  "robot_msg/BaseInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BaseInfo)))
  "Returns string type for a message object of type 'BaseInfo"
  "robot_msg/BaseInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BaseInfo>)))
  "Returns md5sum for a message object of type '<BaseInfo>"
  "3067a4347f837a8395157fa5164b6588")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BaseInfo)))
  "Returns md5sum for a message object of type 'BaseInfo"
  "3067a4347f837a8395157fa5164b6588")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BaseInfo>)))
  "Returns full string definition for message of type '<BaseInfo>"
  (cl:format cl:nil "# msg definition~%# base_device_state enum~%uint8   DEVICE_EMERGENCY    = 1 # 急停按下~%uint8   ROS_NO_CMD          = 2 # 未收到ros指令~%uint8   DRIVER_LOST         = 4 # 驱动器无响应~%uint8   IMU_LOST            = 8 # imu无响应~%uint8   RELEASE_MOTOR       = 16 # 电机下电失能~%uint8   BMS_LOST            = 32 # bms无响应~%~%# charging State enum~%uint8   UNCHARGING          = 0 # 未充电~%uint8   CHARGING            = 1 # 充电中~%uint8   DOCK_IN             = 2 # 接触，未充电~%~%bool        connected               #   底盘连接状态~%uint8       base_device_state       #   底盘基本外设状态~%bool        cliff_left              #   左跌落~%bool        cliff_front_left        #   前左~%bool        cliff_front_right       #   前右~%bool        cliff_right             #   右跌落~%bool        bump_state_left         #   左碰撞~%bool        bump_state_right        #   右碰撞~%uint16      chargingVol             #   充电电压  10mv~%uint8       chargingState           #   充电状态~%uint16      motor_left_err_code     #   电机错误码~%uint16      motor_right_err_code    #~%bool        bump_enable             #   碰撞传感器使能~%bool        cliff_enable            #   跌落使能~%#uint32[]    adc_channal             #   ADC传感器通道值，跌落传感器等~%#uint32[]    range_sensors           #   超声 tof数据等~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BaseInfo)))
  "Returns full string definition for message of type 'BaseInfo"
  (cl:format cl:nil "# msg definition~%# base_device_state enum~%uint8   DEVICE_EMERGENCY    = 1 # 急停按下~%uint8   ROS_NO_CMD          = 2 # 未收到ros指令~%uint8   DRIVER_LOST         = 4 # 驱动器无响应~%uint8   IMU_LOST            = 8 # imu无响应~%uint8   RELEASE_MOTOR       = 16 # 电机下电失能~%uint8   BMS_LOST            = 32 # bms无响应~%~%# charging State enum~%uint8   UNCHARGING          = 0 # 未充电~%uint8   CHARGING            = 1 # 充电中~%uint8   DOCK_IN             = 2 # 接触，未充电~%~%bool        connected               #   底盘连接状态~%uint8       base_device_state       #   底盘基本外设状态~%bool        cliff_left              #   左跌落~%bool        cliff_front_left        #   前左~%bool        cliff_front_right       #   前右~%bool        cliff_right             #   右跌落~%bool        bump_state_left         #   左碰撞~%bool        bump_state_right        #   右碰撞~%uint16      chargingVol             #   充电电压  10mv~%uint8       chargingState           #   充电状态~%uint16      motor_left_err_code     #   电机错误码~%uint16      motor_right_err_code    #~%bool        bump_enable             #   碰撞传感器使能~%bool        cliff_enable            #   跌落使能~%#uint32[]    adc_channal             #   ADC传感器通道值，跌落传感器等~%#uint32[]    range_sensors           #   超声 tof数据等~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BaseInfo>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
     2
     1
     2
     2
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BaseInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'BaseInfo
    (cl:cons ':connected (connected msg))
    (cl:cons ':base_device_state (base_device_state msg))
    (cl:cons ':cliff_left (cliff_left msg))
    (cl:cons ':cliff_front_left (cliff_front_left msg))
    (cl:cons ':cliff_front_right (cliff_front_right msg))
    (cl:cons ':cliff_right (cliff_right msg))
    (cl:cons ':bump_state_left (bump_state_left msg))
    (cl:cons ':bump_state_right (bump_state_right msg))
    (cl:cons ':chargingVol (chargingVol msg))
    (cl:cons ':chargingState (chargingState msg))
    (cl:cons ':motor_left_err_code (motor_left_err_code msg))
    (cl:cons ':motor_right_err_code (motor_right_err_code msg))
    (cl:cons ':bump_enable (bump_enable msg))
    (cl:cons ':cliff_enable (cliff_enable msg))
))
