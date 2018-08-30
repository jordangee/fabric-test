import UIKit
import Crashlytics

class ViewController: UIViewController {
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Next View", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        CLSLogv("%@", getVaList(["VC 1 init"]))
        button.addTarget(self, action: #selector(goToNextView), for: .touchUpInside)
        view.backgroundColor = .white
        view.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillLayoutSubviews() {
        button.sizeToFit()
        button.frame.origin = CGPoint(x: view.center.x - (button.frame.width/2), y: view.center.y)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func goToNextView() {
        CLSLogv("%@", getVaList(["goToNextView call"]))
        present(SecondViewController(), animated: true, completion: nil)
    }
}
