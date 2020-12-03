; Auto-generated. Do not edit!


(cl:in-package robot_msg-msg)


;//! \htmlinclude Humidifier.msg.html

(cl:defclass <Humidifier> (roslisp-msg-protocol:ros-message)
  ((power_state
    :reader power_state
    :initarg :power_state
    :type cl:fixnum
    :initform 0)
   (fog_level
    :reader fog_level
    :initarg :fog_level
    :type cl:fixnum
    :initform 0)
   (warn_water_low
    :reader warn_water_low
    :initarg :warn_water_low
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Humidifier (<Humidifier>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Humidifier>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Humidifier)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-msg:<Humidifier> is deprecated: use robot_msg-msg:Humidifier instead.")))

(cl:ensure-generic-function 'power_state-val :lambda-list '(m))
(cl:defmethod power_state-val ((m <Humidifier>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:power_state-val is deprecated.  Use robot_msg-msg:power_state instead.")
  (power_state m))

(cl:ensure-generic-function 'fog_level-val :lambda-list '(m))
(cl:defmethod fog_level-val ((m <Humidifier>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:fog_level-val is deprecated.  Use robot_msg-msg:fog_level instead.")
  (fog_level m))

(cl:ensure-generic-function 'warn_water_low-val :lambda-list '(m))
(cl:defmethod warn_water_low-val ((m <Humidifier>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:warn_water_low-val is deprecated.  Use robot_msg-msg:warn_water_low instead.")
  (warn_water_low m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Humidifier>) ostream)
  "Serializes a message object of type '<Humidifier>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'power_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fog_level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'warn_water_low)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Humidifier>) istream)
  "Deserializes a message object of type '<Humidifier>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'power_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fog_level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'warn_water_low)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Humidifier>)))
  "Returns string type for a message object of type '<Humidifier>"
  "robot_msg/Humidifier")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Humidifier)))
  "Returns string type for a message object of type 'Humidifier"
  "robot_msg/Humidifier")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Humidifier>)))
  "Returns md5sum for a message object of type '<Humidifier>"
  "f6577daff9e5c3c518197df2a56537ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Humidifier)))
  "Returns md5sum for a message object of type 'Humidifier"
  "f6577daff9e5c3c518197df2a56537ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Humidifier>)))
  "Returns full string definition for message of type '<Humidifier>"
  (cl:format cl:nil "# msg definition~%~%uint8   power_state     # 0 关机 1 开机~%uint8   fog_level       # 当前设置雾量等级      1~~7挡~%uint8   warn_water_low      # 低水位告警状态        0 正常 1 告警~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Humidifier)))
  "Returns full string definition for message of type 'Humidifier"
  (cl:format cl:nil "# msg definition~%~%uint8   power_state     # 0 关机 1 开机~%uint8   fog_level       # 当前设置雾量等级      1~~7挡~%uint8   warn_water_low      # 低水位告警状态        0 正常 1 告警~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Humidifier>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Humidifier>))
  "Converts a ROS message object to a list"
  (cl:list 'Humidifier
    (cl:cons ':power_state (power_state msg))
    (cl:cons ':fog_level (fog_level msg))
    (cl:cons ':warn_water_low (warn_water_low msg))
))
