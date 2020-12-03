;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::Humidifier)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'Humidifier (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::HUMIDIFIER")
  (make-package "ROBOT_MSG::HUMIDIFIER"))

(in-package "ROS")
;;//! \htmlinclude Humidifier.msg.html


(defclass robot_msg::Humidifier
  :super ros::object
  :slots (_power_state _fog_level _warn_water_low ))

(defmethod robot_msg::Humidifier
  (:init
   (&key
    ((:power_state __power_state) 0)
    ((:fog_level __fog_level) 0)
    ((:warn_water_low __warn_water_low) 0)
    )
   (send-super :init)
   (setq _power_state (round __power_state))
   (setq _fog_level (round __fog_level))
   (setq _warn_water_low (round __warn_water_low))
   self)
  (:power_state
   (&optional __power_state)
   (if __power_state (setq _power_state __power_state)) _power_state)
  (:fog_level
   (&optional __fog_level)
   (if __fog_level (setq _fog_level __fog_level)) _fog_level)
  (:warn_water_low
   (&optional __warn_water_low)
   (if __warn_water_low (setq _warn_water_low __warn_water_low)) _warn_water_low)
  (:serialization-length
   ()
   (+
    ;; uint8 _power_state
    1
    ;; uint8 _fog_level
    1
    ;; uint8 _warn_water_low
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _power_state
       (write-byte _power_state s)
     ;; uint8 _fog_level
       (write-byte _fog_level s)
     ;; uint8 _warn_water_low
       (write-byte _warn_water_low s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _power_state
     (setq _power_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _fog_level
     (setq _fog_level (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _warn_water_low
     (setq _warn_water_low (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robot_msg::Humidifier :md5sum-) "f6577daff9e5c3c518197df2a56537ef")
(setf (get robot_msg::Humidifier :datatype-) "robot_msg/Humidifier")
(setf (get robot_msg::Humidifier :definition-)
      "# msg definition

uint8   power_state     # 0 关机 1 开机
uint8   fog_level       # 当前设置雾量等级      1~7挡
uint8   warn_water_low      # 低水位告警状态        0 正常 1 告警
")



(provide :robot_msg/Humidifier "f6577daff9e5c3c518197df2a56537ef")


