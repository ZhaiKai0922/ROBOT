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

class SetActionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action_request_id = null;
      this.goal = null;
    }
    else {
      if (initObj.hasOwnProperty('action_request_id')) {
        this.action_request_id = initObj.action_request_id
      }
      else {
        this.action_request_id = '';
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetActionRequest
    // Serialize message field [action_request_id]
    bufferOffset = _serializer.string(obj.action_request_id, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetActionRequest
    let len;
    let data = new SetActionRequest(null);
    // Deserialize message field [action_request_id]
    data.action_request_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.action_request_id.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msg/SetActionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a0f5f90306dcb3282a753bd011a0bd01';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # srv definition
    
    #request constants
    #   action_request_id: 								
    #	“idle”			    - 空闲		
    #	“sleep”			    - 休眠		
    #	“movebase_goal”	    - 导航到目标点		
    #	”rotate”		    - 旋转一定角度（body系）	
    #   “rotate_to”		    - 旋转到指定朝向（world系）
    #	“go_charging”	    - 返回充电				
    # 	“separate_docker”	- 脱离充电桩		
    #	“remote_telep”	    - 远程遥控
    #request fields
    string                      action_request_id       # 请求id
    geometry_msgs/Vector3       goal                    # 动作目标，如果动作没有具体目标值则填空
    
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
    const resolved = new SetActionRequest(null);
    if (msg.action_request_id !== undefined) {
      resolved.action_request_id = msg.action_request_id;
    }
    else {
      resolved.action_request_id = ''
    }

    if (msg.goal !== undefined) {
      resolved.goal = geometry_msgs.msg.Vector3.Resolve(msg.goal)
    }
    else {
      resolved.goal = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

class SetActionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action_response_id = null;
    }
    else {
      if (initObj.hasOwnProperty('action_response_id')) {
        this.action_response_id = initObj.action_response_id
      }
      else {
        this.action_response_id = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetActionResponse
    // Serialize message field [action_response_id]
    bufferOffset = _serializer.string(obj.action_response_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetActionResponse
    let len;
    let data = new SetActionResponse(null);
    // Deserialize message field [action_response_id]
    data.action_response_id = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.action_response_id.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_msg/SetActionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ef3646447bef9a96de81e432787716ff';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    #response constants
    
    #response fields
    string      action_response_id 	        # 回复id，与当前action_request_id值相同，表明ros收到命令
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetActionResponse(null);
    if (msg.action_response_id !== undefined) {
      resolved.action_response_id = msg.action_response_id;
    }
    else {
      resolved.action_response_id = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SetActionRequest,
  Response: SetActionResponse,
  md5sum() { return '95130fd028332f5dbbdebe1f435d80e3'; },
  datatype() { return 'robot_msg/SetAction'; }
};
