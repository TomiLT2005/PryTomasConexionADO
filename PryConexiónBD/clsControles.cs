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
        public void ValidarVacios(TextBox txt, string Nombrecampo)
        {
            if (txt.Text == "")
            {
                MessageBox.Show($"El campo '{Nombrecampo}' está vacío.", "Campo requerido", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txt.Focus();
            }
        }
        
        public void ValidarVacios(NumericUpDown num, string Nombrecampo)
        {
            if (num.Value > 0)
            {
                MessageBox.Show($"El campo '{Nombrecampo}' está vacío. Al menos debe tener un producto disponible", "Campo vacío", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                num.Focus();
            }
        }

        public void ValidarVacios(ComboBox cmb)
        {
            if (cmb.SelectedIndex == -1)
            {
                MessageBox.Show("Seleccione una Opción", "Campo vacío", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                cmb.Focus();
            }
        }



    }
}
