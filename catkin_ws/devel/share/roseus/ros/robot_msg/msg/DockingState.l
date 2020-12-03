;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::DockingState)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'DockingState (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::DOCKINGSTATE")
  (make-package "ROBOT_MSG::DOCKINGSTATE"))

(in-package "ROS")
;;//! \htmlinclude DockingState.msg.html


(intern "*NONE*" (find-package "ROBOT_MSG::DOCKINGSTATE"))
(shadow '*NONE* (find-package "ROBOT_MSG::DOCKINGSTATE"))
(defconstant robot_msg::DockingState::*NONE* 0)
(intern "*SEARCHING_STATION*" (find-package "ROBOT_MSG::DOCKINGSTATE"))
(shadow '*SEARCHING_STATION* (find-package "ROBOT_MSG::DOCKINGSTATE"))
(defconstant robot_msg::DockingState::*SEARCHING_STATION* 1)
(intern "*DOCKING_STATION*" (find-package "ROBOT_MSG::DOCKINGSTATE"))
(shadow '*DOCKING_STATION* (find-package "ROBOT_MSG::DOCKINGSTATE"))
(defconstant robot_msg::DockingState::*DOCKING_STATION* 2)
(intern "*DOCKING_SUCCESS*" (find-package "ROBOT_MSG::DOCKINGSTATE"))
(shadow '*DOCKING_SUCCESS* (find-package "ROBOT_MSG::DOCKINGSTATE"))
(defconstant robot_msg::DockingState::*DOCKING_SUCCESS* 3)
(intern "*SEARCHING_FAILURE*" (find-package "ROBOT_MSG::DOCKINGSTATE"))
(shadow '*SEARCHING_FAILURE* (find-package "ROBOT_MSG::DOCKINGSTATE"))
(defconstant robot_msg::DockingState::*SEARCHING_FAILURE* 4)
(intern "*DOCKING_FAILURE*" (find-package "ROBOT_MSG::DOCKINGSTATE"))
(shadow '*DOCKING_FAILURE* (find-package "ROBOT_MSG::DOCKINGSTATE"))
(defconstant robot_msg::DockingState::*DOCKING_FAILURE* 5)
(intern "*CANCLED*" (find-package "ROBOT_MSG::DOCKINGSTATE"))
(shadow '*CANCLED* (find-package "ROBOT_MSG::DOCKINGSTATE"))
(defconstant robot_msg::DockingState::*CANCLED* 6)
(defclass robot_msg::DockingState
  :super ros::object
  :slots (_docking_state ))

(defmethod robot_msg::DockingState
  (:init
   (&key
    ((:docking_state __docking_state) 0)
    )
   (send-super :init)
   (setq _docking_state (round __docking_state))
   self)
  (:docking_state
   (&optional __docking_state)
   (if __docking_state (setq _docking_state __docking_state)) _docking_state)
  (:serialization-length
   ()
   (+
    ;; int32 _docking_state
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _docking_state
       (write-long _docking_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _docking_state
     (setq _docking_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_msg::DockingState :md5sum-) "d0cea54154831428974ca314f83a5bb0")
(setf (get robot_msg::DockingState :datatype-) "robot_msg/DockingState")
(setf (get robot_msg::DockingState :definition-)
      "# msg definition

# constants state enum
int32 NONE              = 0 #初始化状态
int32 SEARCHING_STATION = 1 # 1-寻找充电桩
int32 DOCKING_STATION   = 2 # 2-对接中
int32 DOCKING_SUCCESS   = 3 # 3-对接成功
int32 SEARCHING_FAILURE = 4 # 4-失败-未找到充电桩
int32 DOCKING_FAILURE   = 5 # 5-失败-对接失败
int32 CANCLED           = 6 # 6-成功-动作被取消

# fields
int32 		docking_state  #机器人回充状态


")



(provide :robot_msg/DockingState "d0cea54154831428974ca314f83a5bb0")


