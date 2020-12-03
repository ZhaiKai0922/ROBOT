;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::SetRestrict)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'SetRestrict (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::SETRESTRICT")
  (make-package "ROBOT_MSG::SETRESTRICT"))
(unless (find-package "ROBOT_MSG::SETRESTRICTREQUEST")
  (make-package "ROBOT_MSG::SETRESTRICTREQUEST"))
(unless (find-package "ROBOT_MSG::SETRESTRICTRESPONSE")
  (make-package "ROBOT_MSG::SETRESTRICTRESPONSE"))

(in-package "ROS")





(defclass robot_msg::SetRestrictRequest
  :super ros::object
  :slots (_cmd _virtual_walls ))

(defmethod robot_msg::SetRestrictRequest
  (:init
   (&key
    ((:cmd __cmd) "")
    ((:virtual_walls __virtual_walls) (let (r) (dotimes (i 0) (push (instance robot_msg::Restrict :init) r)) r))
    )
   (send-super :init)
   (setq _cmd (string __cmd))
   (setq _virtual_walls __virtual_walls)
   self)
  (:cmd
   (&optional __cmd)
   (if __cmd (setq _cmd __cmd)) _cmd)
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
    ;; string _cmd
    4 (length _cmd)
    ;; robot_msg/Restrict[] _virtual_walls
    (apply #'+ (send-all _virtual_walls :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _cmd
       (write-long (length _cmd) s) (princ _cmd s)
     ;; robot_msg/Restrict[] _virtual_walls
     (write-long (length _virtual_walls) s)
     (dolist (elem _virtual_walls)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _cmd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cmd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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

(defclass robot_msg::SetRestrictResponse
  :super ros::object
  :slots (_result _message_code _message ))

(defmethod robot_msg::SetRestrictResponse
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

(defclass robot_msg::SetRestrict
  :super ros::object
  :slots ())

(setf (get robot_msg::SetRestrict :md5sum-) "1f3913cc9796519611b8018d97267e81")
(setf (get robot_msg::SetRestrict :datatype-) "robot_msg/SetRestrict")
(setf (get robot_msg::SetRestrict :request) robot_msg::SetRestrictRequest)
(setf (get robot_msg::SetRestrict :response) robot_msg::SetRestrictResponse)

(defmethod robot_msg::SetRestrictRequest
  (:response () (instance robot_msg::SetRestrictResponse :init)))

(setf (get robot_msg::SetRestrictRequest :md5sum-) "1f3913cc9796519611b8018d97267e81")
(setf (get robot_msg::SetRestrictRequest :datatype-) "robot_msg/SetRestrictRequest")
(setf (get robot_msg::SetRestrictRequest :definition-)
      "# srv definition

#request constants

#   \"add\"      添加
#   \"remove\"   移除
#   \"clean\"    清除所有限制层文件

#request fields
string                  cmd                          # 操作命令
robot_msg/Restrict[]    virtual_walls                # 虚拟墙描述

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

(setf (get robot_msg::SetRestrictResponse :md5sum-) "1f3913cc9796519611b8018d97267e81")
(setf (get robot_msg::SetRestrictResponse :datatype-) "robot_msg/SetRestrictResponse")
(setf (get robot_msg::SetRestrictResponse :definition-)
      "# srv definition

#request constants

#   \"add\"      添加
#   \"remove\"   移除
#   \"clean\"    清除所有限制层文件

#request fields
string                  cmd                          # 操作命令
robot_msg/Restrict[]    virtual_walls                # 虚拟墙描述

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



(provide :robot_msg/SetRestrict "1f3913cc9796519611b8018d97267e81")


