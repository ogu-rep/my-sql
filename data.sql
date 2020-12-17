-- 1億レコード

DROP PROCEDURE if exists reserveData;

DELIMITER //
CREATE PROCEDURE reserveData()
BEGIN
  DECLARE i INT DEFAULT 1; -- カウンタ
  DECLARE pId INT DEFAULT 1; -- product_id
  DECLARE mId INT DEFAULT 1; -- member_id
  DECLARE isPaid INT DEFAULT 0; -- is_paid
  DECLARE rAt DATETIME DEFAULT current_timestamp; -- reserved_at
  DECLARE cAt DATETIME DEFAULT null; -- canceled_at

  WHILE (i <= 100000000) DO
    INSERT INTO reservations (product_id, member_id, is_paid, reserved_at, canceled_at)
      VALUES (pId, mId, isPaid, date_add(rAt, interval i % 15 day), cAt);
    -- 日付カウンタリセット
    IF i % 200 = 0 THEN
      SET cAt = date_add(rAt, interval 1 day);
    ELSE
      SET cAt = null;
    END IF;

    -- id更新
    IF i % 2 = 0 THEN
      SET mId = mId + 1;
    ELSEIF i % 5 = 0 THEN
      SET pId = pId + 1;
    END IF;

    -- 支払済み(is_paid = 1)のレコードを作成
    IF i BETWEEN 99999990 AND 99999999 THEN
      SET isPaid = 1;
    END IF;

    -- カウンタ更新
    SET i = i + 1;
  END WHILE;
END;
//
DELIMITER ;

CALL reserveData();
