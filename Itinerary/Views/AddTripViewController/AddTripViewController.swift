

import UIKit
import Photos

class AddTripViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tripTextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    var doneSaving: (() -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        imageView.layer.cornerRadius = 10
        
        //dropshadow on title
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
    
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        tripTextField.rightViewMode = .never
        
        guard tripTextField.text != "", let newTripName = tripTextField.text else {
//            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
//            imageView.image = #imageLiteral(resourceName: "FAB")
//            imageView.contentMode = .scaleAspectFit
//
//            tripTextField.rightView = imageView
            //ALTERNATIVES
//            tripTextField.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
           
            tripTextField.layer.borderColor = UIColor.red.cgColor
            tripTextField.layer.borderWidth = 1
            tripTextField.layer.cornerRadius = 5
            tripTextField.placeholder = "TRIP NAME REQUIRED !!!!!!!"
            
            tripTextField.rightViewMode = .always
            return
        }
        TripFunctions.creatTrip(tripModel: TripModel(title: newTripName, image: self.imageView.image))
        
        if let doneSaving = doneSaving{
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    
    fileprivate func presentPhotoPickerController() {
        DispatchQueue.main.async {
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true)
        }
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    self.presentPhotoPickerController()
                    
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                        self.presentPhotoPickerController()
                    }
                
                case .restricted:
                    let alert = UIAlertController(title: "Photo librabry restricted", message: "Unable to access", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                    
                case .denied:
                    DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Denied", message: "Photos access was previously denied go to Settings", preferredStyle: .alert)
                    let settingsAction = UIAlertAction(title: "Go to settings", style: .default){
                        (action) in
                        
                            let url = URL(string: UIApplication.openSettingsURLString)!
                            UIApplication.shared.open(url, options: [ : ])
                        }
            
                    alert.addAction(settingsAction)
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true)
                    }
            }
        }
    }
}

}
extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            self.imageView.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

