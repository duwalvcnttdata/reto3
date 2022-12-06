//
//  EditarTareaViewController.swift
//  Reto3
//
//  Created by Duwal Abel Varillas Castro on 6/12/22.
//

import UIKit

class EditarTareaViewController: UIViewController {
    
    
    @IBOutlet weak var tituloTextField: UITextField!
    
    @IBOutlet weak var prioridadTextField: UITextField!
    
    @IBOutlet weak var descripcionTextField: UITextField!
    
    var tarea: Tarea?
    
    var nuevoId: Int?
    
    var delegate: EditarTareaViewControllerDelegate?
    
    @IBAction func guardaTarea(_ sender: UIButton) {
        let titulo = tituloTextField.text ?? ""
        let descripcion = descripcionTextField.text ?? ""
        let prioridad = prioridadTextField.text ?? ""
        let nuevaTarea = Tarea(id: tarea?.id ?? nuevoId!, titulo: titulo, descripcion: descripcion, prioridad: Int(prioridad) ?? 0)
        
        delegate?.guardarTarea(tarea: nuevaTarea)
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        montarDatos()
    }
    
    func montarDatos(){
        if let _ = tarea {
            tituloTextField.text = tarea?.titulo
            prioridadTextField.text = String(tarea!.prioridad)
            descripcionTextField.text = tarea?.descripcion
        }
    }

}

protocol EditarTareaViewControllerDelegate {
    func guardarTarea(tarea: Tarea)
}
