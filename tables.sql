-- Создание таблицы для секций зоопарка
CREATE TABLE Sections (
    id SERIAL PRIMARY KEY,       
    name VARCHAR(50) NOT NULL,   
    description TEXT           
);

-- Создание таблицы для животных
CREATE TABLE Animals (
    id SERIAL PRIMARY KEY,       
    name VARCHAR(50) NOT NULL,   
    species VARCHAR(50) NOT NULL, 
    age INT CHECK (age >= 0),    
    section_id INT NOT NULL,     
    FOREIGN KEY (section_id) REFERENCES Sections(id) ON DELETE CASCADE
);

-- Создание таблицы для сотрудников
CREATE TABLE Employees (
    id SERIAL PRIMARY KEY,      
    name VARCHAR(100) NOT NULL,  -- Имя сотрудника
    position VARCHAR(50),        -- Должность (например, "Ветеринар", "Уборщик")
    salary INT CHECK (salary > 0), -- Зарплата
    section_id INT,              -- ID секции, в которой работает сотрудник
    FOREIGN KEY (section_id) REFERENCES Sections(id) ON DELETE SET NULL
);

-- Создание таблицы для посетителей
CREATE TABLE Tickets (
    id SERIAL PRIMARY KEY,       
    number INT UNIQUE NOT NULL,           
    visit_date DATE NOT NULL,    
    ticket_price INT NOT NULL CHECK (ticket_price > 0),
    section_id INT,
    FOREIGN KEY (section_id) REFERENCES Sections(id) ON DELETE SET NULL
);

-- Создание таблицы для кормления животных
CREATE TABLE Feeding (
    id SERIAL PRIMARY KEY,       
    animal_id INT NOT NULL,      
    employee_id INT NOT NULL,    
    food VARCHAR(100) NOT NULL,  -- Тип корма (например, "Мясо", "Фрукты")
    FOREIGN KEY (animal_id) REFERENCES Animals(id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES Employees(id) ON DELETE SET NULL
);
