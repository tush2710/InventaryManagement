//
//  ViewController.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import UIKit

struct Wrapper<T> {
    var value: T
}

protocol Printable {
    func printValue()
}


extension Wrapper: Printable where T: CustomStringConvertible{
    func printValue() {
        print(value.description)
    }
}
class BaseViewController: UIViewController {
    struct Person {
        var name: String
        var age: Int
    }

    let nameKeyPath = \Person.name
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //Simple alert message
    func alertMssg(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertWithOneHandler(title: String, message: String, withCompletionHandler completionHandler: @escaping ((_ success: Bool) -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
            (_)in
            completionHandler(true)
        })
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func sum(numbers: Int...) -> Int {
        return numbers.reduce(0, +)
    }
}


