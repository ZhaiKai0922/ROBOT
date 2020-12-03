; Auto-generated. Do not edit!


(cl:in-package robot_msg-msg)


;//! \htmlinclude Restrict.msg.html

(cl:defclass <Restrict> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (polygon
    :reader polygon
    :initarg :polygon
    :type geometry_msgs-msg:Polygon
    :initform (cl:make-instance 'geometry_msgs-msg:Polygon)))
)

(cl:defclass Restrict (<Restrict>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Restrict>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Restrict)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msg-msg:<Restrict> is deprecated: use robot_msg-msg:Restrict instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Restrict>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:id-val is deprecated.  Use robot_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'polygon-val :lambda-list '(m))
(cl:defmethod polygon-val ((m <Restrict>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msg-msg:polygon-val is deprecated.  Use robot_msg-msg:polygon instead.")
  (polygon m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Restrict>) ostream)
  "Serializes a message object of type '<Restrict>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'polygon) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Restrict>) istream)
  "Deserializes a message object of type '<Restrict>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'polygon) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Restrict>)))
  "Returns string type for a message object of type '<Restrict>"
  "robot_msg/Restrict")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Restrict)))
  "Returns string type for a message object of type 'Restrict"
  "robot_msg/Restrict")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Restrict>)))
  "Returns md5sum for a message object of type '<Restrict>"
  "42ff449c102e05ed9295a8972a24ec0a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Restrict)))
  "Returns md5sum for a message object of type 'Restrict"
  "42ff449c102e05ed9295a8972a24ec0a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Restrict>)))
  "Returns full string definition for message of type '<Restrict>"
  (cl:format cl:nil "# msg definition~%~%# virtual walls e.g.~%~%int32                   id          # id~%geometry_msgs/Polygon   polygon       # Clockwise~%~%~%~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Restrict)))
  "Returns full string definition for message of type 'Restrict"
  (cl:format cl:nil "# msg definition~%~%# virtual walls e.g.~%~%int32                   id          # id~%geometry_msgs/Polygon   polygon       # Clockwise~%~%~%~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Restrict>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'polygon))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Restrict>))
  "Converts a ROS message object to a list"
  (cl:list 'Restrict
    (cl:cons ':id (id msg))
    (cl:cons ':polygon (polygon msg))
))
