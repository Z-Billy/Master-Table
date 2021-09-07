<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASP._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h1>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>
                <asp:GridView ID="GV" runat="server" AutoGenerateColumns="false" AllowPaging="True"  PageSize="10" CellPadding="4"  ForeColor="#333333" GridLines="None"  Width="666px" OnSelectedIndexChanged="OnSelectedIndexChanged"  OnPageIndexChanging="GV_PageIndexChanging" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    <Columns>
                        <asp:BoundField ItemStyle-Width="150px" DataField="VoteNum" HeaderText="VoteNum">
                            <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ItemStyle-Width="150px" DataField="FileNum" HeaderText="FileNum">
                            <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ItemStyle-Width="150px" DataField="VoteDate" HeaderText="VoteDate">
                            <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Choose" Visible="true">
                        </asp:TemplateField>
                        <asp:ButtonField Text="Select" CommandName="Select"/>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" FirstPageText="First" LastPageText="Last"/>  
                </asp:GridView>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <u>Selected Row:</u>
                <br />
                <br />
                <asp:FormView ID="FormView0" runat="server">
                    <ItemTemplate>
                         <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    VoteNum:
                                </td>
                            <td>
                                   <%# Eval("VoteNum") %>
                            </td>
                            </tr>
                            <tr>
                                <td>
                                     FileNum:
                                </td>
                                <td>
                                    <%# Eval("FileNum") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    VoteDate:
                                </td>
                            <td>
                                   <%# Eval("VoteDate") %>
                            </td>
                            </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
                <asp:FormView ID="FormView1" runat="server">
                    <ItemTemplate>
                         <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    Area:
                                </td>
                            <td>
                                   <%# Eval("Area") %>
                            </td>
                            </tr>
                            <tr>
                                <td>
                                     Fine:
                                </td>
                                <td>
                                    <%# Eval("Fine") %>
                                </td>
                            </tr> 
                    </table>
                </ItemTemplate>
            </asp:FormView>
                <asp:FormView ID="FormView2" runat="server">
                    <ItemTemplate>
                         <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    ID:
                                </td>
                            <td>
                                   <%# Eval("ID") %>
                            </td>
                            </tr>
                            <tr>
                                <td>
                                     Explanation:
                                </td>
                                <td>
                                    <%# Eval("Explanation") %>
                                </td>
                            </tr> 
                    </table>
                </ItemTemplate>
            </asp:FormView>
            </h2>
            <h2><asp:Button ID="btnSave" runat="server" Height="44px" Text="Save" ValidateRequestMode="Enabled" Width="77px" OnClick="btnSave_Click" />
&nbsp;&nbsp;&nbsp;
            </h2>
            <h2>
                <asp:Button ID="btnEdit" runat="server" Height="44px" Text="Edit" Width="77px" OnClick="btnEdit_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </h2>
            <h2>
                <asp:Button ID="btnDelete" runat="server" Height="44px" Text="Delete" Width="120px" OnClick="btnDelete_Click" />
            </h2>
            <p>&nbsp;</p>
            <p>
                <asp:Label ID="Label1" runat="server" Font-Names="B Nazanin" Font-Size="Large" ForeColor="#000066" Text="شماره رای"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" Font-Names="B Nazanin" Font-Size="Small" TextMode="Number" ForeColor="#666666" ></asp:TextBox>
                </p>
            <p>
                &nbsp;<asp:Label ID="Label2" runat="server" Font-Names="B Nazanin" Font-Size="Large" ForeColor="#000066" Text="شماره پرونده"></asp:Label>
                &nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Font-Names="B Nazanin" Font-Size="Small" TextMode="Number" ForeColor="#666666" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;</p>
            <p>
                &nbsp;<asp:Label ID="Label3" runat="server" Font-Names="B Nazanin" Font-Size="Large" ForeColor="#000066" Text="تاریخ رای"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox3" runat="server" Font-Names="B Nazanin" Font-Size="Small" TextMode="Date" ForeColor="#666666" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
            <p>
                &nbsp;<asp:Label ID="Label4" runat="server" Font-Names="B Nazanin" Font-Size="Large" ForeColor="#000066" Text="متراژ"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox ID="TextBox4" runat="server" Font-Names="B Nazanin" Font-Size="Small" TextMode="Number"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</p>
            <p>
                <asp:Label ID="Label5" runat="server" Font-Names="B Nazanin" Font-Size="Large" ForeColor="#000066" Text="جریمه"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:TextBox ID="TextBox5" runat="server" Font-Names="B Nazanin" Font-Size="Small" TextMode="MultiLine" Width="258px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
            <p>
                <asp:Label ID="Label6" runat="server" Font-Names="B Nazanin" Font-Size="Large" ForeColor="#000066" Text="ID"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox6" runat="server" Font-Names="B Nazanin" Font-Size="Small" TextMode="Number"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
            <p>
                <asp:Label ID="Label7" runat="server" Font-Names="B Nazanin" Font-Size="Large" ForeColor="#000066" Text="شرح رای"></asp:Label>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="TextBox7" runat="server" Font-Names="B Nazanin" Font-Size="Small" TextMode="MultiLine" Width="248px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
            <p>
                &nbsp;</p>
        </div>
    </div>

</asp:Content>
