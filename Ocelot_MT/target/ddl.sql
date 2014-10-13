
    alter table custom_palette_item 
        drop constraint FK_qv74lwpv9tdvbgpxr2bfb5ux8;

    alter table custom_palette_item 
        drop constraint FK_jnd83j0jyfge09kytjjukpqk7;

    alter table model 
        drop constraint FK_bfdqrfqd4dehh1bt2b45jnidy;

    alter table palette_item 
        drop constraint FK_ghf4cfyvu55n82t37wd1i5u0g;

    alter table palette_palette_item 
        drop constraint FK_klsa6du2nb37kecr8081oej2f;

    alter table palette_palette_item 
        drop constraint FK_mmv594wxb4p9fgkf1f0mgylnt;

    drop table if exists category_item cascade;

    drop table if exists custom_palette_item cascade;

    drop table if exists member cascade;

    drop table if exists model cascade;

    drop table if exists palette cascade;

    drop table if exists palette_item cascade;

    drop table if exists palette_palette_item cascade;

    drop sequence hibernate_sequence;

    create table category_item (
        id int8 not null,
        version int8 not null,
        name varchar(255) not null,
        primary key (id)
    );

    create table custom_palette_item (
        id int8 not null,
        version int8 not null,
        activated boolean not null,
        category_id int8 not null,
        description varchar(255) not null,
        icon varchar(255) not null,
        name varchar(255) not null,
        palettes_id int8 not null,
        props varchar(5000),
        svg varchar(5000) not null,
        primary key (id)
    );

    create table member (
        id int8 not null,
        version int8 not null,
        date_created timestamp not null,
        login varchar(255) not null,
        name varchar(255) not null,
        primary key (id)
    );

    create table model (
        id int8 not null,
        version int8 not null,
        date_created timestamp not null,
        favourite boolean not null,
        last_updated timestamp not null,
        name varchar(255) not null,
        temporal boolean not null,
        user_id int8 not null,
        primary key (id)
    );

    create table palette (
        id int8 not null,
        version int8 not null,
        name varchar(255) not null,
        primary key (id)
    );

    create table palette_item (
        id int8 not null,
        version int8 not null,
        activated boolean not null,
        category_id int8 not null,
        description varchar(255) not null,
        icon varchar(255) not null,
        name varchar(255) not null,
        props varchar(5000),
        svg varchar(5000) not null,
        primary key (id)
    );

    create table palette_palette_item (
        palette_palette_items_id int8,
        palette_item_id int8
    );

    alter table member 
        add constraint UK_6m3rhsd4t4ngr0y1a5gd83beq  unique (login);

    alter table model 
        add constraint unique_name  unique (user_id, name);

    alter table custom_palette_item 
        add constraint FK_qv74lwpv9tdvbgpxr2bfb5ux8 
        foreign key (category_id) 
        references category_item;

    alter table custom_palette_item 
        add constraint FK_jnd83j0jyfge09kytjjukpqk7 
        foreign key (palettes_id) 
        references palette;

    alter table model 
        add constraint FK_bfdqrfqd4dehh1bt2b45jnidy 
        foreign key (user_id) 
        references member;

    alter table palette_item 
        add constraint FK_ghf4cfyvu55n82t37wd1i5u0g 
        foreign key (category_id) 
        references category_item;

    alter table palette_palette_item 
        add constraint FK_klsa6du2nb37kecr8081oej2f 
        foreign key (palette_item_id) 
        references palette_item;

    alter table palette_palette_item 
        add constraint FK_mmv594wxb4p9fgkf1f0mgylnt 
        foreign key (palette_palette_items_id) 
        references palette;

    create sequence hibernate_sequence;
