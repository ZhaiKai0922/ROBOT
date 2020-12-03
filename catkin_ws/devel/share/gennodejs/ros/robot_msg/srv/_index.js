
"use strict";

let MapLoading = require('./MapLoading.js')
let SetAction = require('./SetAction.js')
let SetRestrict = require('./SetRestrict.js')
let SaveFrames = require('./SaveFrames.js')
let SetSlam = require('./SetSlam.js')
let SetDevice = require('./SetDevice.js')
let CartoToVisionMap = require('./CartoToVisionMap.js')
let MapSaving = require('./MapSaving.js')
let SetMap = require('./SetMap.js')
let TrainScan = require('./TrainScan.js')

module.exports = {
  MapLoading: MapLoading,
  SetAction: SetAction,
  SetRestrict: SetRestrict,
  SaveFrames: SaveFrames,
  SetSlam: SetSlam,
  SetDevice: SetDevice,
  CartoToVisionMap: CartoToVisionMap,
  MapSaving: MapSaving,
  SetMap: SetMap,
  TrainScan: TrainScan,
};
