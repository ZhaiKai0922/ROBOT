/*
* @Description:Extended Kalman FIlter for IMU-Lidar-GNSS-Odo-Mag fusion
* @Author: Zhai Kai
* @Date: 2021-6-15 09:11
*/

#include "lidar_localization/models/kalman_filter/kalman_filter.hpp"

class ExtendedKalmanFIlter: public KalmanFilter{
    public:
    ExtendedKalmanFilter(const YAML::Node &node);

      /**
   * @brief  init filter
   * @param  imu_data, input IMU measurements
   * @return true if success false otherwise
   */
  void Init(const Eigen::Vector3d &vel, const IMUData &imu_data);

    /**
   * @brief  update state & covariance estimation, Kalman prediction
   * @param  imu_data, input IMU measurements
   * @return true if success false otherwise
   */
  bool Update(const IMUData &imu_data);

    /**
   * @brief  correct state & covariance estimation, Kalman correction
   * @param  measurement_type, input measurement type
   * @param  measurement, input measurement
   * @return void
   */
  bool Correct(const IMUData &imu_data, const MeasurementType &measurement_type,
               const Measurement &measurement);

  /**
   * @brief  get odometry estimation
   * @param  pose, output pose
   * @param  vel, output vel
   * @return void
   */
  void GetOdometry(Eigen::Matrix4f &pose, Eigen::Vector3f &vel);

  /**
   * @brief  get covariance estimation
   * @param  cov, output covariance
   * @return void
   */
  void GetCovariance(Cov &cov);

  /**
   * @brief  update observability analysis
   * @param  time, measurement time
   * @param  measurement_type, measurement type
   * @return void
   */
  void UpdateObservabilityAnalysis(const double &time,
                                   const MeasurementType &measurement_type);

  /**
   * @brief  save observability analysis to persistent storage
   * @param  measurement_type, measurement type
   * @return void
   */
  bool SaveObservabilityAnalysis(const MeasurementType &measurement_type);

private:
//dimension
}