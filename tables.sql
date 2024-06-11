CREATE TABLE reboot2024.users (
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    account_number BIGINT NOT NULL UNIQUE,
    account_balance FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reboot2024.trusted_access (
    trust_id BIGINT AUTO_INCREMENT UNIQUE,
    user_id BIGINT NOT NULL,
    trusted_user_id BIGINT NOT NULL,
    access_level ENUM('none', 'view', 'partial', 'full') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (trusted_user_id) REFERENCES users(user_id),
    PRIMARY KEY (user_id, trusted_user_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reboot2024.login_details (
    login_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    logout_time TIMESTAMP,
    device_info TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


CREATE TABLE reboot2024.transactions (
    transaction_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    amount FLOAT NOT NULL,
    transaction_type ENUM('deposit', 'withdrawal', 'transfer') NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id) 
)
-- users and login:

--     One-to-Many relationship: Each user can have multiple login records.

-- users and transactions:

--     One-to-Many relationship: Each user can have multiple transactions.

--  +-------------------+            +--------------------+
--  |      users        |            |   trusted_access   |
--  +-------------------+            +--------------------+
--  | user_id (PK)      |<---------+ | trust_id (U)       |
--  | email (U)         |          | | user_id (PK)       |
--  | password          |          +-| trusted_user_id(PK)|
--  | first_name        |            | access_level       |
--  | last_name         |            +--------------------+
--  | account_number (U)|            
--  | account_balance   |
--  | created_at        |
--  +-------------------+
--            |
--            v
--  +-------------------+            +--------------------+
--  |      login        |            |   transactions     |
--  +-------------------+            +--------------------+
--  | login_id (PK)     |            | transaction_id (PK)|
--  | user_id (FK)      |<-------+   | user_id (FK)       |
--  | login_time        |        |   | amount             |
--  | logout_time       |        +---| transaction_type   |
--  | device_info       |            | timestamp          |
--  +-------------------+            | description        |
--                                   +--------------------+