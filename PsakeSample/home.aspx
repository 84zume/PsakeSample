<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="PsakeSample.home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Products</title>
</head>
<body>
    <form id="form1" runat="server">
    <section>
        <h2>
            All Products</h2>
        <asp:GridView ID="ProductGridView" runat="server" 
        AutoGenerateColumns="False" DataSourceID="ProductObjectDataSource">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
        </asp:GridView>
    <asp:ObjectDataSource ID="ProductObjectDataSource" runat="server" 
        SelectMethod="GetAllProduct" TypeName="PsakeSample.Dao.ProductDao">
    </asp:ObjectDataSource>
    </section>
    </form>
</body>
</html>
