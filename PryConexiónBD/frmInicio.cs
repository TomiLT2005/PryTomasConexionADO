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

        //Instancias de clases//
        clsConexionBD conexion = new clsConexionBD();
        clsControles controles = new clsControles();


        //Variable para guardar el codigo seleccionado//
        public int codigoSeleccionado = 0;


        //Evento de carga del formulario//
        private void frmInicio_Load(object sender, EventArgs e)
        {
            conexion.ConectarBD();
            conexion.ListarBD(dgvDatos);
            conexion.Cargarcategorias(cmbCategoria);

        }

        //Evento para que haga foco en el txtNombre al abrir el formulario//
        private void frmInicio_Shown(object sender, EventArgs e)
        {
            txtNombre.Focus();
        }

        //Evento para salir del Sistema//
        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {

            DialogResult res = MessageBox.Show("¿Estás seguro de que deseas salir?", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (res == DialogResult.Yes)
            {
                this.Close();
            }
        }



        //Eventos de Botones (Agregar,Modificar, Eliminar y Buscar)//
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (validarCampos()) 
            {
                string Nombre = txtNombre.Text;
                string Descripcion = txtDesc.Text;
                decimal Precio = Convert.ToDecimal(txtPrecio.Text);
                int Stock = Convert.ToInt32(numStock.Value);
                int CategoriaId = Convert.ToInt32(cmbCategoria.SelectedValue);


                clsProducto nuevoproducto = new clsProducto(0, Nombre, Descripcion, Precio, Stock, CategoriaId);

                conexion.Agregar(nuevoproducto);
                conexion.ListarBD(dgvDatos);

                controles.LimpiarCampos(txtNombre, txtDesc, txtPrecio, numStock, cmbCategoria);

                btnModificar.Enabled = true;
                btnEliminar.Enabled = true;
            }
            else
            {
                MessageBox.Show("Por favor, complete todos los campos requeridos.", "Error de validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            

        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            clsProducto modificado = new clsProducto(
            codigoSeleccionado,
            txtNombre.Text,
            txtDesc.Text,
            Convert.ToDecimal(txtPrecio.Text),
            Convert.ToInt32(numStock.Value),
            Convert.ToInt32(cmbCategoria.SelectedValue));

            conexion.Modificar(modificado);
            conexion.ListarBD(dgvDatos);

            
            controles.LimpiarCampos(txtNombre, txtDesc, txtPrecio, numStock, cmbCategoria);
            codigoSeleccionado = 0; 

        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            DialogResult res = MessageBox.Show("¿Estás seguro de que deseas eliminar este producto?", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (res == DialogResult.Yes)
            {
                conexion.Eliminar(codigoSeleccionado);
                conexion.ListarBD(dgvDatos);

                controles.LimpiarCampos(txtNombre, txtDesc, txtPrecio, numStock, cmbCategoria);
                codigoSeleccionado = 0;
            }
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            string busqueda = txtBuscar.Text;
            conexion.BuscarporNombre(dgvDatos, busqueda);

            txtBuscar.Clear();
        }

        private void btnVolver_Click(object sender, EventArgs e)
        {
            conexion.ListarBD(dgvDatos);
            controles.LimpiarCampos(txtNombre, txtDesc, txtPrecio, numStock, cmbCategoria);
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            controles.LimpiarCampos(txtNombre, txtDesc, txtPrecio, numStock, cmbCategoria);

            txtNombre.Focus();
            conexion.ListarBD(dgvDatos);
            btnAgregar.Enabled = true;
            btnModificar.Enabled = false;
            btnEliminar.Enabled = false;
        }


        private void dgvDatos_CellClick(object sender, DataGridViewCellEventArgs f)
        {
            if (f.RowIndex >= 0)
            {
                DataGridViewRow fila = dgvDatos.Rows[f.RowIndex];

                codigoSeleccionado = Convert.ToInt32(fila.Cells["Codigo"].Value);

                txtNombre.Text = fila.Cells["Nombre"].Value.ToString();
                txtDesc.Text = fila.Cells["Descripcion"].Value.ToString();
                txtPrecio.Text = fila.Cells["Precio"].Value.ToString();
                numStock.Value = Convert.ToInt32(fila.Cells["Stock"].Value);
                cmbCategoria.SelectedValue = fila.Cells["CategoriaId"].Value;

                btnAgregar.Enabled = false;
                btnModificar.Enabled = true;
                btnEliminar.Enabled = true;
            }
        }

        //-------------------------------------------------*


        //Controles - Ingreso de Datos//
        private void txtNombre_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != ' ' && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Solo se permiten letras");
            }
        }

        private void txtDesc_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != ' ' && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Solo se permiten letras");
            }
        }

        private void txtPrecio_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Solo se permiten números.");
            }
        }



        private bool validarCampos()
        {
            bool error = false;
            epValidacion.Clear();

            if (string.IsNullOrWhiteSpace(txtNombre.Text))
            {
                epValidacion.SetError(txtNombre, "El Producto necesita un Nombre");
                txtNombre.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtDesc.Text))
            {
                epValidacion.SetError(txtDesc, "El Producto necesita una Descripción");
                txtDesc.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtPrecio.Text))
            {
                epValidacion.SetError(txtPrecio, "El Producto necesita un Precio");
                txtPrecio.Focus();
                return false;
            }

            if (numStock.Value == 0)
            {
                epValidacion.SetError(numStock, "Debe haber al menos un Producto en stock");
                numStock.Focus();
                return false;
            }

            if (cmbCategoria.SelectedIndex == -1)
            {
                epValidacion.SetError(cmbCategoria, "El Producto necesita una Categoría");
                cmbCategoria.Focus();
                return false;
            }

            return true;

        }


    }
}
