/* CREATE DATABASE cybersecurity_db;
USE cybersecurity_db;


/*security_events*/
/*CREATE TABLE security_events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    source_ip VARCHAR(45) NOT NULL,
    event_type VARCHAR(100) NOT NULL,
    event_time DATETIME NOT NULL,
    severity VARCHAR(20) NOT NULL,
    status VARCHAR(30) DEFAULT 'Open'
);
DESCRIBE security_events;*/

/*INSERT INTO security_events
(source_ip, event_type, event_time, severity, status)
VALUES
('192.168.1.10', 'Failed Login', '2026-11-01 10:30:00', 'High', 'Open'),
('192.168.1.15', 'Malware Detected', '2026-11-01 11:00:00', 'Critical', 'Investigating'),
('10.0.0.5', 'Suspicious Access', '2026-11-01 12:15:00', 'Medium', 'Open'),
('172.16.0.8', 'Multiple Failed Logins', '2026-11-01 13:00:00', 'High', 'Resolved'),
('192.168.1.20', 'Unauthorized Access', '2026-11-01 14:20:00', 'Critical', 'Open');*/
/*SELECT * FROM security_events;*/


/*analysts*/

/*CREATE TABLE analysts (
    analyst_id INT AUTO_INCREMENT PRIMARY KEY,
    analyst_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    team_name VARCHAR(50),
    analyst_level VARCHAR(30) NOT NULL
);*/


/*INSERT INTO analysts
(analyst_name, email, team_name, analyst_level)
VALUES
('Rahul Sharma', 'rahul@gmail.com', 'Team Alpha', 'Senior'),
('Priya Verma', 'priya@gmail.com', 'Team Alpha', 'Junior'),
('Aman Gupta', 'aman@gmail.com', 'Team Beta', 'Lead'),
('Neha Singh', 'neha@gmail.com', 'Team Beta', 'Junior'),
('Riya Jain', 'riya@gmail.com', 'Team Gamma', 'Senior');*/
/*SELECT * FROM analysts;*/


/* alerts */


/*CREATE TABLE alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    analyst_id INT,
    alert_message VARCHAR(255) NOT NULL,
    alert_time DATETIME NOT NULL,
    alert_status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (event_id)
    REFERENCES security_events(event_id),

    FOREIGN KEY (analyst_id)
    REFERENCES analysts(analyst_id)
);*/
/*INSERT INTO alerts
(event_id, analyst_id, alert_message, alert_time, alert_status)
VALUES
(1, 1, 'Repeated failed login attempts', '2026-11-01 10:35:00', 'Pending'),
(2, 2, 'Malware detected in system', '2026-11-01 11:05:00', 'Investigating'),
(3, 3, 'Suspicious network access', '2026-11-01 12:20:00', 'Pending'),
(4, 4, 'Multiple login failures detected', '2026-11-01 13:05:00', 'Resolved'),
(5, 5, 'Unauthorized access detected', '2026-11-01 14:25:00', 'Investigating');
SELECT * FROM alerts;*/
/*SELECT
    a.alert_id,
    e.source_ip,
    e.event_type,
    an.analyst_name,
    a.alert_status
FROM alerts a
JOIN security_events e ON a.event_id = e.event_id
LEFT JOIN analysts an ON a.analyst_id = an.analyst_id;*/

/*vulnerabilities*/
/*CREATE TABLE vulnerabilities (
    vulnerability_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    vulnerability_name VARCHAR(150) NOT NULL,
    risk_level VARCHAR(20),
    description TEXT,
    discovered_date DATE,
    FOREIGN KEY (event_id) REFERENCES security_events(event_id)
);*/
/*INSERT INTO vulnerabilities
(event_id, vulnerability_name, risk_level, description, discovered_date)
VALUES
(1, 'Weak Password', 'High', 'User account has a weak password', '2026-11-01'),
(2, 'Outdated Antivirus', 'Critical', 'Antivirus software is outdated', '2026-11-01'),
(3, 'Unauthorized Port', 'Medium', 'An unnecessary port is open', '2026-11-01'),
(4, 'Brute Force Risk', 'High', 'Multiple failed login attempts detected', '2026-11-01'),
(5, 'Access Control Issue', 'Critical', 'Unauthorized access detected', '2026-11-01');*/
/*SELECT * FROM vulnerabilities;*/

/*threats*/
/*CREATE TABLE threats (
    threat_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    threat_name VARCHAR(150) NOT NULL,
    threat_type VARCHAR(100),
    threat_level VARCHAR(20),
    detected_date DATE,
    FOREIGN KEY (event_id) REFERENCES security_events(event_id)
);*/
/*INSERT INTO threats
(event_id, threat_name, threat_type, threat_level, detected_date)
VALUES
(1, 'Password Attack', 'Brute Force', 'High', '2026-11-01'),
(2, 'Malware Attack', 'Malware', 'Critical', '2026-11-01'),
(3, 'Port Scanning', 'Network Attack', 'Medium', '2026-11-01'),
(4, 'Repeated Login Attack', 'Brute Force', 'High', '2026-11-01'),
(5, 'Unauthorized Access', 'Access Attack', 'Critical', '2026-11-01');
SELECT * FROM threats;*/

/*mitigation_actions table*/
/*CREATE TABLE mitigation_actions (
    action_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    analyst_id INT,
    action_description VARCHAR(255) NOT NULL,
    action_date DATETIME,
    action_status VARCHAR(30) DEFAULT 'Pending',
    FOREIGN KEY (event_id) REFERENCES security_events(event_id),
    FOREIGN KEY (analyst_id) REFERENCES analysts(analyst_id)
);*/
/*INSERT INTO mitigation_actions
(event_id, analyst_id, action_description, action_date, action_status)
VALUES
(1, 1, 'Reset user password', '2026-11-01 15:00:00', 'Completed'),
(2, 2, 'Update antivirus software', '2026-11-01 15:30:00', 'In Progress'),
(3, 3, 'Block unnecessary network port', '2026-11-01 16:00:00', 'Pending'),
(4, 4, 'Block suspicious IP address', '2026-11-01 16:30:00', 'Completed'),
(5, 5, 'Restrict unauthorized access', '2026-11-01 17:00:00', 'In Progress');
SELECT * FROM mitigation_actions;*/



/*SELECT
    se.event_id,
    se.source_ip,
    se.event_type,
    se.severity,
    a.alert_id,
    a.alert_message,
    an.analyst_name
FROM security_events se
INNER JOIN alerts a
    ON se.event_id = a.event_id
LEFT JOIN analysts an
    ON a.analyst_id = an.analyst_id;*/


/*SELECT
    source_ip,
    COUNT(*) AS failed_login_attempts
FROM security_events
WHERE event_type IN ('Failed Login', 'Multiple Failed Logins')
GROUP BY source_ip
HAVING COUNT(*) >= 1;*/

/*SELECT
    event_id,
    source_ip,
    event_type,
    severity,
    status,
    CASE
        WHEN severity = 'Critical' THEN 'Immediate Action'
        WHEN severity = 'High' THEN 'Urgent'
        WHEN severity = 'Medium' THEN 'Moderate'
        ELSE 'Low Priority'
    END AS risk_assessment
FROM security_events
ORDER BY
    CASE severity
        WHEN 'Critical' THEN 1
        WHEN 'High' THEN 2
        WHEN 'Medium' THEN 3
        ELSE 4
    END;*/

    /*security_events*/
   /* CREATE INDEX idx_source_ip_event_time
ON security_events (source_ip, event_time);*/

/*CREATE INDEX idx_severity_status
ON security_events (severity, status);*/

/*SHOW INDEX FROM security_events;*/


/*CREATE INDEX idx_alerts_event_id
ON alerts (event_id);*/

/*SHOW INDEX FROM alerts;*/

/*EXPLAIN
SELECT *
FROM security_events
WHERE source_ip = '192.168.1.10'
AND event_time BETWEEN '2026-11-01 00:00:00'
AND '2026-11-02 23:59:59';*/

/*CREATE VIEW open_critical_incidents AS
SELECT
    se.event_id,
    se.source_ip,
    se.event_type,
    se.severity,
    se.status,
    a.alert_message,
    v.vulnerability_name,
    an.analyst_name
FROM security_events se
LEFT JOIN alerts a
    ON se.event_id = a.event_id
LEFT JOIN vulnerabilities v
    ON se.event_id = v.event_id
LEFT JOIN analysts an
    ON a.analyst_id = an.analyst_id
WHERE se.severity = 'Critical'
AND se.status = 'Open';*/
/*SELECT * FROM open_critical_incidents;*/

/*CREATE VIEW junior_analyst_incidents AS
SELECT
    se.event_id,
    se.source_ip,
    se.event_type,
    se.severity,
    se.status,
    an.analyst_name,
    an.team_name,
    an.analyst_level
FROM security_events se
JOIN alerts a
    ON se.event_id = a.event_id
JOIN analysts an
    ON a.analyst_id = an.analyst_id
WHERE an.analyst_level = 'Junior'
WITH CHECK OPTION;*/
/*SELECT * FROM junior_analyst_incidents;*/



/*SELECT
    event_id,
    source_ip,
    event_type,
    event_time,
    COUNT(
        CASE
            WHEN event_type IN ('Failed Login', 'Multiple Failed Logins')
            THEN 1
        END
    ) OVER (
        PARTITION BY source_ip
        ORDER BY event_time
    ) AS failed_login_count
FROM security_events
ORDER BY source_ip, event_time;*/


/*SELECT
    event_id,
    source_ip,
    event_type,
    event_time,
    LAG(event_time) OVER (
        PARTITION BY source_ip
        ORDER BY event_time
    ) AS previous_event_time
FROM security_events
ORDER BY source_ip, event_time;*/

/*SELECT
    event_id,
    source_ip,
    event_time,
    LAG(event_time) OVER (
        PARTITION BY source_ip
        ORDER BY event_time
    ) AS previous_event_time,
    TIMESTAMPDIFF(
        MINUTE,
        LAG(event_time) OVER (
            PARTITION BY source_ip
            ORDER BY event_time
        ),
        event_time
    ) AS time_gap_minutes
FROM security_events;*/




/*SELECT
    event_id,
    source_ip,
    severity,
    CASE
        WHEN severity = 'Critical' THEN 100
        WHEN severity = 'High' THEN 75
        WHEN severity = 'Medium' THEN 50
        ELSE 25
    END AS risk_score,
    DENSE_RANK() OVER (
        ORDER BY
        CASE
            WHEN severity = 'Critical' THEN 100
            WHEN severity = 'High' THEN 75
            WHEN severity = 'Medium' THEN 50
            ELSE 25
        END DESC
    ) AS incident_rank
FROM security_events;*/






