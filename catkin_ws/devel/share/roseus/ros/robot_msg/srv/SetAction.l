;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::SetAction)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'SetAction (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::SETACTION")
  (make-package "ROBOT_MSG::SETACTION"))
(unless (find-package "ROBOT_MSG::SETACTIONREQUEST")
  (make-package "ROBOT_MSG::SETACTIONREQUEST"))
(unless (find-package "ROBOT_MSG::SETACTIONRESPONSE")
  (make-package "ROBOT_MSG::SETACTIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass robot_msg::SetActionRequest
  :super ros::object
  :slots (_action_request_id _goal ))

(defmethod robot_msg::SetActionRequest
  (:init
   (&key
    ((:action_request_id __action_request_id) "")
    ((:goal __goal) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _action_request_id (string __action_request_id))
   (setq _goal __goal)
   self)
  (:action_request_id
   (&optional __action_request_id)
   (if __action_request_id (setq _action_request_id __action_request_id)) _action_request_id)
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:serialization-length
   ()
   (+
    ;; string _action_request_id
    4 (length _action_request_id)
    ;; geometry_msgs/Vector3 _goal
    (send _goal :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _action_request_id
       (write-long (length _action_request_id) s) (princ _action_request_id s)
     ;; geometry_msgs/Vector3 _goal
       (send _goal :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _action_request_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action_request_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Vector3 _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;;
   self)
  )

(defclass robot_msg::SetActionResponse
  :super ros::object
  :slots (_action_response_id ))

(defmethod robot_msg::SetActionResponse
  (:init
   (&key
    ((:action_response_id __action_response_id) "")
    )
   (send-super :init)
   (setq _action_response_id (string __action_response_id))
   self)
  (:action_response_id
   (&optional __action_response_id)
   (if __action_response_id (setq _action_response_id __action_response_id)) _action_response_id)
  (:serialization-length
   ()
   (+
    ;; string _action_response_id
    4 (length _action_response_id)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _action_response_id
       (write-long (length _action_response_id) s) (princ _action_response_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _action_response_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action_response_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_msg::SetAction
  :super ros::object
  :slots ())

(setf (get robot_msg::SetAction :md5sum-) "95130fd028332f5dbbdebe1f435d80e3")
(setf (get robot_msg::SetAction :datatype-) "robot_msg/SetAction")
(setf (get robot_msg::SetAction :request) robot_msg::SetActionRequest)
(setf (get robot_msg::SetAction :response) robot_msg::SetActionResponse)

(defmethod robot_msg::SetActionRequest
  (:response () (instance robot_msg::SetActionResponse :init)))

(setf (get robot_msg::SetActionRequest :md5sum-) "95130fd028332f5dbbdebe1f435d80e3")
(setf (get robot_msg::SetActionRequest :datatype-) "robot_msg/SetActionRequest")
(setf (get robot_msg::SetActionRequest :definition-)
      "# srv definition

#request constants
#   action_request_id: 								
#	“idle”			    - 空闲		
#	“sleep”			    - 休眠		
#	“movebase_goal”	    - 导航到目标点		
#	”rotate”		    - 旋转一定角度（body系）	
#   “rotate_to”		    - 旋转到指定朝向（world系）
#	“go_charging”	    - 返回充电				
# 	“separate_docker”	- 脱离充电桩		
#	“remote_telep”	    - 远程遥控
#request fields
string                      action_request_id       # 请求id
geometry_msgs/Vector3       goal                    # 动作目标，如果动作没有具体目标值则填空

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
---

#response constants

#response fields
string      action_response_id 	        # 回复id，与当前action_request_id值相同，表明ros收到命令
")

(setf (get robot_msg::SetActionResponse :md5sum-) "95130fd028332f5dbbdebe1f435d80e3")
(setf (get robot_msg::SetActionResponse :datatype-) "robot_msg/SetActionResponse")
(setf (get robot_msg::SetActionResponse :definition-)
      "# srv definition

#request constants
#   action_request_id: 								
#	“idle”			    - 空闲		
#	“sleep”			    - 休眠		
#	“movebase_goal”	    - 导航到目标点		
#	”rotate”		    - 旋转一定角度（body系）	
#   “rotate_to”		    - 旋转到指定朝向（world系）
#	“go_charging”	    - 返回充电				
# 	“separate_docker”	- 脱离充电桩		
#	“remote_telep”	    - 远程遥控
#request fields
string                      action_request_id       # 请求id
geometry_msgs/Vector3       goal                    # 动作目标，如果动作没有具体目标值则填空

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
---

#response constants

#response fields
string      action_response_id 	        # 回复id，与当前action_request_id值相同，表明ros收到命令
")



(provide :robot_msg/SetAction "95130fd028332f5dbbdebe1f435d80e3")


