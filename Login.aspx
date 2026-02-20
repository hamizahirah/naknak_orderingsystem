<%@ Page Language="C#" MasterPageFile="~/Naknak.Master" AutoEventWireup="true" 
    CodeBehind="Login.aspx.cs" Inherits="NAKNAK.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/login.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h2>Log In</h2>
        <div class="form-group">
            <label for="txtUsername">Enter your email/username:</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="input-field"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="* Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="txtPassword">Enter your password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="* Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" CssClass="btn-login" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblStatus" runat="server" Text="Status:" CssClass="status-label"></asp:Label>
        </div>
    </div>
</asp:Content>
