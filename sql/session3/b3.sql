CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Major NVARCHAR(50) NOT NULL
);
INSERT INTO Students (StudentID, Name, Age, Major)
VALUES 
    (1, 'Alice', 20, 'Computer Science'),
    (2, 'Bob', 22, 'Mathematics'),
    (3, 'Charlie', 21, 'Physics');
DELETE FROM Students
WHERE StudentID = 1;
