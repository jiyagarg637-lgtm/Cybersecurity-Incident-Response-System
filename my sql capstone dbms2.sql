/*USE cybersecurity_db;

SHOW TABLES;*/

/*SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'cybersecurity_db'
AND REFERENCED_TABLE_NAME IS NOT NULL;*/

/*SHOW CREATE TABLE mitigation_actions;*/

/*USE cybersecurity_db;

SHOW FULL TABLES;*/

/*CREATE TABLE mitigation_action_steps (
    action_id INT NOT NULL,
    step_no INT NOT NULL,
    step_description VARCHAR(255) NOT NULL,
    step_status VARCHAR(30) DEFAULT 'Pending',
    PRIMARY KEY (action_id, step_no),
    FOREIGN KEY (action_id)
        REFERENCES mitigation_actions(action_id)
);*/



/*DESCRIBE mitigation_action_steps;*/

/*INSERT INTO mitigation_action_steps
(action_id, step_no, step_description, step_status)
VALUES
(1, 1, 'Identify the security issue', 'Completed'),
(1, 2, 'Reset user password', 'Completed'),
(1, 3, 'Verify the account security', 'Pending'),
(2, 1, 'Update antivirus software', 'Completed'),
(2, 2, 'Scan the affected system', 'Pending');*/

/*SELECT * FROM mitigation_action_steps;*/

/*ALTER TABLE security_events
ADD asset_group VARCHAR(50);*/

/*UPDATE security_events
SET asset_group = CASE
    WHEN event_id IN (1, 2) THEN 'Network'
    WHEN event_id IN (3, 4) THEN 'Server'
    WHEN event_id = 5 THEN 'Database'
END;*/

/*SELECT event_id, source_ip, severity, asset_group
FROM security_events;*/

/*SELECT
    event_id,
    source_ip,
    severity,
    asset_group,
    CASE
        WHEN severity = 'Critical' THEN 100
        WHEN severity = 'High' THEN 75
        WHEN severity = 'Medium' THEN 50
        ELSE 25
    END AS risk_score,
    DENSE_RANK() OVER (
        PARTITION BY asset_group
        ORDER BY
            CASE
                WHEN severity = 'Critical' THEN 100
                WHEN severity = 'High' THEN 75
                WHEN severity = 'Medium' THEN 50
                ELSE 25
            END DESC
    ) AS incident_rank
FROM security_events
ORDER BY asset_group, incident_rank;*/

/*SELECT
    event_id,
    source_ip,
    event_type,
    event_time,
    COUNT(
        CASE
            WHEN event_type IN (
                'Failed Login',
                'Multiple Failed Logins'
            )
            THEN 1
        END
    ) OVER (
        PARTITION BY source_ip
        ORDER BY event_time
        RANGE BETWEEN INTERVAL 1 HOUR PRECEDING
        AND CURRENT ROW
    ) AS failed_login_count
FROM security_events
ORDER BY source_ip, event_time;*/

