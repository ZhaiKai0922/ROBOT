// Auto-generated. Do not edit!

// (in-package robot_msg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class CartoToVisionMapRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.map_flag = null;
      this.poses = null;
    }
    else {
      if (initObj.hasOwnProperty('map_flag')) {
        this.map_flag = initObj.map_flag
      }
      else {
        this.map_flag = false;
      }
      if (initObj.hasOwnProperty('poses')) {
        this.poses = initObj.poses
      }
      else {
        this.poses = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CartoToVisionMapRequest
    // Serialize message field [map_flag]
    bufferOffset = _serializer.bool(obj.map_flag, buffer, bufferOffset);
    // Serialize message field [poses]
    // Serialize the length for message field [poses]
    bufferOffset = _serializer.uint32(obj.poses.length, buffer, bufferOffset);
    obj.poses.forEach((val) => {
      bufferOffset = geometry_msgs.msg.PoseStamped.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CartoToVisionMapRequest
    let len;
    let data = new CartoToVisionMapRequest(null);
    // Deserialize message field [map_flag]
    data.map_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [poses]
    // Deserialize array length for message field [poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.poses[i] = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.poses.forEach((val) => {
      length += geometry_msgs.msg.PoseStamped.getMessageSize(val);
    });
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msg/CartoToVisionMapRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9995b66cc422aa881fe02843d00db5f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool map_flag  # true-发送建图请求
    geometry_msgs/PoseStamped[] poses # 激光雷达所有scan帧的时间戳和位姿(雷达到世界坐标系)
    
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CartoToVisionMapRequest(null);
    if (msg.map_flag !== undefined) {
      resolved.map_flag = msg.map_flag;
    }
    else {
      resolved.map_flag = false
    }

    if (msg.poses !== undefined) {
      resolved.poses = new Array(msg.poses.length);
      for (let i = 0; i < resolved.poses.length; ++i) {
        resolved.poses[i] = geometry_msgs.msg.PoseStamped.Resolve(msg.poses[i]);
      }
    }
    else {
      resolved.poses = []
    }

    return resolved;
    }
};

class CartoToVisionMapResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.finish_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('finish_flag')) {
        this.finish_flag = initObj.finish_flag
      }
      else {
        this.finish_flag = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CartoToVisionMapResponse
    // Serialize message field [finish_flag]
    bufferOffset = _serializer.bool(obj.finish_flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CartoToVisionMapResponse
    let len;
    let data = new CartoToVisionMapResponse(null);
    // Deserialize message field [finish_flag]
    data.finish_flag = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msg/CartoToVisionMapResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4beddee2edc9a56424e7dee2f85e7ff0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool finish_flag # true-接收到建图信号
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CartoToVisionMapResponse(null);
    if (msg.finish_flag !== undefined) {
      resolved.finish_flag = msg.finish_flag;
    }
    else {
      resolved.finish_flag = false
    }

    return resolved;
    }
};

module.exports = {
  Request: CartoToVisionMapRequest,
  Response: CartoToVisionMapResponse,
  md5sum() { return '19a9e8c96780c7c67a6911545c02145e'; },
  datatype() { return 'robot_msg/CartoToVisionMap'; }
};
