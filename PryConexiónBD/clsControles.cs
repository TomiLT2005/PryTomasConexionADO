using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PryConexiónBD
{
    public class clsControles
    {
        public void ValidarCampos(TextBox txtNombre, TextBox txtDesc, TextBox txtPrecio, NumericUpDown numStock, ComboBox cmbCategoria)
        {

            // Validación del campo Nombre
            if (string.IsNullOrWhiteSpace(txtNombre.Text))
            {
                MessageBox.Show("El campo Nombre es obligatorio.");
                txtNombre.Focus();
                return; // Detenemos el flujo
            }

            // Validación del campo Descripción
            if (string.IsNullOrWhiteSpace(txtDesc.Text))
            {
                MessageBox.Show("El campo Descripción es obligatorio.");
                txtDesc.Focus();
                return; // Detenemos el flujo
            }

            // Validación del campo Precio
            if (string.IsNullOrWhiteSpace(txtPrecio.Text))
            {
                MessageBox.Show("El campo Precio es obligatorio.");
                txtPrecio.Focus();
                return; // Detenemos el flujo
            }

            if (!decimal.TryParse(txtPrecio.Text, out _))
            {
                MessageBox.Show("El campo Precio debe ser un número válido.");
                txtPrecio.Focus();
                return; // Detenemos el flujo
            }

            // Validación del campo Stock
            if (numStock.Value == 0)
            {
                MessageBox.Show("Debe ingresar un stock mayor a 0.");
                numStock.Focus();
                return; // Detenemos el flujo
            }

            // Validación del campo Categoría
            if (cmbCategoria.SelectedIndex == -1)
            {
                MessageBox.Show("Debe seleccionar una categoría.");
                cmbCategoria.Focus();
                return; // Detenemos el flujo
            }

        }

        public void LimpiarCampos(TextBox txtNombre, TextBox txtDesc, TextBox txtPrecio, NumericUpDown numStock, ComboBox cmbCategoria)
        {
            txtNombre.Clear();
            txtDesc.Clear();
            txtPrecio.Clear();
            numStock.Value = 0;
            cmbCategoria.SelectedIndex = 0;
        }



    }
    
}
