create table product_type(
	id serial,
	product_name text,
	primary key (id)
);

create table product_description(
	id serial,
	description text,
	spesification text,
	primary key (id)
);

create table merk(
	id serial,
	name text,
	primary key (id)
);

create table payment_method(
	id serial,
	name text,
	primary key (id)
);

create table product(
	id serial,
	product_name text,
	stock int,
	price int,
	product_type_id serial,
	product_description_id serial,
	merk_id serial,
	primary key (id),
	foreign key (product_type_id) references product_type(id),
	foreign key (product_description_id) references product_description(id),
	foreign key (merk_id) references merk(id)
);

create table customer(
	id serial,
	name text,
	address text,
	dob date,
	status_user text,
	gender text,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
);

create table transaction(
	id serial,
	customer_id serial,
	payment_method_id serial,
	date_and_time timestamp,
	paid_amount int,
	status text,
	primary key (id),
	foreign key (customer_id) references customer(id),
	foreign key (payment_method_id) references payment_method(id)
	
);

create table transaction_detail(
	id serial,
	product_id serial,
	transaction_id serial,
	qty int,
	price int,
	sub_total int, 
	primary key (id),
	foreign key (product_id) references product(id),
	foreign key (transaction_id) references transaction(id)
);

