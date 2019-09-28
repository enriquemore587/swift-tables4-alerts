//
//  ShowViewController.swift
//  App13
//
//  Created by ENRIQUE VERGARA  on 9/27/19.
//  Copyright © 2019 ENRIQUE VERGARA . All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    @IBOutlet weak var imagen: UIImageView!
    var nombreImagen : String!
    var mainView : ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.prefersLargeTitles = true
        title = nombreImagen
        imagen.image = UIImage(named: nombreImagen)
    }
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.isHidden = false
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        navigationController?.navigationBar.isHidden = false
//    }
    @IBAction func closeImageModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func eliminaImg(_ sender: UIButton) {
        let cancelClousure = { ( action : UIAlertAction! ) -> Void in
            print("Boton cancelar")
        }
        
        let alerta = UIAlertController(title: "Eliminar", message: "Estas seguro", preferredStyle: .alert)
        
        let cancelarAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: cancelClousure)
        
        let borrarAction = UIAlertAction(title: "Borrar", style: .default) { (action) in
            self.mainView.images.remove(at: self.mainView.imagePos)
            self.dismiss(animated: true, completion: nil)
            self.mainView.tableView.reloadData()
        }
        alerta.addAction(cancelarAction)
        alerta.addAction(borrarAction)
        present(alerta, animated: true)
    }
}
