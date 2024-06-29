ALTER TABLE tx_hr
ADD CONSTRAINT primary_key_tx_hr_px_id PRIMARY KEY ("PX_ID");

ALTER TABLE tx_hr
ADD CONSTRAINT unique_donor_id UNIQUE ("DONOR_ID");

ALTER TABLE tx_hr
ADD CONSTRAINT unique_trr_id UNIQUE ("TRR_ID");

ALTER TABLE tx_hr
ADD CONSTRAINT unique_rec_histo_tx_id UNIQUE ("REC_HISTO_TX_ID");

ALTER TABLE cand_thor
ADD CONSTRAINT primary_key_cand_px_id PRIMARY KEY ("PX_ID");


ALTER TABLE statjust_hr1b
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        statjust_hr1b
)
UPDATE statjust_hr1b
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE statjust_hr1b.ctid = numbered_rows.ctid;
ALTER TABLE statjust_hr1b
ADD CONSTRAINT primary_key_row_id1b PRIMARY KEY ("ROW_ID");


ALTER TABLE statjust_hr1a
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        statjust_hr1a
)
UPDATE statjust_hr1a
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE statjust_hr1a.ctid = numbered_rows.ctid;
ALTER TABLE statjust_hr1a
ADD CONSTRAINT primary_key_row_id1a PRIMARY KEY ("ROW_ID");

ALTER TABLE stathist_thor
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        stathist_thor
)
UPDATE stathist_thor
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE stathist_thor.ctid = numbered_rows.ctid;
ALTER TABLE stathist_thor
ADD CONSTRAINT primary_key_row_idthor PRIMARY KEY ("ROW_ID");

ALTER TABLE rec_histo_xmat
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        rec_histo_xmat
)
UPDATE rec_histo_xmat
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE rec_histo_xmat.ctid = numbered_rows.ctid;
ALTER TABLE rec_histo_xmat
ADD CONSTRAINT primary_key_row_idxmat PRIMARY KEY ("ROW_ID");

ALTER TABLE rec_histo
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        rec_histo
)
UPDATE rec_histo
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE rec_histo.ctid = numbered_rows.ctid;
ALTER TABLE rec_histo
ADD CONSTRAINT primary_key_row_idhisto PRIMARY KEY ("ROW_ID");

ALTER TABLE ptr_hr_20230101_20231231_pub
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        ptr_hr_20230101_20231231_pub
)
UPDATE ptr_hr_20230101_20231231_pub
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE ptr_hr_20230101_20231231_pub.ctid = numbered_rows.ctid;
ALTER TABLE ptr_hr_20230101_20231231_pub
ADD CONSTRAINT primary_key_row_id2023_ptr PRIMARY KEY ("ROW_ID");

ALTER TABLE ptr_hr_20220101_20221231_pub
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        ptr_hr_20220101_20221231_pub
)
UPDATE ptr_hr_20220101_20221231_pub
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE ptr_hr_20220101_20221231_pub.ctid = numbered_rows.ctid;
ALTER TABLE ptr_hr_20220101_20221231_pub
ADD CONSTRAINT primary_key_row_id2022_ptr PRIMARY KEY ("ROW_ID");

ALTER TABLE ptr_hr_20210101_20211231_pub
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        ptr_hr_20210101_20211231_pub
)
UPDATE ptr_hr_20210101_20211231_pub
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE ptr_hr_20210101_20211231_pub.ctid = numbered_rows.ctid;
ALTER TABLE ptr_hr_20210101_20211231_pub
ADD CONSTRAINT primary_key_row_id2021_ptr PRIMARY KEY ("ROW_ID");

ALTER TABLE immuno
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        immuno
)
UPDATE immuno
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE immuno.ctid = numbered_rows.ctid;
ALTER TABLE immuno
ADD CONSTRAINT primary_key_row_idimmuno PRIMARY KEY ("ROW_ID");

ALTER TABLE donor_disposition
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        donor_disposition
)
UPDATE donor_disposition
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE donor_disposition.ctid = numbered_rows.ctid;
ALTER TABLE donor_disposition
ADD CONSTRAINT primary_key_row_iddispo PRIMARY KEY ("ROW_ID");

ALTER TABLE donor_deceased
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        donor_deceased
)
UPDATE donor_deceased
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE donor_deceased.ctid = numbered_rows.ctid;
ALTER TABLE donor_deceased
ADD CONSTRAINT primary_key_row_iddeceased PRIMARY KEY ("ROW_ID");

ALTER TABLE donor_deceased
ADD COLUMN "ROW_ID" SERIAL;
WITH numbered_rows AS (
    SELECT
        ctid,
        row_number() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        donor_deceased
)
UPDATE donor_deceased
SET "ROW_ID" = numbered_rows.rn
FROM numbered_rows
WHERE donor_deceased.ctid = numbered_rows.ctid;
ALTER TABLE donor_deceased
ADD CONSTRAINT primary_key_row_iddeceased PRIMARY KEY ("ROW_ID");


