;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::ActionState)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'ActionState (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::ACTIONSTATE")
  (make-package "ROBOT_MSG::ACTIONSTATE"))

(in-package "ROS")
;;//! \htmlinclude ActionState.msg.html


(intern "*NONE*" (find-package "ROBOT_MSG::ACTIONSTATE"))
(shadow '*NONE* (find-package "ROBOT_MSG::ACTIONSTATE"))
(defconstant robot_msg::ActionState::*NONE* 0)
(intern "*SET_NEW_GOAL*" (find-package "ROBOT_MSG::ACTIONSTATE"))
(shadow '*SET_NEW_GOAL* (find-package "ROBOT_MSG::ACTIONSTATE"))
(defconstant robot_msg::ActionState::*SET_NEW_GOAL* 1)
(intern "*RUNNING*" (find-package "ROBOT_MSG::ACTIONSTATE"))
(shadow '*RUNNING* (find-package "ROBOT_MSG::ACTIONSTATE"))
(defconstant robot_msg::ActionState::*RUNNING* 2)
(intern "*GOAL_REACHED*" (find-package "ROBOT_MSG::ACTIONSTATE"))
(shadow '*GOAL_REACHED* (find-package "ROBOT_MSG::ACTIONSTATE"))
(defconstant robot_msg::ActionState::*GOAL_REACHED* 3)
(intern "*GOAL_CANCLE*" (find-package "ROBOT_MSG::ACTIONSTATE"))
(shadow '*GOAL_CANCLE* (find-package "ROBOT_MSG::ACTIONSTATE"))
(defconstant robot_msg::ActionState::*GOAL_CANCLE* 4)
(intern "*OBSTACLE*" (find-package "ROBOT_MSG::ACTIONSTATE"))
(shadow '*OBSTACLE* (find-package "ROBOT_MSG::ACTIONSTATE"))
(defconstant robot_msg::ActionState::*OBSTACLE* 5)
(intern "*NO_PATH*" (find-package "ROBOT_MSG::ACTIONSTATE"))
(shadow '*NO_PATH* (find-package "ROBOT_MSG::ACTIONSTATE"))
(defconstant robot_msg::ActionState::*NO_PATH* 6)
(intern "*DOCKER_NOTFOUND*" (find-package "ROBOT_MSG::ACTIONSTATE"))
(shadow '*DOCKER_NOTFOUND* (find-package "ROBOT_MSG::ACTIONSTATE"))
(defconstant robot_msg::ActionState::*DOCKER_NOTFOUND* 7)
(intern "*DOCKING_FAILURE*" (find-package "ROBOT_MSG::ACTIONSTATE"))
(shadow '*DOCKING_FAILURE* (find-package "ROBOT_MSG::ACTIONSTATE"))
(defconstant robot_msg::ActionState::*DOCKING_FAILURE* 8)
(intern "*ERROR_NODEFINE*" (find-package "ROBOT_MSG::ACTIONSTATE"))
(shadow '*ERROR_NODEFINE* (find-package "ROBOT_MSG::ACTIONSTATE"))
(defconstant robot_msg::ActionState::*ERROR_NODEFINE* 9)
(defclass robot_msg::ActionState
  :super ros::object
  :slots (_action_state_id _action_feedback ))

(defmethod robot_msg::ActionState
  (:init
   (&key
    ((:action_state_id __action_state_id) "")
    ((:action_feedback __action_feedback) 0)
    )
   (send-super :init)
   (setq _action_state_id (string __action_state_id))
   (setq _action_feedback (round __action_feedback))
   self)
  (:action_state_id
   (&optional __action_state_id)
   (if __action_state_id (setq _action_state_id __action_state_id)) _action_state_id)
  (:action_feedback
   (&optional __action_feedback)
   (if __action_feedback (setq _action_feedback __action_feedback)) _action_feedback)
  (:serialization-length
   ()
   (+
    ;; string _action_state_id
    4 (length _action_state_id)
    ;; int32 _action_feedback
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _action_state_id
       (write-long (length _action_state_id) s) (princ _action_state_id s)
     ;; int32 _action_feedback
       (write-long _action_feedback s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _action_state_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action_state_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _action_feedback
     (setq _action_feedback (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_msg::ActionState :md5sum-) "6a5aedc175e4d4597fe604ea49d45b40")
(setf (get robot_msg::ActionState :datatype-) "robot_msg/ActionState")
(setf (get robot_msg::ActionState :definition-)
      "# msg definition

#   action_state_id: 								
#	“idle”			    - 空闲		
#	“sleep”			    - 休眠		
#	“movebase_goal”	    - 导航到目标点		
#	”rotate”		    - 旋转一定角度（body系）	
#   “rotate_to”		    - 旋转到指定朝向（world系）
#	“go_charging”	    - 返回充电				
# 	“separate_docker”	- 脱离充电桩		
#	“remote_telep”	    - 远程遥控

# feedback enum
int32 NONE              = 0 # none
int32 SET_NEW_GOAL      = 1 # 收到指令
int32 RUNNING           = 2 # 动作执行中
int32 GOAL_REACHED      = 3 # 成功 - 目标达到
int32 GOAL_CANCLE       = 4 # 成功 - 目标被取消
int32 OBSTACLE          = 5 # 失败 - 存在障碍物
int32 NO_PATH           = 6 # 失败 - 没有可行路径
int32 DOCKER_NOTFOUND   = 7 # 失败 - 未找到充电桩
int32 DOCKING_FAILURE   = 8 # 失败 - 对接失败
int32 ERROR_NODEFINE    = 9 # 失败 - 其他异常 STUCK

string 		    action_state_id  	# 机器人所处功能状态id
int32           action_feedback 	# 动作执行实时状态反馈


")



(provide :robot_msg/ActionState "6a5aedc175e4d4597fe604ea49d45b40")


