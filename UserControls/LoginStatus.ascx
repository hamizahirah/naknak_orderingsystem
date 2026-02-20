<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginStatus.ascx.cs" Inherits="NAKNAK.UserControls.LoginStatus" %>

<asp:HyperLink ID="HyperLinkLogIn" runat="server" NavigateUrl="~/LogIn.aspx">Log In</asp:HyperLink>
&nbsp;&nbsp;
<asp:HyperLink ID="HyperLinkSignUp" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>
&nbsp;&nbsp;

<asp:Label ID="lblLogInStatus" runat="server"></asp:Label>
&nbsp;&nbsp;
<asp:Button ID="btnLogOut" runat="server" Text="Log Out" OnClick="btnLogOut_Click" />