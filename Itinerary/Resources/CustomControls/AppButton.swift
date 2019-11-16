
import UIKit

class AppButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
        
        
    }

}
