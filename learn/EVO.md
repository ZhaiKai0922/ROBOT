# EVO

evo_config show --brief

```yaml
"console_logging_format": "%(message)s", 
    "euler_angle_sequence": "sxyz", 
    "global_logfile_enabled": false, 
    "plot_axis_marker_scale": 0.0, 
    "plot_backend": "Qt5Agg", 
    "plot_export_format": "pdf", 
    "plot_figsize": [
        6, 
        6
    ], 
    "plot_fontfamily": "sans-serif", 
    "plot_fontscale": 1.0, 
    "plot_invert_xaxis": false, 
    "plot_invert_yaxis": false, 
    "plot_linewidth": 1.5, 
    "plot_mode_default": "xyz", 
    "plot_multi_cmap": "none", 
    "plot_pose_correspondences": false, 
    "plot_pose_correspondences_linestyle": "dotted", 
    "plot_reference_alpha": 0.5, 
    "plot_reference_color": "black", 
    "plot_reference_linestyle": "--", 
    "plot_seaborn_palette": "deep6", 
    "plot_seaborn_style": "darkgrid", 
    "plot_split": false, 
    "plot_statistics": [
        "rmse", 
        "median", 
        "mean", 
        "std", 
        "min", 
        "max"
    ], 
    "plot_texsystem": "pdflatex", 
    "plot_trajectory_alpha": 0.75, 
    "plot_trajectory_cmap": "jet", 
    "plot_trajectory_linestyle": "-", 
    "plot_usetex": false, 
    "plot_xyz_realistic": true, 
    "ros_map_alpha_value": 1.0, 
    "ros_map_unknown_cell_value": 205, 
    "save_traj_in_zip": false, 
    "table_export_data": "stats", 
    "table_export_format": "csv", 
    "table_export_transpose": true, 
    "tf_cache_lookup_frequency": 10, 
    "tf_cache_max_time": 10000.0

```

调整图像大小：**evo_config set plot_figsize 10 9**

```text
evo_ape kitti KITTI_00_gt.txt KITTI_00_SPTAM.txt -va --plot --plot_mode xz --save_results results/SPTAM.zip
```

```text
evo_res results/*.zip -p --save_table results/table.csv
```

```text
evo_config set plot_seaborn_palette bright //修改线条
这是修改线条，其中bright可以替换成deep, muted, bright, pastel, dark, colorblin
```

```tex
evo_config set plot_seaborn_style whitegrid  //修改背景
这是修改背景，其中whitegrid可以替换成darkgrid, whitegrid, dark, white, ticks
```

```
调整字体大小：evo_config set plot_fontfamily serif plot_fontscale 2
```

```
调整图像大小：evo_config set plot_figsize 10 9
宽度为10，高度为9
```

evo_rpe kitti ground_truth.txt laser_odom.txt -r trans_part --delta 100 --plot --plot_mode xyz

evo_ape kitti ground_truth.txt laser_odom.txt -r full --plot --plot_mode xyz

evo_res NDT NDT-ICP --use_filenames -p --save_table res_ape_1.csv

