;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::TrainScan)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'TrainScan (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::TRAINSCAN")
  (make-package "ROBOT_MSG::TRAINSCAN"))
(unless (find-package "ROBOT_MSG::TRAINSCANREQUEST")
  (make-package "ROBOT_MSG::TRAINSCANREQUEST"))
(unless (find-package "ROBOT_MSG::TRAINSCANRESPONSE")
  (make-package "ROBOT_MSG::TRAINSCANRESPONSE"))

(in-package "ROS")





(defclass robot_msg::TrainScanRequest
  :super ros::object
  :slots (_path _filename ))

(defmethod robot_msg::TrainScanRequest
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

(defclass robot_msg::TrainScanResponse
  :super ros::object
  :slots (_result ))

(defmethod robot_msg::TrainScanResponse
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

(defclass robot_msg::TrainScan
  :super ros::object
  :slots ())

(setf (get robot_msg::TrainScan :md5sum-) "9c408861d9ae9ea33255ca346b01a6f8")
(setf (get robot_msg::TrainScan :datatype-) "robot_msg/TrainScan")
(setf (get robot_msg::TrainScan :request) robot_msg::TrainScanRequest)
(setf (get robot_msg::TrainScan :response) robot_msg::TrainScanResponse)

(defmethod robot_msg::TrainScanRequest
  (:response () (instance robot_msg::TrainScanResponse :init)))

(setf (get robot_msg::TrainScanRequest :md5sum-) "9c408861d9ae9ea33255ca346b01a6f8")
(setf (get robot_msg::TrainScanRequest :datatype-) "robot_msg/TrainScanRequest")
(setf (get robot_msg::TrainScanRequest :definition-)
      "string path # path to store files for {scan, voc, bow};
string filename # string for prefix of the files
---
bool result # to indicate success or not

")

(setf (get robot_msg::TrainScanResponse :md5sum-) "9c408861d9ae9ea33255ca346b01a6f8")
(setf (get robot_msg::TrainScanResponse :datatype-) "robot_msg/TrainScanResponse")
(setf (get robot_msg::TrainScanResponse :definition-)
      "string path # path to store files for {scan, voc, bow};
string filename # string for prefix of the files
---
bool result # to indicate success or not

")



(provide :robot_msg/TrainScan "9c408861d9ae9ea33255ca346b01a6f8")


