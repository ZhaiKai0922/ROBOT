;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::SaveFrames)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'SaveFrames (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::SAVEFRAMES")
  (make-package "ROBOT_MSG::SAVEFRAMES"))
(unless (find-package "ROBOT_MSG::SAVEFRAMESREQUEST")
  (make-package "ROBOT_MSG::SAVEFRAMESREQUEST"))
(unless (find-package "ROBOT_MSG::SAVEFRAMESRESPONSE")
  (make-package "ROBOT_MSG::SAVEFRAMESRESPONSE"))

(in-package "ROS")





(defclass robot_msg::SaveFramesRequest
  :super ros::object
  :slots (_save_flag ))

(defmethod robot_msg::SaveFramesRequest
  (:init
   (&key
    ((:save_flag __save_flag) nil)
    )
   (send-super :init)
   (setq _save_flag __save_flag)
   self)
  (:save_flag
   (&optional __save_flag)
   (if __save_flag (setq _save_flag __save_flag)) _save_flag)
  (:serialization-length
   ()
   (+
    ;; bool _save_flag
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _save_flag
       (if _save_flag (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _save_flag
     (setq _save_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_msg::SaveFramesResponse
  :super ros::object
  :slots (_finish_flag ))

(defmethod robot_msg::SaveFramesResponse
  (:init
   (&key
    ((:finish_flag __finish_flag) nil)
    )
   (send-super :init)
   (setq _finish_flag __finish_flag)
   self)
  (:finish_flag
   (&optional __finish_flag)
   (if __finish_flag (setq _finish_flag __finish_flag)) _finish_flag)
  (:serialization-length
   ()
   (+
    ;; bool _finish_flag
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _finish_flag
       (if _finish_flag (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _finish_flag
     (setq _finish_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_msg::SaveFrames
  :super ros::object
  :slots ())

(setf (get robot_msg::SaveFrames :md5sum-) "78fa97d242f9f98c3b258ac9794f610a")
(setf (get robot_msg::SaveFrames :datatype-) "robot_msg/SaveFrames")
(setf (get robot_msg::SaveFrames :request) robot_msg::SaveFramesRequest)
(setf (get robot_msg::SaveFrames :response) robot_msg::SaveFramesResponse)

(defmethod robot_msg::SaveFramesRequest
  (:response () (instance robot_msg::SaveFramesResponse :init)))

(setf (get robot_msg::SaveFramesRequest :md5sum-) "78fa97d242f9f98c3b258ac9794f610a")
(setf (get robot_msg::SaveFramesRequest :datatype-) "robot_msg/SaveFramesRequest")
(setf (get robot_msg::SaveFramesRequest :definition-)
      "bool save_flag  # true-发送保存帧请求；false-发送停止保存帧请求
---
bool finish_flag # true-完成标志； false-未完成标志

")

(setf (get robot_msg::SaveFramesResponse :md5sum-) "78fa97d242f9f98c3b258ac9794f610a")
(setf (get robot_msg::SaveFramesResponse :datatype-) "robot_msg/SaveFramesResponse")
(setf (get robot_msg::SaveFramesResponse :definition-)
      "bool save_flag  # true-发送保存帧请求；false-发送停止保存帧请求
---
bool finish_flag # true-完成标志； false-未完成标志

")



(provide :robot_msg/SaveFrames "78fa97d242f9f98c3b258ac9794f610a")


