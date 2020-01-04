

import UIKit

class AddTripViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tripTextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        TripFunctions.creatTrip(tripModel: TripModel(title: tripTextField.text!))
        
        if let doneSaving = doneSaving{
            doneSaving()
        }
        dismiss(animated: true)
    }
}
