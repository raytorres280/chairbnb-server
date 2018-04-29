//
//  LoginViewController.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/15/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginPress(_ sender: Any) {
        //fix, check for email, valid with '@', and check for password.
//        if((self.email.text?.count)! > 0 && (self.password.text?.count)! > 0 && (self.email.text?.contains("@"))!) {
            login()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //check codeable for email and password
        // Do any additional setup after loading the view.
        
        
        //check for userId - if true present tabs, else stay on this screen
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func login() {
        print("logging in..")
        //if server response is okay, save email and password
        //cjgbs9ch600760131g366xhab
        apollo.perform(mutation: LoginMutation(email: "test@aol.com", password: "nooneknows")) { (result, err) in
            guard let userId = result?.data?.login.user.id else {
                return
            }
            self.saveUser(userId: userId)
            self.goToMainTabView()
        }
    }
    
    private func saveUser(userId: String!) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(userId, forKey: "userId")
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    private func goToMainTabView() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let main = storyboard.instantiateViewController(withIdentifier: "MainTabs") as! UIViewController
        present(main, animated: false, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
