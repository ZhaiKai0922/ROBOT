;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::LocalizationState)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'LocalizationState (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::LOCALIZATIONSTATE")
  (make-package "ROBOT_MSG::LOCALIZATIONSTATE"))

(in-package "ROS")
;;//! \htmlinclude LocalizationState.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(intern "*NONE*" (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(shadow '*NONE* (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(defconstant robot_msg::LocalizationState::*NONE* 0)
(intern "*MAP_BUILDING*" (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(shadow '*MAP_BUILDING* (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(defconstant robot_msg::LocalizationState::*MAP_BUILDING* 1)
(intern "*LOCATING*" (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(shadow '*LOCATING* (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(defconstant robot_msg::LocalizationState::*LOCATING* 2)
(intern "*SUCCESS*" (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(shadow '*SUCCESS* (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(defconstant robot_msg::LocalizationState::*SUCCESS* 3)
(intern "*FAILURE*" (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(shadow '*FAILURE* (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(defconstant robot_msg::LocalizationState::*FAILURE* 4)
(intern "*MAP_SAVING*" (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(shadow '*MAP_SAVING* (find-package "ROBOT_MSG::LOCALIZATIONSTATE"))
(defconstant robot_msg::LocalizationState::*MAP_SAVING* 5)
(defclass robot_msg::LocalizationState
  :super ros::object
  :slots (_localization_state _floor _global_pose _score _progress ))

(defmethod robot_msg::LocalizationState
  (:init
   (&key
    ((:localization_state __localization_state) 0)
    ((:floor __floor) 0)
    ((:global_pose __global_pose) (instance geometry_msgs::Vector3 :init))
    ((:score __score) 0.0)
    ((:progress __progress) 0.0)
    )
   (send-super :init)
   (setq _localization_state (round __localization_state))
   (setq _floor (round __floor))
   (setq _global_pose __global_pose)
   (setq _score (float __score))
   (setq _progress (float __progress))
   self)
  (:localization_state
   (&optional __localization_state)
   (if __localization_state (setq _localization_state __localization_state)) _localization_state)
  (:floor
   (&optional __floor)
   (if __floor (setq _floor __floor)) _floor)
  (:global_pose
   (&rest __global_pose)
   (if (keywordp (car __global_pose))
       (send* _global_pose __global_pose)
     (progn
       (if __global_pose (setq _global_pose (car __global_pose)))
       _global_pose)))
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:progress
   (&optional __progress)
   (if __progress (setq _progress __progress)) _progress)
  (:serialization-length
   ()
   (+
    ;; int32 _localization_state
    4
    ;; int32 _floor
    4
    ;; geometry_msgs/Vector3 _global_pose
    (send _global_pose :serialization-length)
    ;; float32 _score
    4
    ;; float32 _progress
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _localization_state
       (write-long _localization_state s)
     ;; int32 _floor
       (write-long _floor s)
     ;; geometry_msgs/Vector3 _global_pose
       (send _global_pose :serialize s)
     ;; float32 _score
       (sys::poke _score (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _progress
       (sys::poke _progress (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _localization_state
     (setq _localization_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _floor
     (setq _floor (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Vector3 _global_pose
     (send _global_pose :deserialize buf ptr-) (incf ptr- (send _global_pose :serialization-length))
   ;; float32 _score
     (setq _score (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _progress
     (setq _progress (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_msg::LocalizationState :md5sum-) "1ce43e83728f9fa44734aa425fdc622d")
(setf (get robot_msg::LocalizationState :datatype-) "robot_msg/LocalizationState")
(setf (get robot_msg::LocalizationState :definition-)
      "# msg definition 对Android

# localization state enum
int32 NONE         = 0 # 初始化
int32 MAP_BUILDING = 1 # 建图中
int32 LOCATING     = 2 # 定位中
int32 SUCCESS      = 3 # 定位成功
int32 FAILURE      = 4 # 定位失败
int32 MAP_SAVING   = 5 # 地图保存中

int32 		        localization_state      # 机器人定位状态
int32                   floor                   # 机器人当前所处楼层
geometry_msgs/Vector3 	global_pose             # 机器人全局位置坐标，(x，y，thete)
float32                 score                   # 得分
float32                 progress                # 地图保存进度，100%为已保存状态

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
")



(provide :robot_msg/LocalizationState "1ce43e83728f9fa44734aa425fdc622d")


