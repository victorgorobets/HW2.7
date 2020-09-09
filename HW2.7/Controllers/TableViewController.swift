import UIKit

class TableViewController: UITableViewController {
    
    let personList = Person.createUniquePersonsList(number: 10)
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].fullname
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let person = personList[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: person)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let detailsVC = segue.destination as? DetailsViewController
            detailsVC!.personal = sender as? Person
        } else {
            
           // проблема видимо в этой передаче. В целевой контроллер (ListSectionsTableViewController) не передаются данные либо проблема с инициализацией переменной personList в ListSectionsTableViewController :(
            
            let topNavigationVC = segue.destination as! UINavigationController
            let tabBarVC = topNavigationVC.topViewController as! UITabBarController
            let navigationVC = tabBarVC.viewControllers?.last as! UINavigationController
            let destinationVC = navigationVC.viewControllers.first as! ListSectionsTableViewController
            destinationVC.personList = personList
        }
    }
}
