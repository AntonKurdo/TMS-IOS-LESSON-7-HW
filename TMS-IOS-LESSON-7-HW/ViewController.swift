import UIKit

class ViewController: UIViewController {
    
    let subjects: [Subject] = [Subject(subjectName: "Math"), Subject(subjectName: "English"), Subject(subjectName: "History"), Subject(subjectName: "Biology"), Subject(subjectName: "Programming"), Subject(subjectName: "Literature")]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // teacher1 creation and setting up
        let teacher1 = Teacher(id: 1, firstName: "May", lastName: "Tay")
        teacher1.addSubjectTaught(subjects[0])
        teacher1.addSubjectTaught(subjects[2])
        teacher1.addSubjectTaught(subjects[5])
        teacher1.getInfo()
        
        // student1 creation and setting up
        let student1 = Student(id: 1, name: "John", lastName: "Lenon", age: 14)
        student1.addSubject(subjects[0])
        student1.addSubject(subjects[2])
        student1.addSubject(subjects[5])
        student1.studentInfo()
        
        
        // student2 creation and setting up
        let student2 = Student(id: 2, name: "Harry", lastName: "Potter", age: 12)
        student2.addSubject(subjects[1])
        student2.addSubject(subjects[3])
        student2.addSubject(subjects[2])
        student2.studentInfo()
        
        teacher1.addStudentTaught(student1)
        teacher1.addStudentTaught(student2)
        
        
        
        // Grading
        teacher1.setGrade(for: student1, subjectName: subjects[2].subjectName, grade: "B+")
        teacher1.setGrade(for: student2, subjectName: subjects[1].subjectName, grade: "A+")
        
        // getting info
        student2.studentInfo()
    }


}

