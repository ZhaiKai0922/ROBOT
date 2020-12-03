;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::MapLoading)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'MapLoading (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::MAPLOADING")
  (make-package "ROBOT_MSG::MAPLOADING"))
(unless (find-package "ROBOT_MSG::MAPLOADINGREQUEST")
  (make-package "ROBOT_MSG::MAPLOADINGREQUEST"))
(unless (find-package "ROBOT_MSG::MAPLOADINGRESPONSE")
  (make-package "ROBOT_MSG::MAPLOADINGRESPONSE"))

(in-package "ROS")





(defclass robot_msg::MapLoadingRequest
  :super ros::object
  :slots (_path _filename ))

(defmethod robot_msg::MapLoadingRequest
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

(defclass robot_msg::MapLoadingResponse
  :super ros::object
  :slots (_result ))

(defmethod robot_msg::MapLoadingResponse
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

(defclass robot_msg::MapLoading
  :super ros::object
  :slots ())

(setf (get robot_msg::MapLoading :md5sum-) "9c408861d9ae9ea33255ca346b01a6f8")
(setf (get robot_msg::MapLoading :datatype-) "robot_msg/MapLoading")
(setf (get robot_msg::MapLoading :request) robot_msg::MapLoadingRequest)
(setf (get robot_msg::MapLoading :response) robot_msg::MapLoadingResponse)

(defmethod robot_msg::MapLoadingRequest
  (:response () (instance robot_msg::MapLoadingResponse :init)))

(setf (get robot_msg::MapLoadingRequest :md5sum-) "9c408861d9ae9ea33255ca346b01a6f8")
(setf (get robot_msg::MapLoadingRequest :datatype-) "robot_msg/MapLoadingRequest")
(setf (get robot_msg::MapLoadingRequest :definition-)
      "string path
string filename
---
bool    result

")

(setf (get robot_msg::MapLoadingResponse :md5sum-) "9c408861d9ae9ea33255ca346b01a6f8")
(setf (get robot_msg::MapLoadingResponse :datatype-) "robot_msg/MapLoadingResponse")
(setf (get robot_msg::MapLoadingResponse :definition-)
      "string path
string filename
---
bool    result

")



(provide :robot_msg/MapLoading "9c408861d9ae9ea33255ca346b01a6f8")


