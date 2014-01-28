using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kassakvitto
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            //Jobbar mot mina validatorer och endast om det är valid data så körs det innanför if satsen. 
            if (IsValid)
            {
                //Skapar hantag mot mitt affärslager, skickar in min indata och efter det hämtar jag ut data.
                var kvitto = new Model.Kvitto(double.Parse(MyTextBox.Text));
                receiptPanel.Visible = true;//Hanterar min panel som kapslar in data.
                totalLabel.Text = String.Format("{0:c}", kvitto.Subtotal);
                discountTitleLabel.Text = String.Format("{0:p0}", kvitto.DiscountRate);
                savingLabel.Text = String.Format("{0:c}", kvitto.MoneyOff);
                payTitleLabel.Text = String.Format("{0:c}", kvitto.Total);
            }

        }
    }
}