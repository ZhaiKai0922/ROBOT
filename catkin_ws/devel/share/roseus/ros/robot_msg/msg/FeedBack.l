;; Auto-generated. Do not edit!


(when (boundp 'robot_msg::FeedBack)
  (if (not (find-package "ROBOT_MSG"))
    (make-package "ROBOT_MSG"))
  (shadow 'FeedBack (find-package "ROBOT_MSG")))
(unless (find-package "ROBOT_MSG::FEEDBACK")
  (make-package "ROBOT_MSG::FEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude FeedBack.msg.html


(intern "*NONE*" (find-package "ROBOT_MSG::FEEDBACK"))
(shadow '*NONE* (find-package "ROBOT_MSG::FEEDBACK"))
(defconstant robot_msg::FeedBack::*NONE* 0)
(defclass robot_msg::FeedBack
  :super ros::object
  :slots (_feedback _feedbackStr ))

(defmethod robot_msg::FeedBack
  (:init
   (&key
    ((:feedback __feedback) 0)
    ((:feedbackStr __feedbackStr) "")
    )
   (send-super :init)
   (setq _feedback (round __feedback))
   (setq _feedbackStr (string __feedbackStr))
   self)
  (:feedback
   (&optional __feedback)
   (if __feedback (setq _feedback __feedback)) _feedback)
  (:feedbackStr
   (&optional __feedbackStr)
   (if __feedbackStr (setq _feedbackStr __feedbackStr)) _feedbackStr)
  (:serialization-length
   ()
   (+
    ;; int32 _feedback
    4
    ;; string _feedbackStr
    4 (length _feedbackStr)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _feedback
       (write-long _feedback s)
     ;; string _feedbackStr
       (write-long (length _feedbackStr) s) (princ _feedbackStr s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _feedback
     (setq _feedback (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _feedbackStr
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _feedbackStr (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get robot_msg::FeedBack :md5sum-) "0f9d77a5ebec864d5c1481f385477d58")
(setf (get robot_msg::FeedBack :datatype-) "robot_msg/FeedBack")
(setf (get robot_msg::FeedBack :definition-)
      "# msg definition

# feedback enum
int32 NONE              = 0 # none
                            # others...

int32           feedback 	    # result feedback
string 		    feedbackStr  	# feedback to string
")



(provide :robot_msg/FeedBack "0f9d77a5ebec864d5c1481f385477d58")


