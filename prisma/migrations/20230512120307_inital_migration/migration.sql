-- CreateEnum
CREATE TYPE "BaseType" AS ENUM ('OPERATIONAL', 'HOMEBASE');

-- CreateTable
CREATE TABLE "Aircraft" (
    "id" SERIAL NOT NULL,
    "registration" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "configuration" TEXT NOT NULL,
    "serial_number" TEXT,
    "name" TEXT,
    "nick_name" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Aircraft_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Flight" (
    "id" SERIAL NOT NULL,
    "is_raido_id" BOOLEAN DEFAULT true,
    "airline_code" TEXT,
    "icao_airline_code" TEXT NOT NULL,
    "flight_number" TEXT NOT NULL,
    "suffix" TEXT,
    "departure_airport_code" TEXT NOT NULL,
    "arrival_airport_code" TEXT NOT NULL,
    "diversion_airport_code" TEXT,
    "flight_date" TIMESTAMP(3) NOT NULL,
    "std" TIMESTAMP(3) NOT NULL,
    "sta" TIMESTAMP(3) NOT NULL,
    "aircraft_registration" TEXT NOT NULL,
    "service_type_code" TEXT,
    "onward_airline_code" TEXT,
    "onward_flight_number" TEXT,
    "onward_suffix" TEXT,
    "status" TEXT NOT NULL,
    "type" TEXT,
    "canceled" BOOLEAN,
    "departure_local_time_diff" INTEGER,
    "arrival_local_time_diff" INTEGER,
    "ams_reasons" TEXT,
    "complement" TEXT,
    "co2" DOUBLE PRECISION,
    "schedule_gcdkm" TEXT,
    "schedule_gcdnm" TEXT,
    "project_codes" TEXT[],
    "aircraft_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Flight_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FlightRoute" (
    "id" SERIAL NOT NULL,
    "route_type" TEXT NOT NULL,
    "flight_id" INTEGER,
    "airport_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "FlightRoute_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Airport" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "local_name" TEXT,
    "iata" TEXT NOT NULL,
    "icao" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "gate" TEXT,
    "stand" INTEGER,
    "latitude" DOUBLE PRECISION NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "slot_level" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Airport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Delay" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "code2" TEXT NOT NULL,
    "minutes" INTEGER NOT NULL,
    "flight_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Delay_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Flightplan" (
    "id" SERIAL NOT NULL,
    "callsign" TEXT NOT NULL,
    "route" TEXT,
    "estimated_elapsed_time" INTEGER,
    "cruising_speed_level" TEXT,
    "flight_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Flightplan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Fuel" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "source" TEXT NOT NULL,
    "quantity" DOUBLE PRECISION NOT NULL,
    "quantity_unit" TEXT NOT NULL,
    "density" TEXT NOT NULL,
    "density_unit" TEXT NOT NULL,
    "flight_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Fuel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FuelData" (
    "id" SERIAL NOT NULL,
    "company" TEXT,
    "cost" DECIMAL(65,30) NOT NULL,
    "curreny" TEXT,
    "payment_type" TEXT,
    "receipt" TEXT,
    "comment" TEXT,
    "flight_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "FuelData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DetailedStatus" (
    "id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "flight_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DetailedStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Crew" (
    "id" SERIAL NOT NULL,
    "employee_number" TEXT NOT NULL,
    "is_raido_id" BOOLEAN DEFAULT true,
    "active" BOOLEAN NOT NULL,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT NOT NULL,
    "nick_name" TEXT,
    "gender" TEXT,
    "seniority" TEXT,
    "operational_bases" TEXT[],
    "rank" TEXT NOT NULL,
    "qualification" TEXT NOT NULL,
    "type" TEXT,
    "crew_type" TEXT NOT NULL,
    "date_of_birth" TEXT,
    "date_of_employment" TEXT,
    "shortcode" TEXT NOT NULL,
    "agency" TEXT NOT NULL,
    "zoho_employee_id" TEXT,
    "flight_id" INTEGER,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Crew_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Address" (
    "id" SERIAL NOT NULL,
    "valid_from" TIMESTAMP(3),
    "valid_to" TIMESTAMP(3),
    "priority" INTEGER,
    "type" TEXT,
    "comment" TEXT,
    "street" TEXT NOT NULL,
    "street_number" TEXT,
    "zip_postal" TEXT,
    "city" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "state_province" TEXT,
    "crew_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Email" (
    "id" SERIAL NOT NULL,
    "priority" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "comment" TEXT,
    "email_address" TEXT NOT NULL,
    "crew_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Email_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PhoneNumber" (
    "id" SERIAL NOT NULL,
    "valid_from" TIMESTAMP(3),
    "valid_to" TIMESTAMP(3),
    "priority" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "comment" TEXT,
    "country_prefix" TEXT,
    "region_prefix" TEXT,
    "phone_number" TEXT NOT NULL,
    "crew_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PhoneNumber_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rank" (
    "id" SERIAL NOT NULL,
    "rank" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Rank_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CrewRank" (
    "id" SERIAL NOT NULL,
    "valid_from" TIMESTAMP(3),
    "valid_to" TIMESTAMP(3),
    "rank_id" INTEGER NOT NULL,
    "crew_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CrewRank_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Qualification" (
    "id" SERIAL NOT NULL,
    "qualification" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Qualification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CrewQualifcation" (
    "id" SERIAL NOT NULL,
    "valid_from" TIMESTAMP(3),
    "valid_to" TIMESTAMP(3),
    "qualification_id" INTEGER NOT NULL,
    "crew_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CrewQualifcation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RosterActivity" (
    "id" SERIAL NOT NULL,
    "compound_index" TEXT NOT NULL,
    "is_raido_id" BOOLEAN DEFAULT true,
    "activity_type" TEXT NOT NULL,
    "activity_sub_type" TEXT NOT NULL,
    "start_airport_code" TEXT NOT NULL,
    "end_airport_code" TEXT NOT NULL,
    "start" TIMESTAMP(3) NOT NULL,
    "end" TIMESTAMP(3) NOT NULL,
    "start_local_time_diff" INTEGER NOT NULL,
    "end_local_time_diff" INTEGER NOT NULL,
    "start_base_time_diff" INTEGER NOT NULL,
    "end_base_time_diff" INTEGER NOT NULL,
    "roster_designator" TEXT,
    "legal_exception" TEXT,
    "credit" INTEGER,
    "assigned_rank" TEXT NOT NULL,
    "pairing_id" INTEGER NOT NULL,
    "activity_code" TEXT NOT NULL,
    "ref_unique_id" INTEGER NOT NULL,
    "confirmed" BOOLEAN,
    "is_carry_over_activity" BOOLEAN,
    "sft_fast_act_type" TEXT,
    "project_name" TEXT,
    "equipment_type" TEXT,
    "equipment_version" TEXT,
    "reference_activities" TEXT NOT NULL,
    "aircraft_equipment_type" TEXT,
    "aircraft_configuration" TEXT,
    "aircraft_equipment_name" TEXT,
    "aircraft_registration" TEXT,
    "night_fdp" TEXT NOT NULL,
    "block_hours" TEXT NOT NULL,
    "scheduled_block_hours" TEXT NOT NULL,
    "airborn_hours" TEXT NOT NULL,
    "duty" TEXT NOT NULL,
    "flight_id" INTEGER,
    "crew_id" INTEGER,
    "aircraft_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RosterActivity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RaidoTime" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "roster_activities_id" INTEGER,
    "flight_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RaidoTime_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RosterDesignator" (
    "id" SERIAL NOT NULL,
    "short_code" TEXT NOT NULL,
    "description" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "include_in_payroll" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "RefrenceActivities" (
    "id" SERIAL NOT NULL,
    "short_code" TEXT NOT NULL,
    "description" TEXT,
    "hex_color" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "include_in_payroll" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "ProjectActivities" (
    "id" SERIAL NOT NULL,
    "short_code" TEXT NOT NULL,
    "description" TEXT,
    "project" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "include_in_payroll" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Base" (
    "id" SERIAL NOT NULL,
    "type" "BaseType" NOT NULL DEFAULT 'HOMEBASE',
    "base_code" TEXT NOT NULL,
    "valid_from" TIMESTAMP(3) NOT NULL,
    "valid_to" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Base_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Airport_iata_key" ON "Airport"("iata");

-- CreateIndex
CREATE UNIQUE INDEX "Airport_icao_key" ON "Airport"("icao");

-- CreateIndex
CREATE UNIQUE INDEX "Flightplan_flight_id_key" ON "Flightplan"("flight_id");

-- CreateIndex
CREATE UNIQUE INDEX "Crew_employee_number_key" ON "Crew"("employee_number");

-- CreateIndex
CREATE UNIQUE INDEX "Rank_rank_key" ON "Rank"("rank");

-- CreateIndex
CREATE UNIQUE INDEX "Qualification_qualification_key" ON "Qualification"("qualification");

-- CreateIndex
CREATE UNIQUE INDEX "RosterActivity_compound_index_key" ON "RosterActivity"("compound_index");

-- CreateIndex
CREATE UNIQUE INDEX "RosterDesignator_short_code_key" ON "RosterDesignator"("short_code");

-- CreateIndex
CREATE UNIQUE INDEX "RefrenceActivities_short_code_key" ON "RefrenceActivities"("short_code");

-- CreateIndex
CREATE UNIQUE INDEX "ProjectActivities_short_code_key" ON "ProjectActivities"("short_code");

-- AddForeignKey
ALTER TABLE "Flight" ADD CONSTRAINT "Flight_aircraft_id_fkey" FOREIGN KEY ("aircraft_id") REFERENCES "Aircraft"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FlightRoute" ADD CONSTRAINT "FlightRoute_flight_id_fkey" FOREIGN KEY ("flight_id") REFERENCES "Flight"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FlightRoute" ADD CONSTRAINT "FlightRoute_airport_id_fkey" FOREIGN KEY ("airport_id") REFERENCES "Airport"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Delay" ADD CONSTRAINT "Delay_flight_id_fkey" FOREIGN KEY ("flight_id") REFERENCES "Flight"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Flightplan" ADD CONSTRAINT "Flightplan_flight_id_fkey" FOREIGN KEY ("flight_id") REFERENCES "Flight"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Fuel" ADD CONSTRAINT "Fuel_flight_id_fkey" FOREIGN KEY ("flight_id") REFERENCES "Flight"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FuelData" ADD CONSTRAINT "FuelData_flight_id_fkey" FOREIGN KEY ("flight_id") REFERENCES "Flight"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DetailedStatus" ADD CONSTRAINT "DetailedStatus_flight_id_fkey" FOREIGN KEY ("flight_id") REFERENCES "Flight"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Crew" ADD CONSTRAINT "Crew_flight_id_fkey" FOREIGN KEY ("flight_id") REFERENCES "Flight"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_crew_id_fkey" FOREIGN KEY ("crew_id") REFERENCES "Crew"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Email" ADD CONSTRAINT "Email_crew_id_fkey" FOREIGN KEY ("crew_id") REFERENCES "Crew"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhoneNumber" ADD CONSTRAINT "PhoneNumber_crew_id_fkey" FOREIGN KEY ("crew_id") REFERENCES "Crew"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrewRank" ADD CONSTRAINT "CrewRank_rank_id_fkey" FOREIGN KEY ("rank_id") REFERENCES "Rank"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrewRank" ADD CONSTRAINT "CrewRank_crew_id_fkey" FOREIGN KEY ("crew_id") REFERENCES "Crew"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrewQualifcation" ADD CONSTRAINT "CrewQualifcation_qualification_id_fkey" FOREIGN KEY ("qualification_id") REFERENCES "Qualification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrewQualifcation" ADD CONSTRAINT "CrewQualifcation_crew_id_fkey" FOREIGN KEY ("crew_id") REFERENCES "Crew"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RosterActivity" ADD CONSTRAINT "RosterActivity_flight_id_fkey" FOREIGN KEY ("flight_id") REFERENCES "Flight"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RosterActivity" ADD CONSTRAINT "RosterActivity_crew_id_fkey" FOREIGN KEY ("crew_id") REFERENCES "Crew"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RosterActivity" ADD CONSTRAINT "RosterActivity_aircraft_id_fkey" FOREIGN KEY ("aircraft_id") REFERENCES "Aircraft"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RaidoTime" ADD CONSTRAINT "RaidoTime_roster_activities_id_fkey" FOREIGN KEY ("roster_activities_id") REFERENCES "RosterActivity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RaidoTime" ADD CONSTRAINT "RaidoTime_flight_id_fkey" FOREIGN KEY ("flight_id") REFERENCES "Flight"("id") ON DELETE SET NULL ON UPDATE CASCADE;
