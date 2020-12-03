; Auto-generated. Do not edit!


(cl:in-package robot_msg-srv)


;//! \htmlinclude SetAction-request.msg.html

(cl:defclass <SetAction-request> (roslisp-msg-protocol:ros-message)
  ((action_request_id
    :reader action_request_id
    :initarg :action_request_id
    :type cl:string
    :initform "")
   (goal
    :reader goal
    :initarg :goal
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass SetAction-request (<SetAction-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetAction-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetAction-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<SetAction-request> is deprecated: use robot_msg-srv:SetAction-request instead.")))

(cl:ensure-generic-function 'action_request_id-val :lambda-list '(m))
(cl:defmethod action_request_id-val ((m <SetAction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:action_request_id-val is deprecated.  Use robot_msg-srv:action_request_id instead.")
  (action_request_id m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <SetAction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:goal-val is deprecated.  Use robot_msg-srv:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetAction-request>) ostream)
  "Serializes a message object of type '<SetAction-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action_request_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action_request_id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetAction-request>) istream)
  "Deserializes a message object of type '<SetAction-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action_request_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action_request_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetAction-request>)))
  "Returns string type for a service object of type '<SetAction-request>"
  "robot_msg/SetActionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetAction-request)))
  "Returns string type for a service object of type 'SetAction-request"
  "robot_msg/SetActionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetAction-request>)))
  "Returns md5sum for a message object of type '<SetAction-request>"
  "95130fd028332f5dbbdebe1f435d80e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetAction-request)))
  "Returns md5sum for a message object of type 'SetAction-request"
  "95130fd028332f5dbbdebe1f435d80e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetAction-request>)))
  "Returns full string definition for message of type '<SetAction-request>"
  (cl:format cl:nil "# srv definition~%~%#request constants~%#   action_request_id: 								~%#	“idle”			    - 空闲		~%#	“sleep”			    - 休眠		~%#	“movebase_goal”	    - 导航到目标点		~%#	”rotate”		    - 旋转一定角度（body系）	~%#   “rotate_to”		    - 旋转到指定朝向（world系）~%#	“go_charging”	    - 返回充电				~%# 	“separate_docker”	- 脱离充电桩		~%#	“remote_telep”	    - 远程遥控~%#request fields~%string                      action_request_id       # 请求id~%geometry_msgs/Vector3       goal                    # 动作目标，如果动作没有具体目标值则填空~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetAction-request)))
  "Returns full string definition for message of type 'SetAction-request"
  (cl:format cl:nil "# srv definition~%~%#request constants~%#   action_request_id: 								~%#	“idle”			    - 空闲		~%#	“sleep”			    - 休眠		~%#	“movebase_goal”	    - 导航到目标点		~%#	”rotate”		    - 旋转一定角度（body系）	~%#   “rotate_to”		    - 旋转到指定朝向（world系）~%#	“go_charging”	    - 返回充电				~%# 	“separate_docker”	- 脱离充电桩		~%#	“remote_telep”	    - 远程遥控~%#request fields~%string                      action_request_id       # 请求id~%geometry_msgs/Vector3       goal                    # 动作目标，如果动作没有具体目标值则填空~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetAction-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'action_request_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetAction-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetAction-request
    (cl:cons ':action_request_id (action_request_id msg))
    (cl:cons ':goal (goal msg))
))
;//! \htmlinclude SetAction-response.msg.html

(cl:defclass <SetAction-response> (roslisp-msg-protocol:ros-message)
  ((action_response_id
    :reader action_response_id
    :initarg :action_response_id
    :type cl:string
    :initform ""))
)

(cl:defclass SetAction-response (<SetAction-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetAction-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetAction-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-srv:<SetAction-response> is deprecated: use robot_msg-srv:SetAction-response instead.")))

(cl:ensure-generic-function 'action_response_id-val :lambda-list '(m))
(cl:defmethod action_response_id-val ((m <SetAction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-srv:action_response_id-val is deprecated.  Use robot_msg-srv:action_response_id instead.")
  (action_response_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetAction-response>) ostream)
  "Serializes a message object of type '<SetAction-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action_response_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action_response_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetAction-response>) istream)
  "Deserializes a message object of type '<SetAction-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action_response_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action_response_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetAction-response>)))
  "Returns string type for a service object of type '<SetAction-response>"
  "robot_msg/SetActionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetAction-response)))
  "Returns string type for a service object of type 'SetAction-response"
  "robot_msg/SetActionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetAction-response>)))
  "Returns md5sum for a message object of type '<SetAction-response>"
  "95130fd028332f5dbbdebe1f435d80e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetAction-response)))
  "Returns md5sum for a message object of type 'SetAction-response"
  "95130fd028332f5dbbdebe1f435d80e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetAction-response>)))
  "Returns full string definition for message of type '<SetAction-response>"
  (cl:format cl:nil "~%#response constants~%~%#response fields~%string      action_response_id 	        # 回复id，与当前action_request_id值相同，表明ros收到命令~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetAction-response)))
  "Returns full string definition for message of type 'SetAction-response"
  (cl:format cl:nil "~%#response constants~%~%#response fields~%string      action_response_id 	        # 回复id，与当前action_request_id值相同，表明ros收到命令~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetAction-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'action_response_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetAction-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetAction-response
    (cl:cons ':action_response_id (action_response_id msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetAction)))
  'SetAction-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetAction)))
  'SetAction-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetAction)))
  "Returns string type for a service object of type '<SetAction>"
  "robot_msg/SetAction")