import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var personal: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = personal.fullname
        phoneLabel.text = "Phone: " + personal.phone
        emailLabel.text = "E-mail: " + personal.email
    }
}
