;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::Restrict)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'Restrict (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::RESTRICT")
  (make-package "ROBOT_MSG::RESTRICT"))

(in-package "ROS")
;;//! \htmlinclude Restrict.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass robot_msg::Restrict
  :super ros::object
  :slots (_id _polygon ))

(defmethod robot_msg::Restrict
  (:init
   (&key
    ((:id __id) 0)
    ((:polygon __polygon) (instance geometry_msgs::Polygon :init))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _polygon __polygon)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:polygon
   (&rest __polygon)
   (if (keywordp (car __polygon))
       (send* _polygon __polygon)
     (progn
       (if __polygon (setq _polygon (car __polygon)))
       _polygon)))
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; geometry_msgs/Polygon _polygon
    (send _polygon :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; geometry_msgs/Polygon _polygon
       (send _polygon :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Polygon _polygon
     (send _polygon :deserialize buf ptr-) (incf ptr- (send _polygon :serialization-length))
   ;;
   self)
  )

(setf (get robot_msg::Restrict :md5sum-) "42ff449c102e05ed9295a8972a24ec0a")
(setf (get robot_msg::Restrict :datatype-) "robot_msg/Restrict")
(setf (get robot_msg::Restrict :definition-)
      "# msg definition

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



(provide :robot_msg/Restrict "42ff449c102e05ed9295a8972a24ec0a")


