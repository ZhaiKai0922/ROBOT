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
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SlamStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.status = null;
      this.pose = null;
      this.score = null;
      this.process = null;
      this.expect_time = null;
      this.relocated = null;
      this.reloc_used_time = null;
      this.opt_works_remain = null;
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = '';
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('score')) {
        this.score = initObj.score
      }
      else {
        this.score = 0.0;
      }
      if (initObj.hasOwnProperty('process')) {
        this.process = initObj.process
      }
      else {
        this.process = 0.0;
      }
      if (initObj.hasOwnProperty('expect_time')) {
        this.expect_time = initObj.expect_time
      }
      else {
        this.expect_time = 0.0;
      }
      if (initObj.hasOwnProperty('relocated')) {
        this.relocated = initObj.relocated
      }
      else {
        this.relocated = false;
      }
      if (initObj.hasOwnProperty('reloc_used_time')) {
        this.reloc_used_time = initObj.reloc_used_time
      }
      else {
        this.reloc_used_time = 0.0;
      }
      if (initObj.hasOwnProperty('opt_works_remain')) {
        this.opt_works_remain = initObj.opt_works_remain
      }
      else {
        this.opt_works_remain = 0;
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SlamStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.string(obj.status, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [score]
    bufferOffset = _serializer.float32(obj.score, buffer, bufferOffset);
    // Serialize message field [process]
    bufferOffset = _serializer.float32(obj.process, buffer, bufferOffset);
    // Serialize message field [expect_time]
    bufferOffset = _serializer.float32(obj.expect_time, buffer, bufferOffset);
    // Serialize message field [relocated]
    bufferOffset = _serializer.bool(obj.relocated, buffer, bufferOffset);
    // Serialize message field [reloc_used_time]
    bufferOffset = _serializer.float32(obj.reloc_used_time, buffer, bufferOffset);
    // Serialize message field [opt_works_remain]
    bufferOffset = _serializer.int16(obj.opt_works_remain, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float32(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SlamStatus
    let len;
    let data = new SlamStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [score]
    data.score = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [process]
    data.process = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [expect_time]
    data.expect_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [relocated]
    data.relocated = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [reloc_used_time]
    data.reloc_used_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [opt_works_remain]
    data.opt_works_remain = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.status.length;
    return length + 83;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msg/SlamStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '65da29df73e6a7154f974aeec3a060d8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    string              status              # 状态
    geometry_msgs/Pose  pose                # 全局位姿
    float32             score               # 得分
    float32             process             # 地图保存进图，100%为已保存状态
    float32             expect_time         # 预测保存地图的时间，假设每秒优化2个
    bool                relocated           # 重定位成功判断
    float32             reloc_used_time     # 上次重定位耗费时间
    int16               opt_works_remain    # 优化队列
    float32             angle               # 地图旋转角度 radian
    
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
    const resolved = new SlamStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = ''
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.Pose.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.Pose()
    }

    if (msg.score !== undefined) {
      resolved.score = msg.score;
    }
    else {
      resolved.score = 0.0
    }

    if (msg.process !== undefined) {
      resolved.process = msg.process;
    }
    else {
      resolved.process = 0.0
    }

    if (msg.expect_time !== undefined) {
      resolved.expect_time = msg.expect_time;
    }
    else {
      resolved.expect_time = 0.0
    }

    if (msg.relocated !== undefined) {
      resolved.relocated = msg.relocated;
    }
    else {
      resolved.relocated = false
    }

    if (msg.reloc_used_time !== undefined) {
      resolved.reloc_used_time = msg.reloc_used_time;
    }
    else {
      resolved.reloc_used_time = 0.0
    }

    if (msg.opt_works_remain !== undefined) {
      resolved.opt_works_remain = msg.opt_works_remain;
    }
    else {
      resolved.opt_works_remain = 0
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    return resolved;
    }
};

module.exports = SlamStatus;
