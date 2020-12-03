;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::SetMap)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'SetMap (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::SETMAP")
  (make-package "ROBOT_MSG::SETMAP"))
(unless (find-package "ROBOT_MSG::SETMAPREQUEST")
  (make-package "ROBOT_MSG::SETMAPREQUEST"))
(unless (find-package "ROBOT_MSG::SETMAPRESPONSE")
  (make-package "ROBOT_MSG::SETMAPRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass robot_msg::SetMapRequest
  :super ros::object
  :slots (_cmd _name _pose _virtual_wall ))

(defmethod robot_msg::SetMapRequest
  (:init
   (&key
    ((:cmd __cmd) "")
    ((:name __name) "")
    ((:pose __pose) (instance geometry_msgs::Vector3 :init))
    ((:virtual_wall __virtual_wall) (instance robot_msg::Restrict :init))
    )
   (send-super :init)
   (setq _cmd (string __cmd))
   (setq _name (string __name))
   (setq _pose __pose)
   (setq _virtual_wall __virtual_wall)
   self)
  (:cmd
   (&optional __cmd)
   (if __cmd (setq _cmd __cmd)) _cmd)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:virtual_wall
   (&rest __virtual_wall)
   (if (keywordp (car __virtual_wall))
       (send* _virtual_wall __virtual_wall)
     (progn
       (if __virtual_wall (setq _virtual_wall (car __virtual_wall)))
       _virtual_wall)))
  (:serialization-length
   ()
   (+
    ;; string _cmd
    4 (length _cmd)
    ;; string _name
    4 (length _name)
    ;; geometry_msgs/Vector3 _pose
    (send _pose :serialization-length)
    ;; robot_msg/Restrict _virtual_wall
    (send _virtual_wall :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _cmd
       (write-long (length _cmd) s) (princ _cmd s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; geometry_msgs/Vector3 _pose
       (send _pose :serialize s)
     ;; robot_msg/Restrict _virtual_wall
       (send _virtual_wall :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _cmd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cmd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Vector3 _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; robot_msg/Restrict _virtual_wall
     (send _virtual_wall :deserialize buf ptr-) (incf ptr- (send _virtual_wall :serialization-length))
   ;;
   self)
  )

(defclass robot_msg::SetMapResponse
  :super ros::object
  :slots (_result _message_code _message ))

(defmethod robot_msg::SetMapResponse
  (:init
   (&key
    ((:result __result) nil)
    ((:message_code __message_code) 0)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _result __result)
   (setq _message_code (round __message_code))
   (setq _message (string __message))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:message_code
   (&optional __message_code)
   (if __message_code (setq _message_code __message_code)) _message_code)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ;; int32 _message_code
    4
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;; int32 _message_code
       (write-long _message_code s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _message_code
     (setq _message_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_msg::SetMap
  :super ros::object
  :slots ())

(setf (get robot_msg::SetMap :md5sum-) "7dbd698048cc10e20abf3ca951e09510")
(setf (get robot_msg::SetMap :datatype-) "robot_msg/SetMap")
(setf (get robot_msg::SetMap :request) robot_msg::SetMapRequest)
(setf (get robot_msg::SetMap :response) robot_msg::SetMapResponse)

(defmethod robot_msg::SetMapRequest
  (:response () (instance robot_msg::SetMapResponse :init)))

(setf (get robot_msg::SetMapRequest :md5sum-) "7dbd698048cc10e20abf3ca951e09510")
(setf (get robot_msg::SetMapRequest :datatype-) "robot_msg/SetMapRequest")
(setf (get robot_msg::SetMapRequest :definition-)
      "# srv definition

#request constants

#   \"building_map\",         构建地图
#   \"save_map\",             保存地图
#   \"switch_map\",           加载地图
#   \"delete_map\",           删除地图
#   \"add_virtual_wall\"      添加虚拟墙
#   \"remove_virtual_wall\"   移除虚拟墙

#request fields
string                  cmd                 # 地图操作命令
string                  name                # 地图名称
geometry_msgs/Vector3   pose                # 加载地图的初始位姿
robot_msg/Restrict      virtual_wall        # 设置虚拟墙

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
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
---

#response constants
#response fields
bool    result          #   执行结果，成功或者失败
int32   message_code    #   额外信息代码
string  message         #   额外信息，e.g. for error messages

")

(setf (get robot_msg::SetMapResponse :md5sum-) "7dbd698048cc10e20abf3ca951e09510")
(setf (get robot_msg::SetMapResponse :datatype-) "robot_msg/SetMapResponse")
(setf (get robot_msg::SetMapResponse :definition-)
      "# srv definition

#request constants

#   \"building_map\",         构建地图
#   \"save_map\",             保存地图
#   \"switch_map\",           加载地图
#   \"delete_map\",           删除地图
#   \"add_virtual_wall\"      添加虚拟墙
#   \"remove_virtual_wall\"   移除虚拟墙

#request fields
string                  cmd                 # 地图操作命令
string                  name                # 地图名称
geometry_msgs/Vector3   pose                # 加载地图的初始位姿
robot_msg/Restrict      virtual_wall        # 设置虚拟墙

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
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
---

#response constants
#response fields
bool    result          #   执行结果，成功或者失败
int32   message_code    #   额外信息代码
string  message         #   额外信息，e.g. for error messages

")



(provide :robot_msg/SetMap "7dbd698048cc10e20abf3ca951e09510")


