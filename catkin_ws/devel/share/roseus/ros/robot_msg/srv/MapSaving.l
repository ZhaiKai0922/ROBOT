;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::MapSaving)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'MapSaving (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::MAPSAVING")
  (make-package "ROBOT_MSG::MAPSAVING"))
(unless (find-package "ROBOT_MSG::MAPSAVINGREQUEST")
  (make-package "ROBOT_MSG::MAPSAVINGREQUEST"))
(unless (find-package "ROBOT_MSG::MAPSAVINGRESPONSE")
  (make-package "ROBOT_MSG::MAPSAVINGRESPONSE"))

(in-package "ROS")





(defclass robot_msg::MapSavingRequest
  :super ros::object
  :slots (_path _filename ))

(defmethod robot_msg::MapSavingRequest
  (:init
   (&key
    ((:path __path) "")
    ((:filename __filename) "")
    )
   (send-super :init)
   (setq _path (string __path))
   (setq _filename (string __filename))
   self)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:serialization-length
   ()
   (+
    ;; string _path
    4 (length _path)
    ;; string _filename
    4 (length _filename)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _path
       (write-long (length _path) s) (princ _path s)
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_msg::MapSavingResponse
  :super ros::object
  :slots (_result ))

(defmethod robot_msg::MapSavingResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_msg::MapSaving
  :super ros::object
  :slots ())

(setf (get robot_msg::MapSaving :md5sum-) "9c408861d9ae9ea33255ca346b01a6f8")
(setf (get robot_msg::MapSaving :datatype-) "robot_msg/MapSaving")
(setf (get robot_msg::MapSaving :request) robot_msg::MapSavingRequest)
(setf (get robot_msg::MapSaving :response) robot_msg::MapSavingResponse)

(defmethod robot_msg::MapSavingRequest
  (:response () (instance robot_msg::MapSavingResponse :init)))

(setf (get robot_msg::MapSavingRequest :md5sum-) "9c408861d9ae9ea33255ca346b01a6f8")
(setf (get robot_msg::MapSavingRequest :datatype-) "robot_msg/MapSavingRequest")
(setf (get robot_msg::MapSavingRequest :definition-)
      "string path
string filename
---
bool    result

")

(setf (get robot_msg::MapSavingResponse :md5sum-) "9c408861d9ae9ea33255ca346b01a6f8")
(setf (get robot_msg::MapSavingResponse :datatype-) "robot_msg/MapSavingResponse")
(setf (get robot_msg::MapSavingResponse :definition-)
      "string path
string filename
---
bool    result

")



(provide :robot_msg/MapSaving "9c408861d9ae9ea33255ca346b01a6f8")


