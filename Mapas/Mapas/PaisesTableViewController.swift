//
//  PaisesTableViewController.swift
//  Mapas
//
//  Created by Diego Lopez on 26/10/20.
//

import UIKit
import MapKit

class PaisesTableViewController: UITableViewController {
    @IBOutlet weak var txtPais: UILabel!
    //@IBOutlet weak var mapa: MKMapView!
    
    
    var colorCelda:Bool=true
    
    var paises:[UITableViewCell] = []
    var nombresPaises:[String] = ["London","Oslo","Paris","Roma"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //mapa.addAnnotation(London)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        llenarTabla()
    }

    // MARK: - Table view data source
    
    func llenarTabla(){
        for i in 0..<nombresPaises.count{
            let celda = UITableViewCell()
            celda.textLabel?.text = nombresPaises[i]
            //celda.backgroundColor=#colorLiteral(red: 0.9302589297, green: 0.3793744147, blue: 0.1216867939, alpha: 1)
            if colorCelda == true{
                celda.backgroundColor=#colorLiteral(red: 1, green: 0.5960784314, blue: 0, alpha: 1)
                colorCelda=false
            }else{
                celda.backgroundColor=#colorLiteral(red: 1, green: 0.6549019608, blue: 0.1490196078, alpha: 1)
                colorCelda=true
            }
            paises.append(celda)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return paises.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let cell=paises[indexPath.row]
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "mapaId") as? MapaViewController
        myVC?.myCiudad = indexPath.row
        
        
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   
    

}
