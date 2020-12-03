;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::SetDevice)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'SetDevice (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::SETDEVICE")
  (make-package "ROBOT_MSG::SETDEVICE"))
(unless (find-package "ROBOT_MSG::SETDEVICEREQUEST")
  (make-package "ROBOT_MSG::SETDEVICEREQUEST"))
(unless (find-package "ROBOT_MSG::SETDEVICERESPONSE")
  (make-package "ROBOT_MSG::SETDEVICERESPONSE"))

(in-package "ROS")





(defclass robot_msg::SetDeviceRequest
  :super ros::object
  :slots (_device_id _cmd _parameter1 _parameter2 ))

(defmethod robot_msg::SetDeviceRequest
  (:init
   (&key
    ((:device_id __device_id) "")
    ((:cmd __cmd) "")
    ((:parameter1 __parameter1) 0)
    ((:parameter2 __parameter2) 0)
    )
   (send-super :init)
   (setq _device_id (string __device_id))
   (setq _cmd (string __cmd))
   (setq _parameter1 (round __parameter1))
   (setq _parameter2 (round __parameter2))
   self)
  (:device_id
   (&optional __device_id)
   (if __device_id (setq _device_id __device_id)) _device_id)
  (:cmd
   (&optional __cmd)
   (if __cmd (setq _cmd __cmd)) _cmd)
  (:parameter1
   (&optional __parameter1)
   (if __parameter1 (setq _parameter1 __parameter1)) _parameter1)
  (:parameter2
   (&optional __parameter2)
   (if __parameter2 (setq _parameter2 __parameter2)) _parameter2)
  (:serialization-length
   ()
   (+
    ;; string _device_id
    4 (length _device_id)
    ;; string _cmd
    4 (length _cmd)
    ;; int32 _parameter1
    4
    ;; int32 _parameter2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _device_id
       (write-long (length _device_id) s) (princ _device_id s)
     ;; string _cmd
       (write-long (length _cmd) s) (princ _cmd s)
     ;; int32 _parameter1
       (write-long _parameter1 s)
     ;; int32 _parameter2
       (write-long _parameter2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _device_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _device_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _cmd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cmd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _parameter1
     (setq _parameter1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _parameter2
     (setq _parameter2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass robot_msg::SetDeviceResponse
  :super ros::object
  :slots (_result _message_code _message ))

(defmethod robot_msg::SetDeviceResponse
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

(defclass robot_msg::SetDevice
  :super ros::object
  :slots ())

(setf (get robot_msg::SetDevice :md5sum-) "4bbe5313598b86e0231eb9e4ecd3e0c0")
(setf (get robot_msg::SetDevice :datatype-) "robot_msg/SetDevice")
(setf (get robot_msg::SetDevice :request) robot_msg::SetDeviceRequest)
(setf (get robot_msg::SetDevice :response) robot_msg::SetDeviceResponse)

(defmethod robot_msg::SetDeviceRequest
  (:response () (instance robot_msg::SetDeviceResponse :init)))

(setf (get robot_msg::SetDeviceRequest :md5sum-) "4bbe5313598b86e0231eb9e4ecd3e0c0")
(setf (get robot_msg::SetDeviceRequest :datatype-) "robot_msg/SetDeviceRequest")
(setf (get robot_msg::SetDeviceRequest :definition-)
      "# srv definition

#request constants
# device_id:            cmd                 param1           param2
#    \"motor\"
#                       \"release_motor\"     0： 上电锁轴
#                                           1: 下电松轴
#    \"humidifier\"
#                       \"power\"             0： 开机
#                                           1： 关机
#                       \"fog_level\"         雾量等级
#
#request fields
string  device_id       # 硬件设备id
string  cmd             # 命令id
int32   parameter1      # 参数1
int32   parameter2      # 参数2
---

#response constants

#response fields
bool    result          #   收到命令，成功或者失败
int32   message_code    #   额外信息代码
string  message         #   额外信息，e.g. for error messages
")

(setf (get robot_msg::SetDeviceResponse :md5sum-) "4bbe5313598b86e0231eb9e4ecd3e0c0")
(setf (get robot_msg::SetDeviceResponse :datatype-) "robot_msg/SetDeviceResponse")
(setf (get robot_msg::SetDeviceResponse :definition-)
      "# srv definition

#request constants
# device_id:            cmd                 param1           param2
#    \"motor\"
#                       \"release_motor\"     0： 上电锁轴
#                                           1: 下电松轴
#    \"humidifier\"
#                       \"power\"             0： 开机
#                                           1： 关机
#                       \"fog_level\"         雾量等级
#
#request fields
string  device_id       # 硬件设备id
string  cmd             # 命令id
int32   parameter1      # 参数1
int32   parameter2      # 参数2
---

#response constants

#response fields
bool    result          #   收到命令，成功或者失败
int32   message_code    #   额外信息代码
string  message         #   额外信息，e.g. for error messages
")



(provide :robot_msg/SetDevice "4bbe5313598b86e0231eb9e4ecd3e0c0")


