CREATE TABLE IF NOT EXISTS services (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'active',
    last_check TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO services (name, status) VALUES 
    ('Simple One API', 'active'),
    ('PostgreSQL', 'active'),
    ('GitLab Runner', 'active'),
    ('Frontend Proxy', 'active')
ON CONFLICT DO NOTHING;