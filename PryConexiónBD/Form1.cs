using pryGestionInventario;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PryConexiónBD
{
    public partial class frmInicio : Form
    {
        public frmInicio()
        {
            InitializeComponent();
        }

        clsConexionBD conexion = new clsConexionBD();

        private void frmInicio_Load(object sender, EventArgs e)
        {
            conexion.ConectarBD();
            conexion.ListarBD(dgvDatos);
            conexion.Cargarcategorias(cmbCategoria);

            
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {

            string Nombre = txtNombre.Text;
            string Descripcion = txtDesc.Text;
            decimal Precio = Convert.ToDecimal(txtPrecio.Text);
            int Stock = Convert.ToInt32(numStock.Value);
            int CategoriaId = Convert.ToInt32(cmbCategoria.SelectedValue);


            clsProducto nuevoproducto = new clsProducto(Nombre, Descripcion, Precio, Stock, CategoriaId);

            conexion.Agregar(nuevoproducto);
            conexion.ListarBD(dgvDatos);

            txtNombre.Clear();
            txtDesc.Clear();
            txtPrecio.Clear();
            numStock.Value = 0;
            cmbCategoria.SelectedIndex = 0;

            btnModificar.Enabled = true;
            btnEliminar.Enabled = true;
             
        }
    }
}
