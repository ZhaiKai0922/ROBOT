; Auto-generated. Do not edit!


(cl:in-package robot_msg-msg)


;//! \htmlinclude RestrictArray.msg.html

(cl:defclass <RestrictArray> (roslisp-msg-protocol:ros-message)
  ((virtual_walls
    :reader virtual_walls
    :initarg :virtual_walls
    :type (cl:vector robot_msg-msg:Restrict)
   :initform (cl:make-array 0 :element-type 'robot_msg-msg:Restrict :initial-element (cl:make-instance 'robot_msg-msg:Restrict))))
)

(cl:defclass RestrictArray (<RestrictArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RestrictArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RestrictArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-msg:<RestrictArray> is deprecated: use robot_msg-msg:RestrictArray instead.")))

(cl:ensure-generic-function 'virtual_walls-val :lambda-list '(m))
(cl:defmethod virtual_walls-val ((m <RestrictArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:virtual_walls-val is deprecated.  Use robot_msg-msg:virtual_walls instead.")
  (virtual_walls m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RestrictArray>) ostream)
  "Serializes a message object of type '<RestrictArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'virtual_walls))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'virtual_walls))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RestrictArray>) istream)
  "Deserializes a message object of type '<RestrictArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'virtual_walls) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'virtual_walls)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'robot_msg-msg:Restrict))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RestrictArray>)))
  "Returns string type for a message object of type '<RestrictArray>"
  "robot_msg/RestrictArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RestrictArray)))
  "Returns string type for a message object of type 'RestrictArray"
  "robot_msg/RestrictArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RestrictArray>)))
  "Returns md5sum for a message object of type '<RestrictArray>"
  "d730ec60ad06fc558c39d4bf2bff233e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RestrictArray)))
  "Returns md5sum for a message object of type 'RestrictArray"
  "d730ec60ad06fc558c39d4bf2bff233e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RestrictArray>)))
  "Returns full string definition for message of type '<RestrictArray>"
  (cl:format cl:nil "# msg definition~%~%# virtual walls e.g.~%~%robot_msg/Restrict[]  virtual_walls                # 虚拟墙描述~%~%~%~%================================================================================~%MSG: robot_msg/Restrict~%# msg definition~%~%# virtual walls e.g.~%~%int32                   id          # id~%geometry_msgs/Polygon   polygon       # Clockwise~%~%~%~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RestrictArray)))
  "Returns full string definition for message of type 'RestrictArray"
  (cl:format cl:nil "# msg definition~%~%# virtual walls e.g.~%~%robot_msg/Restrict[]  virtual_walls                # 虚拟墙描述~%~%~%~%================================================================================~%MSG: robot_msg/Restrict~%# msg definition~%~%# virtual walls e.g.~%~%int32                   id          # id~%geometry_msgs/Polygon   polygon       # Clockwise~%~%~%~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RestrictArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'virtual_walls) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RestrictArray>))
  "Converts a ROS message object to a list"
  (cl:list 'RestrictArray
    (cl:cons ':virtual_walls (virtual_walls msg))
))
