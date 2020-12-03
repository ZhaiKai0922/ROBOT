// Auto-generated. Do not edit!

// (in-package robot_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DockingState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.docking_state = null;
    }
    else {
      if (initObj.hasOwnProperty('docking_state')) {
        this.docking_state = initObj.docking_state
      }
      else {
        this.docking_state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DockingState
    // Serialize message field [docking_state]
    bufferOffset = _serializer.int32(obj.docking_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DockingState
    let len;
    let data = new DockingState(null);
    // Deserialize message field [docking_state]
    data.docking_state = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msg/DockingState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd0cea54154831428974ca314f83a5bb0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # msg definition
    
    # constants state enum
    int32 NONE              = 0 #初始化状态
    int32 SEARCHING_STATION = 1 # 1-寻找充电桩
    int32 DOCKING_STATION   = 2 # 2-对接中
    int32 DOCKING_SUCCESS   = 3 # 3-对接成功
    int32 SEARCHING_FAILURE = 4 # 4-失败-未找到充电桩
    int32 DOCKING_FAILURE   = 5 # 5-失败-对接失败
    int32 CANCLED           = 6 # 6-成功-动作被取消
    
    # fields
    int32 		docking_state  #机器人回充状态
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DockingState(null);
    if (msg.docking_state !== undefined) {
      resolved.docking_state = msg.docking_state;
    }
    else {
      resolved.docking_state = 0
    }

    return resolved;
    }
};

// Constants for message
DockingState.Constants = {
  NONE: 0,
  SEARCHING_STATION: 1,
  DOCKING_STATION: 2,
  DOCKING_SUCCESS: 3,
  SEARCHING_FAILURE: 4,
  DOCKING_FAILURE: 5,
  CANCLED: 6,
}

module.exports = DockingState;
