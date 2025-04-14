using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;

namespace pryGestionInventario
{
    internal class clsConexionBD
    {
        //cadena de conexion
        string cadena = "Server = localhost\\SQLEXPRESS;Database=Ventas2;Trusted_Connection=True;";

        //"Server=localhost;Database=Ventas2;Trusted_Connection=True;";//

        //conector
        SqlConnection conexion;

        //comando
        SqlCommand comando;

        public string nombreBaseDeDatos;


        public void ConectarBD()
        {
            try
            {
                conexion = new SqlConnection(cadena);

                nombreBaseDeDatos = conexion.Database;

                conexion.Open();
                
                MessageBox.Show("Conectado a " + nombreBaseDeDatos);
            }
            catch (Exception error)
            {
                MessageBox.Show("Tiene un errorcito - " + error.Message);
            }     

        }


        public void MostrarBD(DataGridView Grilla)
        {
            try
            {
                using (SqlConnection conexion = new SqlConnection(cadena))
                {
                    string consulta = "SELECT * FROM Contactos";
                    SqlCommand comando = new SqlCommand(consulta, conexion);
                    SqlDataAdapter adaptador = new SqlDataAdapter(comando);
                    DataTable tabla = new DataTable();

                    conexion.Open();
                    adaptador.Fill(tabla);

                    Grilla.DataSource = tabla;
                }

            }
            catch (Exception error)
            {
                MessageBox.Show("Error: " + error.Message);
            }
            finally
            {
                if (conexion.State == ConnectionState.Open)
                {
                    conexion.Close();
                }
            }
        }
        
    }
}
