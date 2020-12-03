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

class ActionState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action_state_id = null;
      this.action_feedback = null;
    }
    else {
      if (initObj.hasOwnProperty('action_state_id')) {
        this.action_state_id = initObj.action_state_id
      }
      else {
        this.action_state_id = '';
      }
      if (initObj.hasOwnProperty('action_feedback')) {
        this.action_feedback = initObj.action_feedback
      }
      else {
        this.action_feedback = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ActionState
    // Serialize message field [action_state_id]
    bufferOffset = _serializer.string(obj.action_state_id, buffer, bufferOffset);
    // Serialize message field [action_feedback]
    bufferOffset = _serializer.int32(obj.action_feedback, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ActionState
    let len;
    let data = new ActionState(null);
    // Deserialize message field [action_state_id]
    data.action_state_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [action_feedback]
    data.action_feedback = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.action_state_id.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msg/ActionState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6a5aedc175e4d4597fe604ea49d45b40';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # msg definition
    
    #   action_state_id: 								
    #	“idle”			    - 空闲		
    #	“sleep”			    - 休眠		
    #	“movebase_goal”	    - 导航到目标点		
    #	”rotate”		    - 旋转一定角度（body系）	
    #   “rotate_to”		    - 旋转到指定朝向（world系）
    #	“go_charging”	    - 返回充电				
    # 	“separate_docker”	- 脱离充电桩		
    #	“remote_telep”	    - 远程遥控
    
    # feedback enum
    int32 NONE              = 0 # none
    int32 SET_NEW_GOAL      = 1 # 收到指令
    int32 RUNNING           = 2 # 动作执行中
    int32 GOAL_REACHED      = 3 # 成功 - 目标达到
    int32 GOAL_CANCLE       = 4 # 成功 - 目标被取消
    int32 OBSTACLE          = 5 # 失败 - 存在障碍物
    int32 NO_PATH           = 6 # 失败 - 没有可行路径
    int32 DOCKER_NOTFOUND   = 7 # 失败 - 未找到充电桩
    int32 DOCKING_FAILURE   = 8 # 失败 - 对接失败
    int32 ERROR_NODEFINE    = 9 # 失败 - 其他异常 STUCK
    
    string 		    action_state_id  	# 机器人所处功能状态id
    int32           action_feedback 	# 动作执行实时状态反馈
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ActionState(null);
    if (msg.action_state_id !== undefined) {
      resolved.action_state_id = msg.action_state_id;
    }
    else {
      resolved.action_state_id = ''
    }

    if (msg.action_feedback !== undefined) {
      resolved.action_feedback = msg.action_feedback;
    }
    else {
      resolved.action_feedback = 0
    }

    return resolved;
    }
};

// Constants for message
ActionState.Constants = {
  NONE: 0,
  SET_NEW_GOAL: 1,
  RUNNING: 2,
  GOAL_REACHED: 3,
  GOAL_CANCLE: 4,
  OBSTACLE: 5,
  NO_PATH: 6,
  DOCKER_NOTFOUND: 7,
  DOCKING_FAILURE: 8,
  ERROR_NODEFINE: 9,
}

module.exports = ActionState;
