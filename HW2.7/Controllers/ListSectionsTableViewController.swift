import UIKit

class ListSectionsTableViewController: UITableViewController {
    
    // эта переменная не получает из класса TableViewController данные и не инициализируется.
    //   исходная переменная:
   //    var personList: [Person]!
    
    // сгенерирован новый массив для проверки работоспособности второго окна.
    var personList = Person.createUniquePersonsList(number: 10)
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        personList[section].fullname
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listWithSection", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = personList[indexPath.section].phone
            cell.imageView?.image = UIImage(systemName: "phone")
            
        case 1:
            cell.textLabel?.text = personList[indexPath.section].email
            cell.imageView?.image = UIImage(systemName: "tray")
        default: break
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let person = personList[indexPath.section]
        performSegue(withIdentifier: "showDetails1", sender: person)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails1" {
            let detailsVC = segue.destination as? DetailsViewController
            detailsVC!.personal = sender as? Person
        }
    }
}
