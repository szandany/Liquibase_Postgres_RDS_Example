--liquibase formatted sql

--changeset SteveZ:456643-createtable_PaidSubscription
CREATE TABLE lookup."PaidSubscription" (
    "Id" integer NOT NULL,
    "employeeId" integer NOT NULL,
    "paymentId" integer NOT NULL,
    "tariffTypeId" integer NOT NULL,
    "startDate" timestamp without time zone NOT NULL,
    "finishDate" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL,
    "parentId" integer
);
--rollback drop TABLE lookup."PaidSubscription";

--changeset SteveZ:456-ALTER_TABLE_lookup."PaidSubscription"
ALTER TABLE lookup."PaidSubscription" OWNER TO user1;
--rollback ;

--changeset SteveZ:457-ALTER TABLE lookup."PaidSubscription"
ALTER TABLE ONLY lookup."PaidSubscription"
    ADD CONSTRAINT "PaidSubscription_pkey" PRIMARY KEY ("Id");
--rollback ;

--changeset AmyS:456643-createindex_"UIX_PaidSubscription_Once_Active"
CREATE UNIQUE INDEX "UIX_PaidSubscription_Once_Active" ON lookup."PaidSubscription" USING btree ("employeeId") WHERE "isActive";
--rollback drop INDEX lookup."UIX_PaidSubscription_Once_Active";
