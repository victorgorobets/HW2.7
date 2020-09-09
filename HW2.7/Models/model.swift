struct Person {
    var name: String
    var surname: String
    var phone: String
    var email: String
    
    var fullname: String {
        name + " " + surname
    }
}

extension Person {
    static func createUniquePersonsList(number: Int) -> [Person] {
        
        let new = DataManager()
        var personsList = [Person]()
        
        var count = number
        if count > new.namesList.count {count = new.namesList.count}
        for _ in 1...count {
            let getName = new.namesList.randomElement()!
            new.namesList.remove(at: new.namesList.firstIndex(of: getName)!)
            let getSurName = new.surnamesList.randomElement()!
            new.surnamesList.remove(at: new.surnamesList.firstIndex(of: getSurName)!)
            let getPhone = new.phoneList.randomElement()!
            new.phoneList.remove(at: new.phoneList.firstIndex(of: getPhone)!)
            let getEmail = new.emailList.randomElement()!
            new.emailList.remove(at: new.emailList.firstIndex(of: getEmail)!)
            
            let newPerson = Person(name: getName, surname: getSurName, phone: getPhone, email: getEmail)
            personsList.append(newPerson)
        }
        return personsList
    }
}

class DataManager {
    
    var namesList = [
        "ALEXANDER",
        "ALFIE",
        "AMELIA",
        "ARCHIE",
        "AVA",
        "CHARLIE",
        "CHARLOTTE",
        "CHLOE",
        "DAISY",
        "DANIEL",
        "ELLA",
        "EMILY",
        "ETHAN",
        "EVIE",
        "FREYA"
    ]
    var surnamesList = [
        "Smith",
        "Johnson",
        "Williams",
        "Jones",
        "Brown",
        "Davis",
        "Miller",
        "Wilson",
        "Moore",
        "Taylor",
        "Anderson",
        "Thomas",
        "Jackson",
        "White",
        "Harris"]
    
    var phoneList: [String] = (0..<15).map { _ in String(Int.random(in: 100000000...999999999))}
    
    var emailList = [
        "1@yandex.ru",
        "2@yandex.ru",
        "3@yandex.ru",
        "4@yandex.ru",
        "5@yandex.ru",
        "6@yandex.ru",
        "7@yandex.ru",
        "8@yandex.ru",
        "9@yandex.ru",
        "10@yandex.ru",
        "11@yandex.ru",
        "12@yandex.ru",
        "13@yandex.ru",
        "14@yandex.ru",
        "15@yandex.ru"
        ]
}

