;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::BaseInfo)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'BaseInfo (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::BASEINFO")
  (make-package "ROBOT_MSG::BASEINFO"))

(in-package "ROS")
;;//! \htmlinclude BaseInfo.msg.html


(intern "*DEVICE_EMERGENCY*" (find-package "ROBOT_MSG::BASEINFO"))
(shadow '*DEVICE_EMERGENCY* (find-package "ROBOT_MSG::BASEINFO"))
(defconstant robot_msg::BaseInfo::*DEVICE_EMERGENCY* 1)
(intern "*ROS_NO_CMD*" (find-package "ROBOT_MSG::BASEINFO"))
(shadow '*ROS_NO_CMD* (find-package "ROBOT_MSG::BASEINFO"))
(defconstant robot_msg::BaseInfo::*ROS_NO_CMD* 2)
(intern "*DRIVER_LOST*" (find-package "ROBOT_MSG::BASEINFO"))
(shadow '*DRIVER_LOST* (find-package "ROBOT_MSG::BASEINFO"))
(defconstant robot_msg::BaseInfo::*DRIVER_LOST* 4)
(intern "*IMU_LOST*" (find-package "ROBOT_MSG::BASEINFO"))
(shadow '*IMU_LOST* (find-package "ROBOT_MSG::BASEINFO"))
(defconstant robot_msg::BaseInfo::*IMU_LOST* 8)
(intern "*RELEASE_MOTOR*" (find-package "ROBOT_MSG::BASEINFO"))
(shadow '*RELEASE_MOTOR* (find-package "ROBOT_MSG::BASEINFO"))
(defconstant robot_msg::BaseInfo::*RELEASE_MOTOR* 16)
(intern "*BMS_LOST*" (find-package "ROBOT_MSG::BASEINFO"))
(shadow '*BMS_LOST* (find-package "ROBOT_MSG::BASEINFO"))
(defconstant robot_msg::BaseInfo::*BMS_LOST* 32)
(intern "*UNCHARGING*" (find-package "ROBOT_MSG::BASEINFO"))
(shadow '*UNCHARGING* (find-package "ROBOT_MSG::BASEINFO"))
(defconstant robot_msg::BaseInfo::*UNCHARGING* 0)
(intern "*CHARGING*" (find-package "ROBOT_MSG::BASEINFO"))
(shadow '*CHARGING* (find-package "ROBOT_MSG::BASEINFO"))
(defconstant robot_msg::BaseInfo::*CHARGING* 1)
(intern "*DOCK_IN*" (find-package "ROBOT_MSG::BASEINFO"))
(shadow '*DOCK_IN* (find-package "ROBOT_MSG::BASEINFO"))
(defconstant robot_msg::BaseInfo::*DOCK_IN* 2)
(defclass robot_msg::BaseInfo
  :super ros::object
  :slots (_connected _base_device_state _cliff_left _cliff_front_left _cliff_front_right _cliff_right _bump_state_left _bump_state_right _chargingVol _chargingState _motor_left_err_code _motor_right_err_code _bump_enable _cliff_enable ))

(defmethod robot_msg::BaseInfo
  (:init
   (&key
    ((:connected __connected) nil)
    ((:base_device_state __base_device_state) 0)
    ((:cliff_left __cliff_left) nil)
    ((:cliff_front_left __cliff_front_left) nil)
    ((:cliff_front_right __cliff_front_right) nil)
    ((:cliff_right __cliff_right) nil)
    ((:bump_state_left __bump_state_left) nil)
    ((:bump_state_right __bump_state_right) nil)
    ((:chargingVol __chargingVol) 0)
    ((:chargingState __chargingState) 0)
    ((:motor_left_err_code __motor_left_err_code) 0)
    ((:motor_right_err_code __motor_right_err_code) 0)
    ((:bump_enable __bump_enable) nil)
    ((:cliff_enable __cliff_enable) nil)
    )
   (send-super :init)
   (setq _connected __connected)
   (setq _base_device_state (round __base_device_state))
   (setq _cliff_left __cliff_left)
   (setq _cliff_front_left __cliff_front_left)
   (setq _cliff_front_right __cliff_front_right)
   (setq _cliff_right __cliff_right)
   (setq _bump_state_left __bump_state_left)
   (setq _bump_state_right __bump_state_right)
   (setq _chargingVol (round __chargingVol))
   (setq _chargingState (round __chargingState))
   (setq _motor_left_err_code (round __motor_left_err_code))
   (setq _motor_right_err_code (round __motor_right_err_code))
   (setq _bump_enable __bump_enable)
   (setq _cliff_enable __cliff_enable)
   self)
  (:connected
   (&optional __connected)
   (if __connected (setq _connected __connected)) _connected)
  (:base_device_state
   (&optional __base_device_state)
   (if __base_device_state (setq _base_device_state __base_device_state)) _base_device_state)
  (:cliff_left
   (&optional __cliff_left)
   (if __cliff_left (setq _cliff_left __cliff_left)) _cliff_left)
  (:cliff_front_left
   (&optional __cliff_front_left)
   (if __cliff_front_left (setq _cliff_front_left __cliff_front_left)) _cliff_front_left)
  (:cliff_front_right
   (&optional __cliff_front_right)
   (if __cliff_front_right (setq _cliff_front_right __cliff_front_right)) _cliff_front_right)
  (:cliff_right
   (&optional __cliff_right)
   (if __cliff_right (setq _cliff_right __cliff_right)) _cliff_right)
  (:bump_state_left
   (&optional __bump_state_left)
   (if __bump_state_left (setq _bump_state_left __bump_state_left)) _bump_state_left)
  (:bump_state_right
   (&optional __bump_state_right)
   (if __bump_state_right (setq _bump_state_right __bump_state_right)) _bump_state_right)
  (:chargingVol
   (&optional __chargingVol)
   (if __chargingVol (setq _chargingVol __chargingVol)) _chargingVol)
  (:chargingState
   (&optional __chargingState)
   (if __chargingState (setq _chargingState __chargingState)) _chargingState)
  (:motor_left_err_code
   (&optional __motor_left_err_code)
   (if __motor_left_err_code (setq _motor_left_err_code __motor_left_err_code)) _motor_left_err_code)
  (:motor_right_err_code
   (&optional __motor_right_err_code)
   (if __motor_right_err_code (setq _motor_right_err_code __motor_right_err_code)) _motor_right_err_code)
  (:bump_enable
   (&optional __bump_enable)
   (if __bump_enable (setq _bump_enable __bump_enable)) _bump_enable)
  (:cliff_enable
   (&optional __cliff_enable)
   (if __cliff_enable (setq _cliff_enable __cliff_enable)) _cliff_enable)
  (:serialization-length
   ()
   (+
    ;; bool _connected
    1
    ;; uint8 _base_device_state
    1
    ;; bool _cliff_left
    1
    ;; bool _cliff_front_left
    1
    ;; bool _cliff_front_right
    1
    ;; bool _cliff_right
    1
    ;; bool _bump_state_left
    1
    ;; bool _bump_state_right
    1
    ;; uint16 _chargingVol
    2
    ;; uint8 _chargingState
    1
    ;; uint16 _motor_left_err_code
    2
    ;; uint16 _motor_right_err_code
    2
    ;; bool _bump_enable
    1
    ;; bool _cliff_enable
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _connected
       (if _connected (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _base_device_state
       (write-byte _base_device_state s)
     ;; bool _cliff_left
       (if _cliff_left (write-byte -1 s) (write-byte 0 s))
     ;; bool _cliff_front_left
       (if _cliff_front_left (write-byte -1 s) (write-byte 0 s))
     ;; bool _cliff_front_right
       (if _cliff_front_right (write-byte -1 s) (write-byte 0 s))
     ;; bool _cliff_right
       (if _cliff_right (write-byte -1 s) (write-byte 0 s))
     ;; bool _bump_state_left
       (if _bump_state_left (write-byte -1 s) (write-byte 0 s))
     ;; bool _bump_state_right
       (if _bump_state_right (write-byte -1 s) (write-byte 0 s))
     ;; uint16 _chargingVol
       (write-word _chargingVol s)
     ;; uint8 _chargingState
       (write-byte _chargingState s)
     ;; uint16 _motor_left_err_code
       (write-word _motor_left_err_code s)
     ;; uint16 _motor_right_err_code
       (write-word _motor_right_err_code s)
     ;; bool _bump_enable
       (if _bump_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _cliff_enable
       (if _cliff_enable (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _connected
     (setq _connected (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _base_device_state
     (setq _base_device_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _cliff_left
     (setq _cliff_left (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _cliff_front_left
     (setq _cliff_front_left (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _cliff_front_right
     (setq _cliff_front_right (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _cliff_right
     (setq _cliff_right (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _bump_state_left
     (setq _bump_state_left (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _bump_state_right
     (setq _bump_state_right (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint16 _chargingVol
     (setq _chargingVol (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _chargingState
     (setq _chargingState (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _motor_left_err_code
     (setq _motor_left_err_code (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _motor_right_err_code
     (setq _motor_right_err_code (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _bump_enable
     (setq _bump_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _cliff_enable
     (setq _cliff_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robot_msg::BaseInfo :md5sum-) "3067a4347f837a8395157fa5164b6588")
(setf (get robot_msg::BaseInfo :datatype-) "robot_msg/BaseInfo")
(setf (get robot_msg::BaseInfo :definition-)
      "# msg definition
# base_device_state enum
uint8   DEVICE_EMERGENCY    = 1 # 急停按下
uint8   ROS_NO_CMD          = 2 # 未收到ros指令
uint8   DRIVER_LOST         = 4 # 驱动器无响应
uint8   IMU_LOST            = 8 # imu无响应
uint8   RELEASE_MOTOR       = 16 # 电机下电失能
uint8   BMS_LOST            = 32 # bms无响应

# charging State enum
uint8   UNCHARGING          = 0 # 未充电
uint8   CHARGING            = 1 # 充电中
uint8   DOCK_IN             = 2 # 接触，未充电

bool        connected               #   底盘连接状态
uint8       base_device_state       #   底盘基本外设状态
bool        cliff_left              #   左跌落
bool        cliff_front_left        #   前左
bool        cliff_front_right       #   前右
bool        cliff_right             #   右跌落
bool        bump_state_left         #   左碰撞
bool        bump_state_right        #   右碰撞
uint16      chargingVol             #   充电电压  10mv
uint8       chargingState           #   充电状态
uint16      motor_left_err_code     #   电机错误码
uint16      motor_right_err_code    #
bool        bump_enable             #   碰撞传感器使能
bool        cliff_enable            #   跌落使能
#uint32[]    adc_channal             #   ADC传感器通道值，跌落传感器等
#uint32[]    range_sensors           #   超声 tof数据等

")



(provide :robot_msg/BaseInfo "3067a4347f837a8395157fa5164b6588")


