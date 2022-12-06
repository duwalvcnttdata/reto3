//
//  ViewController.swift
//  Reto3
//
//  Created by Duwal Abel Varillas Castro on 6/12/22.
//

import UIKit

class TareasViewController: UIViewController {
    
    var listaTareas = [
        Tarea(id: 1, titulo: "titulo 1", descripcion: "descripcion 1", prioridad: 1),
        Tarea(id: 2, titulo: "titulo 2", descripcion: "descripcion 2", prioridad: 2),
        Tarea(id: 3, titulo: "titulo 3", descripcion: "descripcion 3", prioridad: 3),
        Tarea(id: 4, titulo: "titulo 4", descripcion: "descripcion 4", prioridad: 4)
    ]

    @IBAction func agregarTareaButton(_ sender: UIButton) {
        guard let nuevaTareaStoryboardID = storyboard?.instantiateViewController(withIdentifier: "nuevaTareaStoryboardID") as? NuevaTareaViewController else{
            return
        }
        nuevaTareaStoryboardID.nuevoId = listaTareas.count + 1
        nuevaTareaStoryboardID.delegate = self
        navigationController?.pushViewController(nuevaTareaStoryboardID, animated: true)
    }
    
    @IBOutlet weak var tareaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tareaTableView.dataSource = self
        tareaTableView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

}

extension TareasViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaTareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tareaIdentifier", for: indexPath) as? TareaCeldaTableViewCell else {
            return TareaCeldaTableViewCell()
        }
        cell.tarea = listaTareas[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detalleTareaStoryboard = storyboard?.instantiateViewController(withIdentifier: "detalleTareaStoryboardID") as? DetalleTareaViewController else{
            return
        }
        detalleTareaStoryboard.tarea = listaTareas[indexPath.row]
        detalleTareaStoryboard.listadoTareaDelegate = self
        navigationController?.pushViewController(detalleTareaStoryboard, animated: true)
    }
    
}

extension TareasViewController: EditarTareaViewControllerDelegate{
    func guardarTarea(tarea: Tarea) {
        
        if let index = listaTareas.firstIndex(where: { tareaSeleccionada in
            return tareaSeleccionada.id == tarea.id
        }){
            listaTareas[index] = tarea
            tareaTableView.reloadData()
        }

    }
    
}

extension TareasViewController: NuevaTareaViewControllerDelegate{
    func agregarNuevaTarea(tarea: Tarea) {
        listaTareas.append(tarea)
        tareaTableView.reloadData()
    }
    
}
