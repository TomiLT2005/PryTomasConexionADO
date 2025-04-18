﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;
using PryConexiónBD;

namespace pryGestionInventario
{
    internal class clsConexionBD
    {
        //cadena de conexion
        string cadena = "Server = localhost\\SQLEXPRESS;Database=Comercio;Trusted_Connection=True;";

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

                MessageBox.Show("Conectado a la base de datos: '" + nombreBaseDeDatos + "'.", "Conexión exitosa", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception error)
            {
                MessageBox.Show("Ups... algo salió mal al intentar conectar con la base de datos. Por favor, revise su conexión e intente nuevamente.", "Conexión fallida", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }


        public void ListarBD(DataGridView Grilla)
        {
            try
            {
                using (SqlConnection conexion = new SqlConnection (cadena))
                {
                    conexion.Open();
                    string query = "SELECT * FROM Productos";

                    SqlCommand comando = new SqlCommand(query,conexion);
                    SqlDataAdapter adaptador = new SqlDataAdapter(comando);

                    DataTable tabla = new DataTable();
                    adaptador.Fill(tabla);
                    Grilla.DataSource = tabla;
                }

            }
            catch (Exception error)
            {
                MessageBox.Show("No se pudieron cargar los productos correctamente. Revise su conexión o intente más tarde.", "Error de carga", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
           
        }

        public void Cargarcategorias(ComboBox Combo)
        {
            try
            {
                using (SqlConnection conexion = new SqlConnection(cadena))
                {
                    conexion.Open();
                    string query = "SELECT Id, Nombre FROM Categorias";

                    SqlCommand comando = new SqlCommand(query, conexion);
                    SqlDataAdapter adaptador = new SqlDataAdapter(comando);

                    DataTable tabla = new DataTable();
                    adaptador.Fill(tabla);

                    Combo.DataSource = tabla;
                    Combo.DisplayMember = "Nombre";
                    Combo.ValueMember = "Id";
                }

            }
            catch (Exception error)
            {
                MessageBox.Show("Error al cargar categorías: " + error.Message);
            }
        }

        public void Agregar(clsProducto producto ) 
        {
            try
            {
                using (SqlConnection conexion = new SqlConnection(cadena))
                {
                    conexion.Open();
                    string query = "INSERT INTO Productos (Nombre, Descripcion, Precio, Stock, CategoriaId) VALUES (@nombre, @descripcion, @precio, @stock, @categoriaId)";

                    SqlCommand comando = new SqlCommand(query, conexion);
                    SqlDataAdapter adaptador = new SqlDataAdapter(comando);

                    comando.Parameters.AddWithValue("@nombre", producto.Nombre);
                    comando.Parameters.AddWithValue("@descripcion", producto.Descripcion);
                    comando.Parameters.AddWithValue("@precio", producto.Precio);
                    comando.Parameters.AddWithValue("@stock", producto.Stock);
                    comando.Parameters.AddWithValue("@categoriaId", producto.CategoriaId);
                    comando.ExecuteNonQuery();

                    MessageBox.Show("Producto agregado exitosamente.", "Éxito", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

            }
            catch (Exception error)
            {
                MessageBox.Show("Error al agregar producto: " + error.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
