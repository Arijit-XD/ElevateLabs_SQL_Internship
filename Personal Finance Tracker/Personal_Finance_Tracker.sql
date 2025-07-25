CREATE TABLE PF_Users (
    pf_user_id INT AUTO_INCREMENT PRIMARY KEY,
    pf_user_name VARCHAR(100) NOT NULL,
    pf_email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE PF_Categories (
    pf_category_id INT AUTO_INCREMENT PRIMARY KEY,
    pf_category_name VARCHAR(50) NOT NULL
);

CREATE TABLE PF_Income (
    pf_income_id INT AUTO_INCREMENT PRIMARY KEY,
    pf_user_id INT NOT NULL,
    pf_amount DECIMAL(12,2) NOT NULL,
    pf_source VARCHAR(100),
    pf_received_date DATE NOT NULL,
    FOREIGN KEY (pf_user_id) REFERENCES PF_Users(pf_user_id)
);

CREATE TABLE PF_Expenses (
    pf_expense_id INT AUTO_INCREMENT PRIMARY KEY,
    pf_user_id INT NOT NULL,
    pf_category_id INT NOT NULL,
    pf_amount DECIMAL(12,2) NOT NULL,
    pf_description VARCHAR(255),
    pf_expense_date DATE NOT NULL,
    FOREIGN KEY (pf_user_id) REFERENCES PF_Users(pf_user_id),
    FOREIGN KEY (pf_category_id) REFERENCES PF_Categories(pf_category_id)
);

INSERT INTO PF_Users (pf_user_name, pf_email) VALUES
('Ishaan Bendre', 'ishaan.bendre@sample.com'),
('Prerana Sidhu', 'prerana.sidhu@sample.com'),
('Anayit Deshmukh', 'anayit.deshmukh@sample.com');

INSERT INTO PF_Categories (pf_category_name) VALUES
('Groceries'), ('Rent'), ('Transport'), ('Festivals'), ('Healthcare');

INSERT INTO PF_Income (pf_user_id, pf_amount, pf_source, pf_received_date) VALUES
(1, 57000.00, 'Private Job', '2025-07-01'),
(1, 4500.00, 'Blogging', '2025-07-13'),
(2, 83500.00, 'Consulting', '2025-07-03'),
(3, 72000.00, 'Teaching', '2025-07-05');

INSERT INTO PF_Expenses (pf_user_id, pf_category_id, pf_amount, pf_description, pf_expense_date) VALUES
(1, 1, 1800.00, 'Sparsh Mart', '2025-07-02'),
(1, 2, 14350.00, 'Monthly House Rent', '2025-07-01'),
(1, 3, 1200.00, 'Auto fare', '2025-07-10'),
(1, 4, 4600.00, 'Rakhi festival gifts', '2025-07-15'),
(1, 5, 3000.00, 'Medicines', '2025-07-12'),
(2, 1, 2200.00, 'Bazaar Shopping', '2025-07-04'),
(2, 2, 19000.00, 'Rent', '2025-07-02'),
(2, 5, 750.00, 'Doctor Visit', '2025-07-22'),
(3, 1, 1750.00, 'Farm Fresh Store', '2025-07-12'),
(3, 3, 990.00, 'Bus and petrol', '2025-07-06');

SELECT
    u.pf_user_id,
    u.pf_user_name,
    MONTH(i.pf_received_date) AS month_num,
    SUM(i.pf_amount) AS total_income,
    IFNULL(SUM(
        (SELECT SUM(e.pf_amount)
         FROM PF_Expenses e
         WHERE e.pf_user_id = u.pf_user_id
           AND MONTH(e.pf_expense_date) = MONTH(i.pf_received_date)
        )
    ), 0) AS total_expenses
FROM PF_Users u
JOIN PF_Income i ON u.pf_user_id = i.pf_user_id
GROUP BY u.pf_user_id, u.pf_user_name, MONTH(i.pf_received_date);

SELECT
    u.pf_user_id,
    u.pf_user_name,
    c.pf_category_name,
    SUM(e.pf_amount) AS total_spent
FROM PF_Expenses e
JOIN PF_Categories c ON e.pf_category_id = c.pf_category_id
JOIN PF_Users u ON e.pf_user_id = u.pf_user_id
WHERE MONTH(e.pf_expense_date) = 7
GROUP BY u.pf_user_id, u.pf_user_name, c.pf_category_name
ORDER BY u.pf_user_id, total_spent DESC;

SELECT
    u.pf_user_id,
    u.pf_user_name,
    IFNULL((SELECT SUM(pf_amount) FROM PF_Income WHERE pf_user_id = u.pf_user_id), 0)
      -
    IFNULL((SELECT SUM(pf_amount) FROM PF_Expenses WHERE pf_user_id = u.pf_user_id), 0) AS current_balance
FROM PF_Users u;