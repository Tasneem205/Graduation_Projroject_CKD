-- our views --

-- reports --
CREATE VIEW reports
AS


-- homepage view --
CREATE VIEW homepageView
AS
SELECT
    (SELECT COUNT(*) FROM doctors) AS doctors,
    (SELECT COUNT(*) FROM patients) AS patients,
    (SELECT COUNT(*) FROM lab_tests) AS lab_tests,
    -- (SELECT COUNT(*) FROM reports) AS reports,
    (SELECT COUNT(*) FROM scans) AS scans,
    (SELECT COUNT(*) FROM assistants) AS assistants;

