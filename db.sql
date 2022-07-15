CREATE DATABASE IF NOT EXISTS `makeaplan`;
USE `makeaplan`;

CREATE TABLE `user`
(
    `id`          int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
    `insert_time` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    `username`    varchar(255)    NULL     DEFAULT NULL COMMENT '用户名',
    `data_id`     varchar(255)    NOT NULL COMMENT '数据 id',
    `device_id`   varchar(255)    NOT NULL COMMENT '设备唯一 id',
    `user_status` tinyint(2)      NOT NULL DEFAULT 1 COMMENT '账号状态，1 正常 2 不可用',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='用户表';

CREATE TABLE `plan`
(
    `id`              int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    `insert_time`     timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time`     timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    `user_id`         int(6) UNSIGNED NOT NULL COMMENT '用户id',

    `title`           varchar(1000)   NOT NULL COMMENT '标题',
    `code`            varchar(10)     NOT NULL COMMENT '计划编号',
    `note`            text            NULL     DEFAULT NULL COMMENT '备注',

    `type`            tinyint(2)      NOT NULL COMMENT '计划类型，1 任务表 2 多阶段任务',
    `plan_status`     tinyint(2)      NOT NULL DEFAULT 0 COMMENT '计划状态，1 删除 2 归档',

    `total_index`     int(4)          NULL     DEFAULT NULL COMMENT '目标值',
    `min_index`       int(4)          NULL     DEFAULT NULL COMMENT '最低目标值',
    `completed_index` int(4)          NULL     DEFAULT NULL COMMENT '已完成目标值',

    `start_time`      timestamp       NULL     DEFAULT NULL COMMENT '开始时间',
    `end_time`        timestamp       NULL     DEFAULT NULL COMMENT '结束时间',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='计划表';

CREATE TABLE `plan_phase_rel`
(
    `id`          int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    `insert_time` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    `plan_id`     int(4) UNSIGNED NOT NULL COMMENT '计划id',
    `phase_id`    int(4) UNSIGNED NOT NULL COMMENT '阶段id',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='计划阶段关联表';

CREATE TABLE `phase`
(
    `id`           int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    `insert_time`  timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time`  timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    `title`        varchar(1000)   NOT NULL COMMENT '标题',
    `note`         text            NULL     DEFAULT NULL COMMENT '备注',

    `phase_status` tinyint(2)      NOT NULL DEFAULT 0 COMMENT '阶段状态，1 删除',

    `start_time`   timestamp       NULL     DEFAULT NULL COMMENT '开始时间',
    `end_time`     timestamp       NULL     DEFAULT NULL COMMENT '结束时间',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='阶段表';

CREATE TABLE `plan_task_rel`
(
    `id`          int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    `insert_time` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    `plan_id`     int(4) UNSIGNED NOT NULL COMMENT '计划id',
    `task_id`     int(4) UNSIGNED NOT NULL COMMENT '任务id',
    `phase_id`    int(4) UNSIGNED NULL     DEFAULT NULL COMMENT '阶段id',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='计划任务关联表';

CREATE TABLE `task`
(
    `id`          int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    `insert_time` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    `title`       varchar(1000)   NOT NULL COMMENT '标题',

    `checked`     tinyint(2)      NOT NULL DEFAULT 0 COMMENT '状态，1 完成',
    `task_status` tinyint(2)      NOT NULL DEFAULT 0 COMMENT '任务状态，1 删除',

    `start_time`  timestamp       NULL     DEFAULT NULL COMMENT '开始时间',
    `end_time`    timestamp       NULL     DEFAULT NULL COMMENT '结束时间',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='任务表';

CREATE TABLE `blog`
(
    `id`          int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
    `insert_time` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    `title`       varchar(1000)    NOT NULL COMMENT '标题',
    `url`         varchar(1000)    NOT NULL COMMENT '文章地址',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='博客文章表';