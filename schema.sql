-- this is our schema to create the tables - we tested if the data successfully loaded in the tables directly within jupyter notebook.

DROP TABLE "abnb_cleaned",
			"census_data_cleaned",
			"restaurant_data_cleaned",
			"restaurant_data_cleaned",
			"top_hotels_cleaned",
			"zipcode_cleaned";
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "abnb_cleaned" (
    "id" int   NOT NULL,
    "airbnb_name" VARCHAR   NOT NULL,
    "host_id" int   NOT NULL,
    "Neighborhood_Group" VARCHAR   NOT NULL,
    "Neighborhood" VARCHAR   NOT NULL,
    "Lat" int   NOT NULL,
    "Lon" int   NOT NULL,
    "room_type" VARCHAR   NOT NULL,
    "price" money   NOT NULL,
    "min_nights" int   NOT NULL,
    "availability_365" int   NOT NULL,
    CONSTRAINT "pk_abnb_cleaned" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "census_data_cleaned" (
    "Neighborhood" VARCHAR   NOT NULL,
    "Census_Year" int   NOT NULL,
    "Population" int   NOT NULL,
    CONSTRAINT "pk_census_data_cleaned" PRIMARY KEY (
        "Neighborhood"
     )
);

CREATE TABLE "restaurant_data_cleaned" (
    "Unique_id" VARCHAR   NOT NULL,
    "Name" VARCHAR   NOT NULL,
    "Street" VARCHAR   NOT NULL,
    "City" VARCHAR   NOT NULL,
    "State" VARCHAR   NOT NULL,
    "Categories" VARCHAR   NOT NULL,
    "Zip_Code" VARCHAR   NOT NULL,
    CONSTRAINT "pk_restaurant_data_cleaned" PRIMARY KEY (
        "Unique_id"
     )
);

CREATE TABLE "top_hotels_cleaned" (
    "Hotel_Name" VARCHAR   NOT NULL,
    "Lat" int   NOT NULL,
    "Lon" int   NOT NULL,
    "Zip_Code" VARCHAR   NOT NULL
);

CREATE TABLE "zipcode_cleaned" (
    "Zip_Code" VARCHAR   NOT NULL,
    "borough" VARCHAR   NOT NULL,
    "neighborhood" VARCHAR   NOT NULL,
    CONSTRAINT "pk_zipcode_cleaned" PRIMARY KEY (
        "Zip_Code"
     )
);

ALTER TABLE "abnb_cleaned" ADD CONSTRAINT "fk_abnb_cleaned_Neighborhood" FOREIGN KEY("Neighborhood")
REFERENCES "census_data_cleaned" ("Neighborhood");

ALTER TABLE "restaurant_data_cleaned" ADD CONSTRAINT "fk_restaurant_data_cleaned_Zip_Code" FOREIGN KEY("Zip_Code")
REFERENCES "zipcode_cleaned" ("Zip_Code");

ALTER TABLE "top_hotels_cleaned" ADD CONSTRAINT "fk_top_hotels_cleaned_Zip_Code" FOREIGN KEY("Zip_Code")
REFERENCES "zipcode_cleaned" ("Zip_Code");

ALTER TABLE "zipcode_cleaned" ADD CONSTRAINT "fk_zipcode_cleaned_neighborhood" FOREIGN KEY("neighborhood")
REFERENCES "census_data_cleaned" ("Neighborhood");