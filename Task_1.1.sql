create table if not exists Genre (
id serial primary key,
name varchar(40) not null
);

create table if not exists genre_musicians (
genre_id integer references genre(id),
musicians_id integer references musicians(id),
constraint pk primary key (genre_id, musicians_id)
);

create table if not exists musicians (
id serial primary key,
name varchar(40) not null,
id_genre int references genre(id)
);

alter table musicians drop column id_genre;

create table if not exists albums (
id serial primary key,
name varchar(40) not null,
year int check(year > 0),
id_musicians int references musicians(id)
);

create table if not exists albums_musicians (
albums_id integer references albums(id),
musicians_id integer references musicians(id),
constraint pk_albums primary key (albums_id, musicians_id)
);

alter table albums drop column id_musicians;

create table if not exists tracks (
id serial primary key,
name varchar(40) not null,
duration real not null,
id_albums int references albums(id)
);

create table if not exists collections (
id serial primary key,
name varchar(40) not null,
year int check(year > 0)
);

create table if not exists collections_tracks (
tracks_id integer references tracks(id),
collections_id integer references collections(id),
constraint pk_collections primary key (tracks_id, collections_id)
);