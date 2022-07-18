
    create table category (
        id  bigserial not null,
        name varchar(255) not null,
        primary key (id)
    );

    create table customer (
        username varchar(255) not null,
        address varchar(255),
        name varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255),
        surname varchar(255) not null,
        primary key (username)
    );

    create table order_detail (
        order_id int8,
        product_id int8,
        amount int8 not null,
        boughtPrice float8,
        primary key (order_id, product_id)
    );

    create table product (
        id  bigserial not null,
        availability int8 not null,
        description varchar(255) not null,
        name varchar(255) not null,
        price float8 not null,
        category_id int8 not null,
        primary key (id)
    );

    create table sp_order (
        id  bigserial not null,
        date timestamp not null,
        customer_username varchar(255) not null,
        primary key (id)
    );

    alter table order_detail 
        add constraint FK_q6bwjb8y711vixrxinko7wmnw 
        foreign key (order_id) 
        references sp_order;

    alter table order_detail 
        add constraint FK_nkb731c2u3fxwuln18o6lyx6u 
        foreign key (product_id) 
        references product;

    alter table product 
        add constraint FK_rlaghtegr0yx2c1q1s6nkqjlh 
        foreign key (category_id) 
        references category;

    alter table sp_order 
        add constraint FK_m0adkfvnifo3pbgcvcrjik0w 
        foreign key (customer_username) 
        references customer;
