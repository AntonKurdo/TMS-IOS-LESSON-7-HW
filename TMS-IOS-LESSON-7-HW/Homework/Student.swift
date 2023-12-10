import Foundation

class Student {
    var id: Int
    var name: String
    var lastName: String
    var age: Int
    private var subjects: [Subject]
    private var teacher: Teacher?
    
    init(id: Int, name: String, lastName: String, age: Int) {
        self.id = id
        self.name = name
        self.lastName = lastName
        self.age = age
        self.subjects = []
    }

    
    func addSubject(_ subject: Subject) {
        self.subjects.append(subject)
    }
  
    private func upadteAge(_ age: Int) {
        self.age = age
    }
    
    private func updateStudentName(firstname: String, lastname: String) {
        self.name = firstname
        self.lastName = lastname
    }
    
    func addTeacher(_ teacher: Teacher) {
        self.teacher = teacher
    }
    
    func setGrade(subjectName: String, grade: String, completion: () -> ()) {
        let index = subjects.firstIndex { sub in
            return sub.subjectName == subjectName
        }
        guard let unwrappedIndex = index else {
            print("There is no such subject to set the grade")
            return
        }
        subjects[unwrappedIndex].updateGrade(grade: grade)
        completion()
    }
    
    
    func getGrade(subjectName: String) {
        let index = subjects.firstIndex { sub in
            return sub.subjectName == subjectName
        }
        guard let unwrappedIndex = index else {
            print("\(self.name) \(self.lastName) does not attend \(subjectName)")
            return
        }
      
        print("\(self.name) \(self.lastName) - \(subjectName) - (\(subjects[unwrappedIndex].grade != nil ? String(subjects[unwrappedIndex].grade! ): "No grades")")
    }
    
    func studentInfo() { 
        let fullname = "\(name) \(lastName)"
        let subjectsList = subjects.map { s in
            return "\(s.subjectName)(\(s.grade ?? "no grade"))"
        }.joined(separator: ", ")
        print(fullname + "(\(String(age)) years old)" + " attends " + (subjectsList.count != 0 ?  subjectsList : "zero subjects"))
    }
}
