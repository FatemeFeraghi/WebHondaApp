<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Honda.aspx.cs" Inherits="WebApp_Honda_Fateme_Feraghialishah.Honda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HONDA</title>

    <style type="text/css">

        .header {
            text-align: center;
            margin-bottom: 10px;
            margin-top:10px;
            font-weight: 500;
            color:#FFEBA1;
        }

        .width-line {
            width: 630px;
            border-color:#FD6F96;
        }

        .width-table400 {
            width: 400px;
        }

        .style-label-phone {
            width: 100px;
            height: 50px;
        }

        .width-td270 {
            width: 270px;
        }

        .style-text-address {
            width: 270px;
            height: 50px;
        }

        .style-panel-price {
            margin-top: 0px;
            border-radius: 30px;
        }

        .auto-style-form {
            width: 580px;
            height: 740px;
            margin: auto;
        }

        .width-td100 {
            width: 100px;
        }

        .width-table500 {
            width: 500px;
        }

        .height-td120 {
            height: 120px;
        }

        .style-panel {
            border-radius: 30px;
        }

        .radius-box {
            border-radius: 5px;
        }

        .auto-styleInfo {
            margin-top: 0px;
            border-radius: 30px;
        }

        .button-info-margin {
            margin-top: 5px;
            float: right;
        }

    </style>

</head>
<body style="background-color:#6F69AC;font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">

        <div class="header">
            <h1>Honda Build & Price</h1>
            <hr />
            <p>
                <marquee direction="left" style="background-color:#FD6F96;color:#4B3869">Take advantage of Honda finance and lease options, Check out our offers, Don't miss it!</marquee>
            </p>
            <hr />
            <br />
        </div>

        <form id="form1" runat="server" class="auto-style-form">

        <table class="width-table500">
            <tr style="vertical-align: top">
                <td class="height-td120">

                    <asp:Panel ID="panHonda" CssClass="style-panel" BackColor="#95DAC1"
                        runat="server" GroupingText="Car Information" Height="100%" Width="450px">

                        <table class="width-table400">
                            <tr>
                                <td class="width-td100">
                                    <asp:Label ID="lblCity" runat="server" AccessKey="c" AssociatedControlID="txtCity" Text="Your City"></asp:Label>
                                </td>

                                <td class="width-td270">
                                    <asp:TextBox ID="txtCity" runat="server" CssClass="radius-box" Width="200px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="width-td100">
                                    <asp:Label ID="lblZipCode" runat="server" CssClass="radius-box" Text="Zip Code"></asp:Label>
                                </td>

                                <td class="width-td270">
                                    <asp:TextBox ID="txtZipCode" CssClass="radius-box" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="width-td100">
                                    <asp:Label ID="lblCarModel" runat="server" Text="Select Car Model"></asp:Label>
                                </td>

                                <td class="width-td270">
  <asp:DropDownList ID="cboCarModel" CssClass="radius-box" runat="server" OnSelectedIndexChanged="cboCarModel_SelectedIndexChanged" Width="200px" AutoPostBack="true">
                                        <asp:ListItem> Select one Car Model</asp:ListItem>
                                    </asp:DropDownList>                               
                                </td>
                            </tr>

                            <tr>
                                <td class="width-td100">
                                    <asp:Label ID="lblInteriorColor" runat="server" Text="Interior Color"></asp:Label>
                                </td>

                                <td class="width-td270">
                                    <asp:ListBox ID="lstInteriorColor" runat="server" CssClass="radius-box" AutoPostBack="true" Width="200px"></asp:ListBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="width-td100">
                                    <asp:Label ID="lblAccessories" runat="server" Text="Accessories"></asp:Label>
                                </td>

                                <td class="width-td270">
                                    <asp:CheckBoxList ID="chklstAccessories" runat="server" AutoPostBack="true"></asp:CheckBoxList>
                                </td>
                            </tr>

                            <tr>
                                <td class="width-td100">
                                    <asp:Label ID="lblWarranty" runat="server" Text="Warranty"></asp:Label>
                                </td>

                                <td class="width-td270">
                                    <asp:RadioButtonList ID="radioButtonWarranty" runat="server" AutoPostBack="true"></asp:RadioButtonList>
                                </td>
                            </tr>

                            <tr>
                                <td class="width-td100">
                                    <asp:Label ID="lblContact" runat="server" CssClass="radius-box" Text="Dealer Contact you by phone?"></asp:Label>
                                </td>

                                <td class="width-td270">
                                    <asp:CheckBox ID="chkContact" runat="server" OnCheckedChanged="chkContact_CheckedChanged" AutoPostBack="true"></asp:CheckBox>
                                </td>
                            </tr>


                            <tr>
                                <td class="style-label-phone">
                                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label>
                                </td>

                                <td class="width-td270">
                                    <asp:TextBox ID="txtPhone" TextMode="Phone" CssClass="radius-box" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                    </asp:Panel>
                </td>


                <td class="height-td120">
                    <asp:Panel ID="panPricing" runat="server" GroupingText="Price Resume" Height="280px" Width="250px" BackColor="#95DAC1" CssClass="style-panel-price">
                        <asp:Literal ID="litPricing" runat="server"></asp:Literal>
                        <asp:Button ID="btnConclude" runat="server" Text="Conclude" CssClass="button-info-margin" OnClick="btnConclude_Click" />
                    </asp:Panel>
                    <br />

                    <asp:Panel ID="panelFinalInfo" runat="server" CssClass="auto-styleInfo" GroupingText="Final Information" BackColor="#95DAC1">
                        <asp:Literal ID="literalFinalInfo" runat="server"></asp:Literal>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <div>
        </div>
    </form>
</body>
</html>
