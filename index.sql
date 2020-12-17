drop table if exists reservations;

create table reservations (
        id bigint(20) unsigned not null primary key auto_increment,
        product_id bigint(20) unsigned not null, -- 商品ID
        member_id bigint(20) unsigned not null, -- 会員ID
        is_paid tinyint(1) default '0', -- 支払い済みかどうか 0=未払い, 1=支払済み
        reserved_at datetime(6) not null, -- 予約日時
        canceled_at datetime(6) default null -- キャンセル日時
);