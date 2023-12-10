import Foundation

class Teacher {
    private var id: Int
    private var firstName: String
    private var lastName: String
    private var subjectsTaught: [Subject]
    private var studentsTaught: [Student]
    
    init(id: Int, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.subjectsTaught = []
        self.studentsTaught = []
    }
    
    func addSubjectTaught(_ subject: Subject) {
        self.subjectsTaught.append(subject)
    }
 
    func addStudentTaught(_ student: Student) {
        self.studentsTaught.append(student)
    }
 
    func setGrade(for student: Student, subjectName: String, grade: String) {
        let studentIndex = studentsTaught.firstIndex { st in
            return st.id == student.id
        }
        guard let unwrapperIndex = studentIndex else {
            print("This is not your student")
            return
        }
        
        
        
        studentsTaught[unwrapperIndex].setGrade(subjectName: subjectName, grade: grade) {
            print("\(student.id) \(student.name) \(student.lastName) \(subjectName) \(grade) \(self.firstName) \(self.lastName)")
        }
    }
    
    func getInfo() {
        let fullname = "\(firstName) \(lastName)"
        let subjectsList = subjectsTaught.map { s in
            return s.subjectName
        }.joined(separator: ", ")
        print(fullname + " taught " + (subjectsList.count != 0 ?  subjectsList : "zero subjects"))
    }
    
    
}
