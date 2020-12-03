;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::LeanMap)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'LeanMap (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::LEANMAP")
  (make-package "ROBOT_MSG::LEANMAP"))

(in-package "ROS")
;;//! \htmlinclude LeanMap.msg.html


(defclass robot_msg::LeanMap
  :super ros::object
  :slots (_resolution _width _height _data ))

(defmethod robot_msg::LeanMap
  (:init
   (&key
    ((:resolution __resolution) 0.0)
    ((:width __width) 0)
    ((:height __height) 0)
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _resolution (float __resolution))
   (setq _width (round __width))
   (setq _height (round __height))
   (setq _data __data)
   self)
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; float32 _resolution
    4
    ;; uint32 _width
    4
    ;; uint32 _height
    4
    ;; int8[] _data
    (* 1    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _resolution
       (sys::poke _resolution (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _width
       (write-long _width s)
     ;; uint32 _height
       (write-long _height s)
     ;; int8[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-byte (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _resolution
     (setq _resolution (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int8[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _data i) 127) (setf (elt _data i) (- (elt _data i) 256)))
     ))
   ;;
   self)
  )

(setf (get robot_msg::LeanMap :md5sum-) "a5d9161024fc3ea9720ca822a0ae9d91")
(setf (get robot_msg::LeanMap :datatype-) "robot_msg/LeanMap")
(setf (get robot_msg::LeanMap :definition-)
      "float32 resolution
uint32 width
uint32 height
int8[] data

")



(provide :robot_msg/LeanMap "a5d9161024fc3ea9720ca822a0ae9d91")


