;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::RestrictArray)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'RestrictArray (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::RESTRICTARRAY")
  (make-package "ROBOT_MSG::RESTRICTARRAY"))

(in-package "ROS")
;;//! \htmlinclude RestrictArray.msg.html


(defclass robot_msg::RestrictArray
  :super ros::object
  :slots (_virtual_walls ))

(defmethod robot_msg::RestrictArray
  (:init
   (&key
    ((:virtual_walls __virtual_walls) (let (r) (dotimes (i 0) (push (instance robot_msg::Restrict :init) r)) r))
    )
   (send-super :init)
   (setq _virtual_walls __virtual_walls)
   self)
  (:virtual_walls
   (&rest __virtual_walls)
   (if (keywordp (car __virtual_walls))
       (send* _virtual_walls __virtual_walls)
     (progn
       (if __virtual_walls (setq _virtual_walls (car __virtual_walls)))
       _virtual_walls)))
  (:serialization-length
   ()
   (+
    ;; robot_msg/Restrict[] _virtual_walls
    (apply #'+ (send-all _virtual_walls :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; robot_msg/Restrict[] _virtual_walls
     (write-long (length _virtual_walls) s)
     (dolist (elem _virtual_walls)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; robot_msg/Restrict[] _virtual_walls
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _virtual_walls (let (r) (dotimes (i n) (push (instance robot_msg::Restrict :init) r)) r))
     (dolist (elem- _virtual_walls)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get robot_msg::RestrictArray :md5sum-) "d730ec60ad06fc558c39d4bf2bff233e")
(setf (get robot_msg::RestrictArray :datatype-) "robot_msg/RestrictArray")
(setf (get robot_msg::RestrictArray :definition-)
      "# msg definition

# virtual walls e.g.

robot_msg/Restrict[]  virtual_walls                # 虚拟墙描述



================================================================================
MSG: robot_msg/Restrict
# msg definition

# virtual walls e.g.

int32                   id          # id
geometry_msgs/Polygon   polygon       # Clockwise



================================================================================
MSG: geometry_msgs/Polygon
#A specification of a polygon where the first and last points are assumed to be connected
Point32[] points

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
")



(provide :robot_msg/RestrictArray "d730ec60ad06fc558c39d4bf2bff233e")


