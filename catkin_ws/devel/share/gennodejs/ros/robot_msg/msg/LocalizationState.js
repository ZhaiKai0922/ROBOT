// Auto-generated. Do not edit!

// (in-package robot_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class LocalizationState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.localization_state = null;
      this.floor = null;
      this.global_pose = null;
      this.score = null;
      this.progress = null;
    }
    else {
      if (initObj.hasOwnProperty('localization_state')) {
        this.localization_state = initObj.localization_state
      }
      else {
        this.localization_state = 0;
      }
      if (initObj.hasOwnProperty('floor')) {
        this.floor = initObj.floor
      }
      else {
        this.floor = 0;
      }
      if (initObj.hasOwnProperty('global_pose')) {
        this.global_pose = initObj.global_pose
      }
      else {
        this.global_pose = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('score')) {
        this.score = initObj.score
      }
      else {
        this.score = 0.0;
      }
      if (initObj.hasOwnProperty('progress')) {
        this.progress = initObj.progress
      }
      else {
        this.progress = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LocalizationState
    // Serialize message field [localization_state]
    bufferOffset = _serializer.int32(obj.localization_state, buffer, bufferOffset);
    // Serialize message field [floor]
    bufferOffset = _serializer.int32(obj.floor, buffer, bufferOffset);
    // Serialize message field [global_pose]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.global_pose, buffer, bufferOffset);
    // Serialize message field [score]
    bufferOffset = _serializer.float32(obj.score, buffer, bufferOffset);
    // Serialize message field [progress]
    bufferOffset = _serializer.float32(obj.progress, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LocalizationState
    let len;
    let data = new LocalizationState(null);
    // Deserialize message field [localization_state]
    data.localization_state = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [floor]
    data.floor = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [global_pose]
    data.global_pose = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [score]
    data.score = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [progress]
    data.progress = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msg/LocalizationState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1ce43e83728f9fa44734aa425fdc622d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # msg definition 对Android
    
    # localization state enum
    int32 NONE         = 0 # 初始化
    int32 MAP_BUILDING = 1 # 建图中
    int32 LOCATING     = 2 # 定位中
    int32 SUCCESS      = 3 # 定位成功
    int32 FAILURE      = 4 # 定位失败
    int32 MAP_SAVING   = 5 # 地图保存中
    
    int32 		        localization_state      # 机器人定位状态
    int32                   floor                   # 机器人当前所处楼层
    geometry_msgs/Vector3 	global_pose             # 机器人全局位置坐标，(x，y，thete)
    float32                 score                   # 得分
    float32                 progress                # 地图保存进度，100%为已保存状态
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LocalizationState(null);
    if (msg.localization_state !== undefined) {
      resolved.localization_state = msg.localization_state;
    }
    else {
      resolved.localization_state = 0
    }

    if (msg.floor !== undefined) {
      resolved.floor = msg.floor;
    }
    else {
      resolved.floor = 0
    }

    if (msg.global_pose !== undefined) {
      resolved.global_pose = geometry_msgs.msg.Vector3.Resolve(msg.global_pose)
    }
    else {
      resolved.global_pose = new geometry_msgs.msg.Vector3()
    }

    if (msg.score !== undefined) {
      resolved.score = msg.score;
    }
    else {
      resolved.score = 0.0
    }

    if (msg.progress !== undefined) {
      resolved.progress = msg.progress;
    }
    else {
      resolved.progress = 0.0
    }

    return resolved;
    }
};

// Constants for message
LocalizationState.Constants = {
  NONE: 0,
  MAP_BUILDING: 1,
  LOCATING: 2,
  SUCCESS: 3,
  FAILURE: 4,
  MAP_SAVING: 5,
}

module.exports = LocalizationState;
