using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp_Honda_Fateme_Feraghialishah
{
    public partial class Honda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panelFinalInfo.Visible = panPricing.Visible = false;

            //If the page is being loaded for the first time
            if (!Page.IsPostBack)
            {
                txtPhone.Visible = lblPhone.Visible = false;

                cboCarModel.Items.Add(new ListItem("Civic", "25000"));
                cboCarModel.Items.Add(new ListItem("DR-V", "30000"));
                cboCarModel.Items.Add(new ListItem("Appord", "33000"));
                cboCarModel.Items.Add(new ListItem("Cilot", "45000"));
                cboCarModel.Items.Add(new ListItem("Odyrrey", "54000"));

                lstInteriorColor.Items.Add(new ListItem("White", "0"));
                lstInteriorColor.Items.Add(new ListItem("Dark", "300"));
                lstInteriorColor.Items.Add(new ListItem("Pearl", "900"));

                lstInteriorColor.SelectedIndex = 0;

                chklstAccessories.Items.Add(new ListItem("Aero Kit", "1300"));
                chklstAccessories.Items.Add(new ListItem("Film", "600"));
                chklstAccessories.Items.Add(new ListItem("Cold Weather", "900"));
                chklstAccessories.Items.Add(new ListItem("Honda Emblem", "150"));
                chklstAccessories.Items.Add(new ListItem("Snow Tire Package", "1800"));

                radioButtonWarranty.Items.Add(new ListItem("3 Years(Included)", "0"));
                radioButtonWarranty.Items.Add(new ListItem("5 Years", "1000"));
                radioButtonWarranty.Items.Add(new ListItem("7 Years", "1500"));

                radioButtonWarranty.SelectedIndex = 0;
            }

            if (cboCarModel.SelectedIndex > 0)
            {
                calculatePrice();
                panPricing.Visible = true;
            }
        }

        private void calculatePrice()
        {
            decimal carPrice = 0, warranty = 0, accessories = 0, colorPrice = 0, totalWithoutTax = 0 ,totalWithTax = 0, tax = 0;

            carPrice = Convert.ToDecimal(cboCarModel.SelectedItem.Value) + Convert.ToDecimal(lstInteriorColor.SelectedItem.Value);
            litPricing.Text = "<br/>Car Price: $" + carPrice + "</br>";


            foreach (ListItem item in lstInteriorColor.Items)
            {
                //If an item is selected, add the value to the colorPrice else 0
                colorPrice += (item.Selected) ? Convert.ToDecimal(item.Value) : 0;
            }
            litPricing.Text += "Interior Color: $" + colorPrice + "</br>";

            foreach (ListItem item in chklstAccessories.Items)
            {
                //If an item is selected, add the value to the accessories else 0
                accessories += (item.Selected) ? Convert.ToDecimal(item.Value) : 0;
            }
            litPricing.Text += "Accessories: $" + accessories + "</br>";


            foreach (ListItem item in radioButtonWarranty.Items)
            {
                //If an item is selected, add the value to the warranty else 0
                warranty += (item.Selected) ? Convert.ToDecimal(item.Value) : 0;
            }
            litPricing.Text += "Warranty: $" + warranty + "</br></br></br>";

            totalWithoutTax = carPrice + colorPrice + accessories + warranty;
            litPricing.Text += "Total without taxes: $" + totalWithoutTax + "</br>";

            tax = Math.Round(totalWithoutTax * Convert.ToDecimal(0.15), 2);

            totalWithTax = Math.Round(tax + totalWithoutTax, 2);
            litPricing.Text += "Total with taxes(15%): $" + totalWithTax + "</br>";

        }

        protected void cboCarModel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void chkContact_CheckedChanged(object sender, EventArgs e)
        {
            lblPhone.Visible = txtPhone.Visible = chkContact.Checked;
        }

        protected void btnConclude_Click(object sender, EventArgs e)
        {
            panelFinalInfo.Visible = true;

            literalFinalInfo.Text = "Congratulation in obtaining your new Honda ";
            literalFinalInfo.Text += cboCarModel.SelectedItem.Text;
            literalFinalInfo.Text += " in " + txtCity.Text + ", " + txtZipCode.Text.ToUpper() + ".</br></br>";
            literalFinalInfo.Text += "Your car comes with " + lstInteriorColor.SelectedItem.Text + " interior color, ";

            if (chklstAccessories.SelectedIndex == -1)
            {
                literalFinalInfo.Text += " and no";
            }
            else
            {
                foreach (ListItem item in chklstAccessories.Items)
                {
                    literalFinalInfo.Text += item.Selected ? item.Text + ", " : "";
                }
            }

            literalFinalInfo.Text += " accessories.</br></br>";
            literalFinalInfo.Text += "You choosed " + radioButtonWarranty.SelectedItem.Text + " of warranty. ";
            literalFinalInfo.Text += chkContact.Checked ? "Our dealer Will contact you by phone number:<br/>" + txtPhone.Text + "." : "";
        }
    }
}