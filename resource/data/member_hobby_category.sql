CREATE TABLE `hobby_category` (
  `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL UNIQUE COMMENT '兴趣分类名称',
  `sort` INT DEFAULT 0 COMMENT '排序值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='兴趣分类表';

CREATE TABLE `hobby_dict` (
  `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `category_id` INT UNSIGNED NOT NULL COMMENT '所属分类ID',
  `name` VARCHAR(50) NOT NULL UNIQUE COMMENT '兴趣名称',
  `sort` INT DEFAULT 0 COMMENT '排序值',
  FOREIGN KEY (`category_id`) REFERENCES `hobby_category`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='兴趣字典表';

CREATE TABLE `member_hobby` (
  `member_id` BIGINT UNSIGNED NOT NULL,
  `hobby_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`member_id`, `hobby_id`),
  FOREIGN KEY (`member_id`) REFERENCES `member`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`hobby_id`) REFERENCES `hobby_dict`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员兴趣关联表'; 