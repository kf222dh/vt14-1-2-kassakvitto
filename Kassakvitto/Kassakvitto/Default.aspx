<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Kassakvitto.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kassakvitto</title>
    <link href="~/Style.css" rel="stylesheet" />
</head>
<body>
    <form id="MyForm" runat="server">
        <div id="maincontainer">
            <h1>
                <asp:Label ID="TitleLabel" runat="server" Text="Kassakvitto"></asp:Label>
            </h1>
            <div id="content">
                <p>
                    <asp:Label ID="TextLabel" runat="server" Text="Total köpesumma:"></asp:Label>
                </p>

                <%-- Textbox samt validering --%>

                <p>

                    <asp:TextBox ID="MyTextBox" runat="server"></asp:TextBox>kr

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Det får inte vara tomt" ControlToValidate="MyTextBox" 
                        Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="Måste vara ett tal större än 0" ControlToValidate="MyTextBox" 
                        Type="Double" ValueToCompare="0" Operator="GreaterThan" Display="Dynamic">
                    </asp:CompareValidator>

                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                        ErrorMessage="Det är för stort belopp eller ogiltigt inmatning" ControlToValidate="MyTextBox" 
                        Type="Double" ValueToCompare="99999999" Operator="LessThan" Display="Dynamic">
                    </asp:CompareValidator>

                </p>
                <p>
                    <asp:Button ID="SendButton" runat="server" Text="Beräkna" OnClick="SendButton_Click" />
                </p>

                <%-- Kvitto --%>
                <asp:Panel ID="receiptPanel" runat="server" Visible="false">
                    <p>
                        <asp:Label ID="ReceiptLabel" runat="server" Text="Ica"></asp:Label><br />
                        <asp:Label ID="Label" runat="server" Text="Supermarket"></asp:Label>
                    </p>
                    <asp:Label ID="phoneLabel" runat="server" Text="Tel: 5555-55 55 55"></asp:Label><br />
                    <asp:Label ID="OpeningHoursLabel" runat="server" Text="Öppettider 6:00-23:00"></asp:Label><br />
                    <asp:Label ID="TotalTitleLabel" runat="server" Text="Totalt"></asp:Label>                 
                    <asp:Label ID="totalLabel" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="discountTitleLabel" runat="server" Text="Rabattsats"></asp:Label>
                    <asp:Label ID="DiscountLabel" runat="server" Text="Rabattsats"></asp:Label><br />
                    <asp:Label ID="SavingTitleLabel" runat="server" Text="Rabatt"></asp:Label>
                    <asp:Label ID="savingLabel" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="payTitleLabel" runat="server" Text="Att betala"></asp:Label>
                    <asp:Label ID="payLabel" runat="server" Text="Att betala"></asp:Label><br />
                    <asp:Label ID="BranschNoLabel" runat="server" Text="Org.Nr: 555555-5555"></asp:Label><br />
                    <asp:Label ID="GreetingsLabel" runat="server" Text="VÄLKOMMEN ÅTER!"></asp:Label>
                </asp:Panel>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        document.getElementById("MyTextBox").focus();
    </script>
</body>
</html>