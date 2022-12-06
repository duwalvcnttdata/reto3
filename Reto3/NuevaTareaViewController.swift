//
//  NuevaTareaViewController.swift
//  Reto3
//
//  Created by Duwal Abel Varillas Castro on 6/12/22.
//

import UIKit

class NuevaTareaViewController: UIViewController {

    @IBOutlet weak var tituloTextField: UITextField!
    
    @IBOutlet weak var prioridadTextField: UITextField!
    
    @IBOutlet weak var descripcionTextField: UITextField!
    
    var nuevoId: Int?
    
    var delegate: NuevaTareaViewControllerDelegate?
   
    
    
    @IBAction func guardarNuevaTareaButton(_ sender: UIButton) {
        let titulo = tituloTextField.text ?? ""
        let descripcion = descripcionTextField.text ?? ""
        let prioridad = prioridadTextField.text ?? ""
        let nuevaTarea = Tarea(id: nuevoId!, titulo: titulo, descripcion: descripcion, prioridad: Int(prioridad) ?? 0)
        
        delegate?.agregarNuevaTarea(tarea: nuevaTarea)
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

protocol NuevaTareaViewControllerDelegate {
    func agregarNuevaTarea(tarea: Tarea)
}
