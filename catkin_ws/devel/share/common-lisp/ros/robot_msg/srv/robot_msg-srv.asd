
(cl:in-package :asdf)

(defsystem "robot_msg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :robot_msg-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CartoToVisionMap" :depends-on ("_package_CartoToVisionMap"))
    (:file "_package_CartoToVisionMap" :depends-on ("_package"))
    (:file "MapLoading" :depends-on ("_package_MapLoading"))
    (:file "_package_MapLoading" :depends-on ("_package"))
    (:file "MapSaving" :depends-on ("_package_MapSaving"))
    (:file "_package_MapSaving" :depends-on ("_package"))
    (:file "SaveFrames" :depends-on ("_package_SaveFrames"))
    (:file "_package_SaveFrames" :depends-on ("_package"))
    (:file "SetAction" :depends-on ("_package_SetAction"))
    (:file "_package_SetAction" :depends-on ("_package"))
    (:file "SetDevice" :depends-on ("_package_SetDevice"))
    (:file "_package_SetDevice" :depends-on ("_package"))
    (:file "SetMap" :depends-on ("_package_SetMap"))
    (:file "_package_SetMap" :depends-on ("_package"))
    (:file "SetRestrict" :depends-on ("_package_SetRestrict"))
    (:file "_package_SetRestrict" :depends-on ("_package"))
    (:file "SetSlam" :depends-on ("_package_SetSlam"))
    (:file "_package_SetSlam" :depends-on ("_package"))
    (:file "TrainScan" :depends-on ("_package_TrainScan"))
    (:file "_package_TrainScan" :depends-on ("_package"))
  ))