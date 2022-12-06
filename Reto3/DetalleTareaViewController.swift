//
//  DetalleTareaViewController.swift
//  Reto3
//
//  Created by Duwal Abel Varillas Castro on 6/12/22.
//

import UIKit

class DetalleTareaViewController: UIViewController {

    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var prioridadLabel: UILabel!
    
    @IBOutlet weak var descripcionLabel: UILabel!
    
    
    @IBAction func editarTarea(_ sender: Any) {
        guard let editarTareaStoryboardID = storyboard?.instantiateViewController(withIdentifier: "editarTareaStoryboardID") as? EditarTareaViewController else{
            return
        }
        editarTareaStoryboardID.tarea = self.tarea
        editarTareaStoryboardID.delegate = listadoTareaDelegate
        navigationController?.pushViewController(editarTareaStoryboardID, animated: true)
    }
    
    var tarea: Tarea?
    var listadoTareaDelegate: TareasViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        montarDatos()
    }
   
    func montarDatos(){
        if let _ = tarea {
            tituloLabel.text = tarea!.titulo
            prioridadLabel.text = String(tarea!.prioridad)
            descripcionLabel.text = tarea!.descripcion
        }
    }
}
