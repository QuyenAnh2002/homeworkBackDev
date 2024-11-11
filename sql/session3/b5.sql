CREATE TABLE students (
    studentID INT PRIMARY KEY,
    studentName VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    courseID INT PRIMARY KEY,
    courseName VARCHAR(100) NOT NULL,
    instructor VARCHAR(50) NOT NULL
);
-- Thêm sinh viên vào bảng Students
INSERT INTO students (studentID, studentName, major) VALUES (1, 'Nguyen Van A', 'Computer Science');
INSERT INTO students (studentID, studentName, major) VALUES (2, 'Le Thi B', 'Business');
INSERT INTO students (studentID, studentName, major) VALUES (3, 'Tran Van C', 'Mathematics');
INSERT INTO students (studentID, studentName, major) VALUES (4, 'Pham Thi D', 'Engineering');

-- Thêm môn học vào bảng Courses
INSERT INTO courses (courseID, courseName, instructor) VALUES (1, 'Introduction to Programming', 'Dr. Smith');
INSERT INTO courses (courseID, courseName, instructor) VALUES (2, 'Calculus', 'Prof. Johnson');
INSERT INTO courses (courseID, courseName, instructor) VALUES (3, 'Physics', 'Dr. Brown');
-- Cập nhật tên môn học có CourseID = 2 thành 'Advanced Mathematics'
UPDATE courses
SET courseName = 'Advanced Mathematics'
WHERE courseID = 2;

-- Cập nhật chuyên ngành của sinh viên có StudentID = 3 thành 'Engineering'
UPDATE students
SET major = 'Engineering'
WHERE studentID = 3;
-- Xóa sinh viên với StudentID = 1 khỏi bảng Students
DELETE FROM students
WHERE studentID = 1;

-- Xóa môn học với CourseID = 3 khỏi bảng Courses
DELETE FROM courses
WHERE courseID = 3;
-- Lấy thông tin tất cả sinh viên từ bảng Students
SELECT * FROM students;

-- Lấy thông tin tất cả môn học từ bảng Courses
SELECT * FROM courses;
