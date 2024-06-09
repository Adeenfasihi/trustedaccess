INSERT INTO reboot2024.users (email, password, first_name, last_name, account_number, account_balance, created_at) VALUES 
('john.doe@example.com', 'password123', 'John', 'Doe', '1234567890', 1000.00, NOW()),
('jane.smith@example.com', 'password123', 'Jane', 'Smith', '2345678901', 1500.50, NOW()),
('alice.jones@example.com', 'password123', 'Alice', 'Jones', '3456789012', 2000.75, NOW()),
('bob.brown@example.com', 'password123', 'Bob', 'Brown', '4567890123', 1750.20, NOW());


INSERT INTO reboot2024.trusted_access (user_id, trusted_user_id, access_level) VALUES 
(1, 2, 'view'),
(1, 3, 'partial'),
(2, 1, 'full');


INSERT INTO reboot2024.login_details (user_id, login_time, logout_time, device_info) VALUES 
(1, NOW(), NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
(2, NOW(), NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
(3, NOW(), NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1'),
(4, NOW(), NULL, 'Mozilla/5.0 (Linux; Android 10; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Mobile Safari/537.36');


INSERT INTO reboot2024.transactions (user_id, amount, transaction_type, timestamp, description) VALUES 
(1, 100.00, 'deposit', NOW(), 'Initial deposit'),
(1, 50.00, 'withdrawal', NOW(), 'Grocery shopping'),
(2, 200.00, 'deposit', NOW(), 'Salary deposit'),
(3, 150.00, 'transfer', NOW(), 'Rent payment'),
(4, 75.00, 'withdrawal', NOW(), 'Utility bill payment'),
(1, 300.00, 'transfer', NOW(), 'Transfer to savings'),
(2, 100.00, 'withdrawal', NOW(), 'Online shopping'),
(3, 250.00, 'deposit', NOW(), 'Freelance work'),
(4, 125.00, 'transfer', NOW(), 'Transfer to family'),
(1, 80.00, 'withdrawal', NOW(), 'Restaurant dining');